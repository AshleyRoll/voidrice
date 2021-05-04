-- Python
require'lspconfig'.pyright.setup{}

-- Bash
require'lspconfig'.bashls.setup{}

-- VIM
require'lspconfig'.vimls.setup{}

-- C++
require'lspconfig'.clangd.setup{}

-- CMake
require'lspconfig'.cmake.setup{}

-- OmniSharp
local pid = vim.fn.getpid()
-- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
local omnisharp_bin = "/usr/bin/omnisharp"
require'lspconfig'.omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
}






