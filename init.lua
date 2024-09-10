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
_elephant_veins.load_module("elephantify.lua")



-- Registers ores from default.
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
