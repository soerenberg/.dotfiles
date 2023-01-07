-- vim.cmd.colorscheme("solarized")

-- vim.cmd("set background=dark")
-- vim.cmd('let g:solarized_contrast = "high"')
-- vim.cmd('let g:solarized_termtrans = 1')
-- vim.cmd('colorscheme solarized')

function ColorScheme(color)
	color = color or "rose-pine"

    vim.cmd("set termguicolors")
    if color == "solarized" then
        vim.cmd("set notermguicolors")
    end
	vim.cmd.colorscheme(color)

    vim.cmd("set background=dark")

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function Solarized()
    ColorScheme("solarized")
end

function Catppuccin()
    ColorScheme("catppuccin_frappe")
end

function Pinkmare()
    ColorScheme("pinkmare")
end

ColorScheme()
