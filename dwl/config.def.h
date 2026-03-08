/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }
/* appearance */
static const int sloppyfocus               = 1;  /* focus follows mouse */
static const int bypass_surface_visibility = 0;
static const unsigned int borderpx         = 1;
static const int showbar                   = 1;
static const int topbar                    = 1;
static const char *fonts[]                 = {"JetBrainsMono Nerd Font style=Bold:size=12"};
static const float rootcolor[]             = COLOR(0x000000ff);
static const float fullscreen_bg[]         = {0.0f, 0.0f, 0.0f, 1.0f};
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xbbbbbbff, 0x222222ff, 0x444444ff },
	[SchemeSel]  = { 0xeeeeeeff, 0x005577ff, 0x005577ff },
	[SchemeUrg]  = { 0,          0,          0x770000ff },
};

/* tagging */
static char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

/* logging */
static int log_level = WLR_ERROR;

static const Rule rules[] = {
	/* app_id             title       tags mask     isfloating   monitor */
	{ "Gimp_EXAMPLE",     NULL,       0,            1,           -1 },
	{ "firefox_EXAMPLE",  NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },
	{ "><>",      NULL },
	{ "[M]",      monocle },
};

/* monitors */
static const MonitorRule monrules[] = {
	{ NULL, 0.55f, 1, 1, &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL, -1, -1 },
};

/* keyboard */
static const struct xkb_rule_names xkb_rules = {
	.options = NULL,
};

static const int repeat_rate = 35;
static const int repeat_delay = 200;

/* Trackpad */
static const int tap_to_click = 1;
static const int tap_and_drag = 1;
static const int drag_lock = 1;
static const int natural_scrolling = 0;
static const int disable_while_typing = 1;
static const int left_handed = 0;
static const int middle_button_emulation = 0;
static const enum libinput_config_scroll_method scroll_method = LIBINPUT_CONFIG_SCROLL_2FG;
static const enum libinput_config_click_method click_method = LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS;
static const uint32_t send_events_mode = LIBINPUT_CONFIG_SEND_EVENTS_ENABLED;
static const enum libinput_config_accel_profile accel_profile = LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE;
static const double accel_speed = 0.0;
static const enum libinput_config_tap_button_map button_map = LIBINPUT_CONFIG_TAP_MAP_LRM;

/* If you want to use the windows key for MODKEY, use WLR_MODIFIER_LOGO */
#define MODKEY WLR_MODIFIER_LOGO

#define TAGKEYS(KEY,SKEY,TAG) \
	{ MODKEY,                                KEY,  view,      {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_CTRL,              KEY,  toggleview, {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_SHIFT,             SKEY, tag,        {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_CTRL|WLR_MODIFIER_SHIFT, SKEY, toggletag, {.ui = 1 << TAG} }

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

static const Key keys[] = {
	/* modifier                  key                       function          argument */

	/* Audio / Media keys */
	{ 0, XKB_KEY_XF86AudioMicMute,      spawn, SHCMD("~/.config/dunst/volume_brightness.sh mic_mute") },
	{ 0, XKB_KEY_XF86AudioRaiseVolume,  spawn, SHCMD("~/.config/dunst/volume_brightness.sh volume_up") },
	{ 0, XKB_KEY_XF86AudioLowerVolume,  spawn, SHCMD("~/.config/dunst/volume_brightness.sh volume_down") },
	{ 0, XKB_KEY_XF86AudioMute,         spawn, SHCMD("~/.config/dunst/volume_brightness.sh volume_mute") },
	{ 0, XKB_KEY_XF86MonBrightnessUp,   spawn, SHCMD("~/.config/dunst/volume_brightness.sh brightness_up") },
	{ 0, XKB_KEY_XF86MonBrightnessDown, spawn, SHCMD("~/.config/dunst/volume_brightness.sh brightness_down") },

	/* Launchers */
	{ MODKEY,                    XKB_KEY_Return,      spawn, SHCMD("kitty --title='Terminal'") },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_Return,      spawn, SHCMD("kitty --title='Terminal' --class='term-float'") },
	{ MODKEY,                    XKB_KEY_space,       spawn, SHCMD("rofi -show drun -dpi 1") },
	{ MODKEY,                    XKB_KEY_c,           spawn, SHCMD("rofi -show calc -no-show-match -no-sort") },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_s,           spawn, SHCMD("flameshot gui") },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_w,           spawn, SHCMD("bash ~/dotfiles/scripts/wallpaper-rofi.sh") },
	{ MODKEY,                    XKB_KEY_e,           spawn, SHCMD("thunar") },
	{ MODKEY,                    XKB_KEY_b,           spawn, SHCMD("helium-browser") },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_B,           spawn, SHCMD("blueman-manager") },

	/* Window management */
	{ MODKEY,                    XKB_KEY_q,           killclient,       {0} },
	{ MODKEY,                    XKB_KEY_f,           togglefullscreen, {0} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_f,           togglefloating,   {0} },

	/* Focus */
	{ MODKEY,                    XKB_KEY_h,           focusstack,       {.i = -1} },
	{ MODKEY,                    XKB_KEY_j,           focusstack,       {.i = +1} },
	{ MODKEY,                    XKB_KEY_k,           focusstack,       {.i = -1} },
	{ MODKEY,                    XKB_KEY_l,           focusstack,       {.i = +1} },

	/* Layouts */
	{ MODKEY,                    XKB_KEY_t,           setlayout,        {.v = &layouts[0]} },
	{ MODKEY,                    XKB_KEY_w,           setlayout,        {.v = &layouts[1]} },
	{ MODKEY,                    XKB_KEY_s,           setlayout,        {.v = &layouts[2]} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_p,           setlayout,        {0} },

	/* Master area */
	{ MODKEY,                    XKB_KEY_i,           incnmaster,       {.i = +1} },
	{ MODKEY,                    XKB_KEY_d,           incnmaster,       {.i = -1} },

	/* Misc */
	{ MODKEY,                    XKB_KEY_Tab,         view,             {0} },
	{ MODKEY,                    XKB_KEY_0,           view,             {.ui = ~0} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_parenright,  tag,              {.ui = ~0} },
	{ MODKEY,                    XKB_KEY_comma,       focusmon,         {.i = WLR_DIRECTION_LEFT} },
	{ MODKEY,                    XKB_KEY_period,      focusmon,         {.i = WLR_DIRECTION_RIGHT} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_less,        tagmon,           {.i = WLR_DIRECTION_LEFT} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_greater,     tagmon,           {.i = WLR_DIRECTION_RIGHT} },
	{ MODKEY,                    XKB_KEY_a,           zoom,             {0} },

	/* Tags (workspaces) */
	TAGKEYS( XKB_KEY_1, XKB_KEY_exclam,      0),
	TAGKEYS( XKB_KEY_2, XKB_KEY_at,          1),
	TAGKEYS( XKB_KEY_3, XKB_KEY_numbersign,  2),
	TAGKEYS( XKB_KEY_4, XKB_KEY_dollar,      3),
	TAGKEYS( XKB_KEY_5, XKB_KEY_percent,     4),
	TAGKEYS( XKB_KEY_6, XKB_KEY_asciicircum, 5),
	TAGKEYS( XKB_KEY_7, XKB_KEY_ampersand,   6),
	TAGKEYS( XKB_KEY_8, XKB_KEY_asterisk,    7),
	TAGKEYS( XKB_KEY_9, XKB_KEY_parenleft,   8),

	/* Quit */
	{ MODKEY|WLR_MODIFIER_SHIFT,              XKB_KEY_e,                quit, {0} },
	{ WLR_MODIFIER_CTRL|WLR_MODIFIER_ALT,     XKB_KEY_Terminate_Server, quit, {0} },

	/* VT switching */
#define CHVT(n) { WLR_MODIFIER_CTRL|WLR_MODIFIER_ALT, XKB_KEY_XF86Switch_VT_##n, chvt, {.ui = (n)} }
	CHVT(1), CHVT(2), CHVT(3), CHVT(4), CHVT(5), CHVT(6),
	CHVT(7), CHVT(8), CHVT(9), CHVT(10), CHVT(11), CHVT(12),
};

static const Button buttons[] = {
	{ ClkLtSymbol, 0,      BTN_LEFT,   setlayout,      {.v = &layouts[0]} },
	{ ClkLtSymbol, 0,      BTN_RIGHT,  setlayout,      {.v = &layouts[2]} },
	{ ClkTitle,    0,      BTN_MIDDLE, zoom,            {0} },
	{ ClkStatus,   0,      BTN_MIDDLE, spawn,           SHCMD("kitty --title='Terminal'") },
	{ ClkClient,   MODKEY, BTN_LEFT,   moveresize,      {.ui = CurMove} },
	{ ClkClient,   MODKEY, BTN_MIDDLE, togglefloating,  {0} },
	{ ClkClient,   MODKEY, BTN_RIGHT,  moveresize,      {.ui = CurResize} },
	{ ClkTagBar,   0,      BTN_LEFT,   view,            {0} },
	{ ClkTagBar,   0,      BTN_RIGHT,  toggleview,      {0} },
	{ ClkTagBar,   MODKEY, BTN_LEFT,   tag,             {0} },
	{ ClkTagBar,   MODKEY, BTN_RIGHT,  toggletag,       {0} },
};
