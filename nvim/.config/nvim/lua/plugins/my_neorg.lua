-- local present, neorg = pcall(require, "neorg")
-- if not present then
--     return
-- end
--
-- neorg.setup {
--     -- Tell Neorg what modules to load
--     load = {
--         ["core.keybinds"] = { -- Configure core.keybinds
--             config = {
--                 default_keybinds = true, -- Generate the default keybinds
--                 neorg_leader = "<Leader>o" -- This is the default if unspecified
--             }
--         },
--         ["core.norg.concealer"] = {}, -- Allows for use of icons
--         ["core.norg.dirman"] = { -- Manage your directories with Neorg
--             config = {
--                 workspaces = {
--                     my_workspace = "~/neorg"
--                 }
--             }
--         },
--         -- ["core.presenter"] = {
--         --     config = {
--         --     }
--         -- }, -- Manage your directories with Neorg
--         -- ["core.gtd.base"] = {
--         --     config = {
--         --         workspace = "example_gtd",
--         --     },
--         -- },
--     },
-- }

require('neorg').setup {
    load = { 
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/neorg/work",
                    home = "~/neorg/home",
                },
                default_workspace = "work",
            }
        }
    }
}
