local lsp = {}

lsp.config = function()
  local lsp_installer = require("nvim-lsp-installer")
  local cmp = require("cmp")
  local lsp_installer_servers = require("nvim-lsp-installer.servers")
  local luasnip = require("luasnip")
  local lsp_servers = {
    "angularls",
    "bashls",
    "cssls",
    "dockerls",
    "eslint",
    "emmet_ls",
    "gopls",
    "graphql",
    "html",
    "jsonls",
    "sumneko_lua",
    "pyright",
    "rust_analyzer",
    "sqlls",
    "svelte",
    "tailwindcss",
    "terraformls",
    "tsserver",
    "vimls",
    "volar",
    "yamlls",
  }

  local null_ls = require("null-ls")

  --- install servers if they don't exist
  for _, server in ipairs(lsp_servers) do
    local is_available, requested_server = lsp_installer_servers.get_server(server)

    if is_available and not requested_server:is_installed() then
      print("Installing LSP server " .. server)
      requested_server:install()
    end
  end

  --- setup servers
  local on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false

    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local opts = {
      noremap = true,
      silent = true,
    }
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
  lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,

      },
      capabilities = capabilities,
    }

    if server.name == "sumneko_lua" then
      opts.settings = {
        Lua = {
          diagnostics = {
            -- stop complaining about the `vim` global in neovim LSP
            globals = { "vim" },
          },
        },
      }
    end

    server:setup(opts)
  end)

  --- setup completion
  local key_down = function(fallback)
    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    elseif has_words_before() then
      cmp.complete()
    else
      fallback()
    end
  end

  local key_up = function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end

  --- global cmp config
  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = {
      ["<Tab>"] = cmp.mapping(key_down, { "i", "s" }),
      ["<Down>"] = cmp.mapping(key_down, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(key_up, { "i", "s" }),
      ["<Up>"] = cmp.mapping(key_up, { "i", "s" }),
      ["<cr>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
    }, {
      { name = "buffer" },
    }),
  })

  --- cmp search config
  cmp.setup.cmdline("/", {
    sources = { {
      name = "buffer",
    } },
  })

  --- cmp command line config
  cmp.setup.cmdline(":", {
    sources = cmp.config.sources({ {
      name = "path",
    } }, { {
      name = "cmdline",
    } }),
  })

  --- better completion defaults
  vim.o.completeopt = "menuone,noselect"

  --- null-ls
  null_ls.setup({
    sources = {
      null_ls.builtins.code_actions.eslint,
      null_ls.builtins.code_actions.shellcheck,

      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.diagnostics.fish,
      null_ls.builtins.diagnostics.pydocstyle,
      null_ls.builtins.diagnostics.pylint,
      null_ls.builtins.diagnostics.mypy,
      null_ls.builtins.diagnostics.shellcheck,
      null_ls.builtins.diagnostics.tsc,

      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.fish_indent,
      null_ls.builtins.formatting.gofmt,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.rustfmt,
      null_ls.builtins.formatting.stylua.with({
        args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
      }),
    },
    on_attach = function(client)
      if client.server_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()")
      end
    end,
  })
end

return lsp
