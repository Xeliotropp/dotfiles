#!/bin/bash

# Function to get volume - PipeWire first
function get_volume {
    # Try wpctl (PipeWire)
    local vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null | awk '{print int($2*100)}')
    
    # Fallback to pactl if PipeWire compatibility is enabled
    if [ -z "$vol" ]; then
        vol=$(pactl get-sink-volume @DEFAULT_SINK@ 2>/dev/null | grep -Po '\d+(?=%)' | head -1)
    fi
    
    # Fallback to amixer
    if [ -z "$vol" ]; then
        vol=$(amixer get Master 2>/dev/null | grep -Po '\d+(?=%)' | head -1)
    fi
    
    # Return 0 if nothing worked
    echo "${vol:-0}"
}

# Function to get mute status
function get_mute {
    # Try wpctl (PipeWire)
    if wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null | grep -q 'MUTED'; then
        echo "yes"
        return
    fi
    
    # Fallback to pactl
    local mute=$(pactl get-sink-mute @DEFAULT_SINK@ 2>/dev/null | grep -Po '(?<=Mute: )\w+')
    
    # Fallback to amixer
    if [ -z "$mute" ]; then
        amixer get Master 2>/dev/null | grep -q '\[off\]' && mute="yes" || mute="no"
    fi
    
    echo "${mute:-no}"
}

function get_volume_icon {
    local volume=$(get_volume)
    local mute=$(get_mute)
    
    # Ensure volume is a valid integer
    if ! [[ "$volume" =~ ^[0-9]+$ ]]; then
        volume=0
    fi
    
    if [ "$volume" -eq 0 ] || [ "$mute" == "yes" ]; then
        volume_icon="󰝟  "
    elif [ "$volume" -lt 50 ]; then
        volume_icon="  "
    else
        volume_icon="   "
    fi
}

function get_brightness_icon {
    brightness_icon=" "
}

# Handle the volume commands
case "$1" in
    volume_up)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ 2>/dev/null || \
        pactl set-sink-volume @DEFAULT_SINK@ +5% 2>/dev/null || \
        amixer set Master 5%+ 2>/dev/null
        
        get_volume_icon
        volume=$(get_volume)
        dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:volume -h int:value:"$volume" "$volume_icon $volume%"
        ;;
    volume_down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- 2>/dev/null || \
        pactl set-sink-volume @DEFAULT_SINK@ -5% 2>/dev/null || \
        amixer set Master 5%- 2>/dev/null
        
        get_volume_icon
        volume=$(get_volume)
        dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:volume -h int:value:"$volume" "$volume_icon $volume%"
        ;;
    volume_mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle 2>/dev/null || \
        pactl set-sink-mute @DEFAULT_SINK@ toggle 2>/dev/null || \
        amixer set Master toggle 2>/dev/null
        
        get_volume_icon
        mute=$(get_mute)
        if [ "$mute" == "yes" ]; then
            dunstify -a "changeVolume" -u low -i audio-volume-muted -h string:x-dunst-stack-tag:volume "󰝟  Muted"
        else
            volume=$(get_volume)
            dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:volume -h int:value:"$volume" "$volume_icon $volume%"
        fi
        ;;
    brightness_up)
        brightnessctl set 5%+ 2>/dev/null || \
        xbacklight -inc 5 2>/dev/null
        
        get_brightness_icon
        brightness=$(brightnessctl get 2>/dev/null || xbacklight -get 2>/dev/null | cut -d. -f1)
        brightness=${brightness:-0}
        dunstify -a "changeBrightness" -u low -i display-brightness -h string:x-dunst-stack-tag:brightness -h int:value:"$brightness" "$brightness_icon $brightness%"
        ;;
    brightness_down)
        brightnessctl set 5%- 2>/dev/null || \
        xbacklight -dec 5 2>/dev/null
        
        get_brightness_icon
        brightness=$(brightnessctl get 2>/dev/null || xbacklight -get 2>/dev/null | cut -d. -f1)
        brightness=${brightness:-0}
        dunstify -a "changeBrightness" -u low -i display-brightness -h string:x-dunst-stack-tag:brightness -h int:value:"$brightness" "$brightness_icon $brightness%"
        ;;
    *)
        echo "Usage: $0 {volume_up|volume_down|volume_mute|brightness_up|brightness_down}"
        exit 1
        ;;
esac
