local jdtls = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
local data_home = os.getenv('XDG_DATA_HOME')
local workspace_folder = data_home .. '/jdtls-ws/' .. vim.fn.fnamemodify(root_dir, ':p:h:t')

vim.opt_local.expandtab = true
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftround = true

local config = {
  cmd = {
    os.getenv('JDK21') .. '/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx4g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', vim.fn.glob(jdtls .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
    '-configuration', jdtls .. '/config_mac_arm',
    '-data', workspace_folder,
  },
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew', 'pom.xml'}),
  settings = {
    java = {
      autobuild = { enabled = false },
      maxConcurrentBuilds = 8,
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
      configuration = {
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
  },
  on_attach = require('vimc/lsp/common').make_conf().on_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities()
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
