local chatgpt_status_ok, chatgpt = pcall(require, 'chatgpt')
if not chatgpt_status_ok then
    return
end


chatgpt.setup({
    popup_input = {
        submit = "<Enter>",
    },
})
