return {
  lua_ls = {
    cmd = { "lua-language-server" },
    root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
    filetypes = { "lua" },
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    }
  },
  clangd = {
    cmd = {
      "clangd",
      "--function-arg-placeholders=0",
    },
    filetypes = { 'c', 'cpp', 'h', 'hpp', 'objc', 'objcpp', 'cuda' },
    root_markers = {
      '.clangd',
      '.clang-tidy',
      '.clang-format',
      'compile_commands.json',
      'compile_flags.txt',
      'configure.ac',
      '.git',
    },
    capabilities = {
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = false,
          },
          editsNearCursor = true,
        },
      },
      offsetEncoding = { 'utf-16' },
    },
  },
  basedpyright = {
    settings = {
      basedpyright = {
        analysis = {
          diagnosticMode = "workspace",
          indexingDefaultSeverity = "info",
          autoImportCompletions = true,
          useLibraryCodeForTypes = true,
        },
      },
    },
  },
  jdtls = {
    cmd = { "jdtls" },
    filetypes = { "java" },
    root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" },
    capabilities = require('blink.cmp').get_lsp_capabilities({
      textDocument = {
        synchronization = {
          didSave = true,
          willSave = false,
          willSaveWaitUntil = false,
        },
        completion = {
          completionItem = {
            snippetSupport = false
          }
        }
      }
    }),
    settings = {
      java = {
        completion = {
          guessMethodArguments = false,
        },
        signatureHelp = {
          enabled = true,
        },
        autobuild = {
          enabled = false,
        },
      },
    },
  },
}
