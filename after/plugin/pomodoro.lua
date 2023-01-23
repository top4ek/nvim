local ok, pomodoro = pcall(require, "pomodoro")
if not ok then return end

pomodoro.setup {
    time_work = 25,
    time_break_short = 5,
    time_break_long = 20,
    timers_to_long_break = 4
}

Set_keymap("n", "<Leader>ps", "<cmd>PomodoroStart<CR>")
Set_keymap("n", "<Leader>pe", "<cmd>PomodoroStop<CR>")
