local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'php-language-server',
	'eslint',
	'sunmeko_lua'
})
lsp.setup()
