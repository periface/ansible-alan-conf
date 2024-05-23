local client = vim.lsp.start_client {
    name = "my-lsp",
    cmd = { "/home/periface/proyectos/go/lsp-curso/main" },
    on_attach = function(client, bufnr)
        print("on_attach")
    end
}

if not client then
    vim.notify("No se pudo iniciar el cliente LSP")
    return
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.lsp.buf_attach_client(0, client)
    end

})
