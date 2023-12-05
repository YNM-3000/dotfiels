--[[When this value is set to v:false, running :GitMessenger or <plug>(git-messenger) again after showing a popup does not move the cursor in the window.]]
--see: https://github.com/rhysd/git-messenger.vim#variables
vim.g.git_messenger_always_into_popup = true
vim.g.git_messenger_floating_win_opts = { border = "rounded" } --more style see: https://neovim.io/doc/user/api.html#api-win_config
vim.g.git_messenger_popup_content_margins = false
