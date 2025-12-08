local on_attach = function(client, bufnr)
  -- Add any key mappings or other setup here
end

return {
  {
    'neovim/nvim-lspconfig',
    ---@class PluginLspOpts
    config = function()
      vim.lsp.config('ltex', {
        on_attach = on_attach,
        cmd = { 'ltex-ls' },
        filetypes = { 'markdown', 'text' },
        flags = { debounce_text_changes = 300 },
      })
      vim.lsp.enable 'ltex'
    end,
  },
}
