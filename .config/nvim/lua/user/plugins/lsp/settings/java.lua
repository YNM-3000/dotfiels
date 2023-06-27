-- Java Language Server configuration.

local config = {}
local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
	vim.notify("JDTLS not found, install with `:MasonInstall jdtls`")
	return config
end

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local jdtls_path = vim.fn.stdpath("data") .. "/mason/share/jdtls"

-- For linux, use ./config_linux. For windows, use ./config_win. For mac/OS X, use ./config_mac.
-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
local function get_config_dir()
	-- Unlike some other programming languages (e.g. JavaScript)
	-- lua considers 0 truthy!
	if vim.fn.has("linux") == 1 then
		return "config_linux"
	elseif vim.fn.has("mac") == 1 then
		return "config_mac"
	else
		return "config_win"
	end
end
local path_to_lsp_server = jdtls_path .. "/" .. get_config_dir()

local path_to_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local lombok_path = jdtls_path .. "/lombok.jar"

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
	return config
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.expand("~/.cache/jdtls/workspace/local/") .. project_name
os.execute("mkdir " .. workspace_dir)

local java_home = "/usr/lib/jvm/java-20-openjdk/bin/java"

-- Main Config
config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. lombok_path,
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-jar",
		path_to_jar,
		"-configuration",
		path_to_lsp_server,
		"-data",
		workspace_dir,
	},

	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- One dedicated LSP server & client will be started per unique root_dir
	root_dir = root_dir,

	-- Here you can configure eclipse.jdt.ls specific settings
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	-- for a list of options
	settings = {
		java = {
			home = java_home,
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
				runtimes = {
					{
						name = "JavaSE-18",
						path = java_home,
					},
					{
						name = "JavaSE-17",
						path = java_home,
					},
				},
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
		},
		signatureHelp = { enabled = true },
		completion = {
			favoriteStaticMembers = {
				"org.hamcrest.MatcherAssert.assertThat",
				"org.hamcrest.Matchers.*",
				"org.hamcrest.CoreMatchers.*",
				"org.junit.jupiter.api.Assertions.*",
				"java.util.Objects.requireNonNull",
				"java.util.Objects.requireNonNullElse",
				"org.mockito.Mockito.*",
			},
			importOrder = {
				"java",
				"javax",
				"com",
				"org",
			},
		},
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
			},
			useBlocks = true,
		},
	},

	flags = {
		allow_incremental_sync = true,
	},
	init_options = {
		bundles = {},
		-- https://github.com/eclipse/eclipse.jdt.ls/wiki/Language-Server-Settings-&-Capabilities#extended-client-capabilities
		extendedClientCapabilities = jdtls.extendedClientCapabilities,
	},
}

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)

return config
