-- Core settings (before plugins)
require("usr.options")
require("usr.keymaps")

-- Plugins (lazy.nvim bootstrap + auto-discovers lua/usr/plugins/*.lua)
require("usr.lazy")
