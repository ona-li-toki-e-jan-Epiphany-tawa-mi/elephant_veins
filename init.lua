-- This file is part of elephant_veins.
--
-- Copyright (c) 2024 ona-li-toki-e-jan-Epiphany-tawa-mi
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



-- Private namespace for internal functions.
local _elephant_veins = {}

--- Wrapper for minetest.log().
-- Adds a prefix to the text inidicating that the log message comes from
-- Elephant Veins.
-- @param level One of "none", "error", "warning", "action", "info", or "verbose".
-- @param text The log message.
function _elephant_veins.log(level, text)
   minetest.log(level, "[elephant_veins] " .. text)
end

--- Loads and executes an Elephant Veins Lua module.
-- @param path The file path of the module relative to the Elephant Veins mod
-- directory.
-- @return The return value of the Lua module.
function _elephant_veins.load_module(path)
   return loadfile(minetest.get_modpath("elephant_veins") .. "/" .. path)(_elephant_veins)
end

_elephant_veins.load_module("api.lua")
_elephant_veins.load_module("debug.lua")



-- Loads in settings.
local vein_scarcity_multipler  = elephant_veins.get_setting("vein_scarcity_multipler",  150)
local vein_ore_count_multipler = elephant_veins.get_setting("vein_ore_count_multipler", 150)
local vein_size_multipler      = elephant_veins.get_setting("vein_size_multipler",      6)

--- Returns whether the ore should be elephantified.
local function is_elephantifyable(ore)
   return "default:stone" == ore.wherein and "scatter" == ore.ore_type
end

--- Applies the Elephant Veins transformations to the ore.
local function elephantify_ore(ore)
   ore.clust_scarcity = ore.clust_scarcity * vein_scarcity_multipler
   ore.clust_num_ores = ore.clust_num_ores * vein_ore_count_multipler
   ore.clust_size     = ore.clust_size     * vein_size_multipler
end

--- Modifies the registered ores to generate the "elephant veins."
local function elephantify_ores()
   -- Modifying registered ores requires unregistering them and reregistering
   -- the modified copies.
   local registered_ores = table.copy(minetest.registered_ores)
   minetest.clear_registered_ores()

   for _, ore in pairs(registered_ores) do
      if is_elephantifyable(ore) then
         _elephant_veins.log("info", "elephantifying ore '" .. ore.ore .. "'")
         elephantify_ore(ore)
      end

      minetest.register_ore(ore)
   end
end
minetest.register_on_mods_loaded(elephantify_ores)
