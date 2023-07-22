-- Git related plugins
return {
    {
        'lewis6991/gitsigns.nvim',
        init = function()
            -- load gitsigns only when a git file is opened
            vim.api.nvim_create_autocmd({ 'BufRead' }, {
                group = vim.api.nvim_create_augroup('GitSignsLazyLoad', { clear = true }),
                callback = function()
                    vim.fn.system('git -C ' .. '"' .. vim.fn.expand('%:p:h') .. '"' .. ' rev-parse')
                    if vim.v.shell_error == 0 then
                        vim.api.nvim_del_augroup_by_name('GitSignsLazyLoad')
                        vim.schedule(function()
                            require('lazy').load { plugins = { 'gitsigns.nvim' } }
                        end)
                    end
                end,
            })
        end,
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },
    {
    'tpope/vim-fugitive',
        config = function ()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local Robot_Fugitive = vim.api.nvim_create_augroup("Robot_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = Robot_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "<leader>po", function()
            vim.cmd.Git('push origin')
        end, opts)

        -- rebase always
        vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git({'pull',  '--rebase'})
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
    end,
})
        end
    },
    'tpope/vim-rhubarb',
}

