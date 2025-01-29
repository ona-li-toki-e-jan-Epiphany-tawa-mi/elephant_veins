-- This file is part of elephant_veins.
--
-- Copyright (c) 2024-2025 ona-li-toki-e-jan-Epiphany-tawa-mi
--
-- elephant_veins is free software: you can redistribute it and/or modify it
-- under the terms of the GNU Lesser General Public License as published by the
-- Free Software Foundation, either version 3 of the License, or (at your
-- option) any later version.
--
-- elephant_veins is distributed in the hope that it will be useful, but WITHOUT
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
-- FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
-- details.
--
-- You should have received a copy of the GNU Lesser General Public License
-- along with elephant_veins. If not, see <https://www.gnu.org/licenses/>.

--- Common type aliases for lua-language-server static type checking.

--------------------------------------------------------------------------------
-- Core                                                                       --
--------------------------------------------------------------------------------

--- @alias OreWherein string|string[]
--- @alias ScatterOre {
---     ore_type: "scatter",
---     ore: string,
---     wherein: OreWherein,
---     clust_scarcity: integer,
---     clust_num_ores: integer,
---     clust_size: integer,
--- }
--- @alias Ore any|ScatterOre

--- @alias LogLevel "none" | "error" | "warning" | "action" | "info" | "verbose"

--- @alias Settings {
---     get: (fun(self: Settings, key: string, default?: any): any|nil),
---     get_bool: (fun(self: Settings, key: string, default?: boolean): boolean|nil),
--- }
--- @alias GameInfo {
---     id: string,
--- }
--- @type {
---     registered_ores: table<string, Ore>,
---     settings: Settings,
---     log: fun(level: LogLevel|nil, text: string),
---     get_modpath: (fun(modname: string): string|nil),
---     register_on_mods_loaded: fun(callback: fun()),
---     register_ore: fun(ore: Ore),
---     clear_registered_ores: fun(),
---     get_game_info: (fun(): GameInfo),
--- }
core = {}

--- @param table table
--- @return table
function table.copy(table) return {} end

--- @param list any[]
--- @param val any
--- @return integer
function table.indexof(list, val) return 0 end

-- @param obj any
-- @param dumped? table
-- @return string
function dump(obj, dumped) return "" end

--------------------------------------------------------------------------------
-- Mineclonia, VoxeLibre, etc.                                                --
--------------------------------------------------------------------------------

-- --- @type {}
-- mcl_vars = {}

-- --- @type {}
-- mcl_tools = {}

-- --- From mcl_utils
-- --- @param t table
-- --- @param ... table
-- --- @return table
-- function table.merge(t, ...) return {} end
