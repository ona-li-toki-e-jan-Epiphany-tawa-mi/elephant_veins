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

-- Returns whether the mod with the given name is enabled.
function _elephant_veins.is_mod_enabled(name)
   return nil ~= minetest.get_modpath(name)
end



_elephant_veins.load_module("src/api.lua")
_elephant_veins.load_module("src/debug.lua")
_elephant_veins.load_module("src/elephantify.lua")



-- Minetest Game support.
if _elephant_veins.is_mod_enabled("default") then
   _elephant_veins.log("info", "registering ores for mod 'default'")
   elephant_veins.register_ore({
         ore      = "default:stone_with_coal",
         ore_type = "scatter",
         wherein  = "default:stone"
   })
   elephant_veins.register_ore({
         ore      = "default:stone_with_copper",
         ore_type = "scatter",
         wherein  = "default:stone"
   })
   elephant_veins.register_ore({
         ore      = "default:stone_with_iron",
         ore_type = "scatter",
         wherein  = "default:stone"
   })
   elephant_veins.register_ore({
         ore      = "default:stone_with_tin",
         ore_type = "scatter",
         wherein  = "default:stone"
   })
   elephant_veins.register_ore({
         ore      = "default:stone_with_gold",
         ore_type = "scatter",
         wherein  = "default:stone"
   })
   elephant_veins.register_ore({
         ore      = "default:stone_with_diamond",
         ore_type = "scatter",
         wherein  = "default:stone"
   })
   elephant_veins.register_ore({
         ore      = "default:stone_with_mese",
         ore_type = "scatter",
         wherein  = "default:stone"
   })
end

-- Mineclonia support.
if _elephant_veins.is_mod_enabled("mcl_core") then
   _elephant_veins.log("info", "registering ores for mod 'mcl_core'")
   elephant_veins.register_ore({
         ore      = "mcl_core:stone_with_coal",
         ore_type = "scatter",
         wherein  = {
            "mcl_core:stone",
            "mcl_core:diorite",
            "mcl_core:andesite",
            "mcl_core:granite"
         }
   })
   elephant_veins.register_ore({
         ore      = "mcl_core:stone_with_iron",
         ore_type = "scatter",
         wherein  = {
            "mcl_core:stone",
            "mcl_core:diorite",
            "mcl_core:andesite",
            "mcl_core:granite"
         }
   })
   elephant_veins.register_ore({
         ore      = "mcl_core:stone_with_gold",
         ore_type = "scatter",
         wherein  = {
            "mcl_core:stone",
            "mcl_core:diorite",
            "mcl_core:andesite",
            "mcl_core:granite"
         }
   })
   elephant_veins.register_ore({
         ore      = "mcl_core:stone_with_lapis",
         ore_type = "scatter",
         wherein  = {
            "mcl_core:stone",
            "mcl_core:diorite",
            "mcl_core:andesite",
            "mcl_core:granite"
         }
   })
   elephant_veins.register_ore({
         ore      = "mcl_core:stone_with_redstone",
         ore_type = "scatter",
         wherein  = {
            "mcl_core:stone",
            "mcl_core:diorite",
            "mcl_core:andesite",
            "mcl_core:granite"
         }
   })
   elephant_veins.register_ore({
         ore      = "mcl_core:stone_with_diamond",
         ore_type = "scatter",
         wherein  = {
            "mcl_core:stone",
            "mcl_core:diorite",
            "mcl_core:andesite",
            "mcl_core:granite"
         }
   })
   elephant_veins.register_ore({
         ore      = "mcl_core:stone_with_emerald",
         ore_type = "scatter",
         wherein  = {
            "mcl_core:stone",
            "mcl_core:diorite",
            "mcl_core:andesite",
            "mcl_core:granite"
         }
   })
end
if _elephant_veins.is_mod_enabled("mcl_copper") then
   _elephant_veins.log("info", "registering ores for mod 'mcl_copper'")
   elephant_veins.register_ore({
         ore      = "mcl_copper:stone_with_copper",
         ore_type = "scatter",
         wherein  = {
            "mcl_core:stone",
            "mcl_core:diorite",
            "mcl_core:andesite",
            "mcl_core:granite"
         }
   })
end
if _elephant_veins.is_mod_enabled("mcl_deepslate") then
   _elephant_veins.log("info", "registering ores for mod 'mcl_deepslate'")
   elephant_veins.register_ore({
         ore      = "mcl_deepslate:deepslate_with_coal",
         ore_type = "scatter",
         wherein  = {
            "mcl_deepslate:deepslate",
            "mcl_deepslate:tuff"
         }
   })
   elephant_veins.register_ore({
         ore      = "mcl_deepslate:deepslate_with_copper",
         ore_type = "scatter",
         wherein  = {
            "mcl_deepslate:deepslate",
            "mcl_deepslate:tuff"
         }
   })
   elephant_veins.register_ore({
         ore      = "mcl_deepslate:deepslate_with_iron",
         ore_type = "scatter",
         wherein  = {
            "mcl_deepslate:deepslate",
            "mcl_deepslate:tuff"
         }
   })
   elephant_veins.register_ore({
         ore      = "mcl_deepslate:deepslate_with_gold",
         ore_type = "scatter",
         wherein  = {
            "mcl_deepslate:deepslate",
            "mcl_deepslate:tuff"
         }
   })
   elephant_veins.register_ore({
         ore      = "mcl_deepslate:deepslate_with_lapis",
         ore_type = "scatter",
         wherein  = {
            "mcl_deepslate:deepslate",
            "mcl_deepslate:tuff"
         }
   })
   elephant_veins.register_ore({
         ore      = "mcl_deepslate:deepslate_with_redstone",
         ore_type = "scatter",
         wherein  = {
            "mcl_deepslate:deepslate",
            "mcl_deepslate:tuff"
         }
   })
   elephant_veins.register_ore({
         ore      = "mcl_deepslate:deepslate_with_diamond",
         ore_type = "scatter",
         wherein  = {
            "mcl_deepslate:deepslate",
            "mcl_deepslate:tuff"
         }
   })
   elephant_veins.register_ore({
         ore      = "mcl_deepslate:deepslate_with_emerald",
         ore_type = "scatter",
         wherein  = {
            "mcl_deepslate:deepslate",
            "mcl_deepslate:tuff"
         }
   })
end
if _elephant_veins.is_mod_enabled("mcl_nether") then
   _elephant_veins.log("info", "registering ores for mod 'mcl_nether'")
   elephant_veins.register_ore({
         ore      = "mcl_nether:quartz_ore",
         ore_type = "scatter",
         wherein  = {
            "mcl_nether:netherrack"
         }
   })
    elephant_veins.register_ore({
          ore      = "mcl_nether:ancient_debris",
          ore_type = "scatter",
          wherein  = {
             "mcl_nether:netherrack",
             "mcl_blackstone:blackstone",
             "mcl_blackstone:basalt"
          }
    })
end
if _elephant_veins.is_mod_enabled("mcl_blackstone") then
   _elephant_veins.log("info", "registering ores for mod 'mcl_blackstone'")
   elephant_veins.register_ore({
         ore      = "mcl_blackstone:nether_gold",
         ore_type = "scatter",
         wherein  = "mcl_nether:netherrack"
   })
end
