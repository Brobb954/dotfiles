return {
  "mrcjkb/rustaceanvim",
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = {
      dap = {
        adapter = require("rustaceanvim.config").get_codelldb_adapter(
          "@vscode-lldb@/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb",
          "@vscode-lldb@/share/vscode/extensions/vadimcn.vscode-lldb/lldb/lib/liblldb.so"
        ),
      },
      server = {
        on_attach = function()
          vim.keymap.set("n", "K", function()
            vim.cmd.RustLsp({ "hover", "actions" })
          end, { buffer = bufnr })
        end,
        capabilities = {
          textDocument = {
            completion = {
              completionItem = {
                snippetSupport = false,
              },
            },
          },
        },
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            checkOnSave = {
              allFeatures = true,
              command = "clippy",
              ignore = { "unused_imports" },
              extraArgs = { "--no-deps" },
              procMacro = {
                enable = true,
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                },
              },
            },
          },
        },
      },
    }
  end,
}
