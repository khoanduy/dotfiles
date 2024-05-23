local jdtls = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
local data_home = os.getenv('XDG_DATA_HOME')
local workspace_folder = data_home .. '/jdtls/workspace/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

vim.opt_local.expandtab = true
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftround = true

-- Debugging
local bundles = {
  vim.fn.glob(data_home .. '/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar'),
}

-- Running or debugging unit tests
vim.list_extend(bundles, vim.split(vim.fn.glob(data_home .. '/nvim/mason/share/java-test/*.jar', 1), '\n'))

local config = {
  cmd = {
    os.getenv('JDK17') .. '/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx8G',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', vim.fn.glob(jdtls .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
    '-configuration', jdtls .. '/config_mac',
    '-data', workspace_folder,
  },
  root_dir = require('jdtls.setup').find_root({ 'pom.xml', '.git', 'mvnw', 'gradlew' }),
  settings = {
    java = {
      home = os.getenv('JAVA_HOME'),
      eclipse = { downloadSources = true },
      autobuild = { enabled = false },
      maxConcurrentBuilds = 10,
      signatureHelp = { enabled = true },
      saveActions = {
        organizeImports = false,
      },
      sources = {
        organizeImports = {
          starThreshold = 9999;
          staticStarThreshold = 9999;
        },
      },
      codeGeneration = {
        toString = {
          template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}'
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },
      maven = { downloadSources = true },
      references = { includeDecompiledSources = true },
      implementationsCodeLens = { enabled = true },
      referencesCodeLens = { enabled = true },
      configuration = {
        updateBuildConfiguration = 'interactive',
        runtimes = {
          {
            name = 'JavaSE-11',
            path = os.getenv('JDK11'),
          },
          {
            name = 'JavaSE-17',
            path = os.getenv('JDK17'),
          },
          {
            name = 'JavaSE-21',
            path = os.getenv('JDK21'),
          },
        },
      },
    },
    signatureHelp = {
      enabled = true
    },
    extendedClientCapabilities = jdtls.extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
      },
      useBlocks = true,
    },
  },
  flags = { allow_incremental_sync = true },
  init_options = { bundles = bundles },
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = require('lsp/common').make_conf().on_attach
}

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
