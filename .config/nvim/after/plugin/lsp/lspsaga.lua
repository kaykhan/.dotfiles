local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
    return
end

saga.setup({
    lightbulb = {
        enable = false,
        enable_in_insert = false,
        sign = false,
        sign_priority = 40,
        virtual_text = true,
    },
    diagnostic = {
        on_insert = false,
    },
    -- keybinds for navigation in lspsaga window
    move_in_saga = { prev = "<C-k>", next = "<C-j>" },
    -- use enter to open file with finder
    finder_action_keys = {
        open = "<CR>",
    },
    -- use enter to open file with definition preview
    definition_action_keys = {
        edit = "<CR>",
    },
})
