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

-- API module for this and other mods to interface with.

-- Imports private namespace.
local _elephant_veins = ...



-- Global namespace.
elephant_veins = {}

--- Returns the value of an Elephant Veins setting.
-- @param setting The name of the setting without the namespace.
-- @param default The default value of the setting.
-- @return The settings value, or default if it is not set or doesn't exist.
function elephant_veins.get_setting(setting, default)
   local __func__ = "elephant_veins.get_setting"

   local setting_type = type(default)
   local setting_name = "elephant_veins" .. "." .. setting

   if "number" == setting_type then
      return tonumber(minetest.settings:get(setting_name)) or default
   elseif "boolean" == setting_type then
      local value = minetest.settings:get_bool(setting_name)
      if nil ~= value then return value else return default end
   else
      _elephant_veins.log("error", __func__ .. ": unhandled type '" .. setting_type
                                   .. "' encountered with setting '" .. setting_name .. "'")
   end

   return default
end



--- A table of the ores registered with Elephant Veins to be elephantized.
-- The ores registered by minetest.register_ore() will be compared against these
--   ores. If they have the same name, type, and occur in the same blocks as one
--   of the ores in this table, they will be elephantized.
-- Do not edit directly, use elephant_veins.register_ore() instead.
elephant_veins.registered_ores = {}

--- Registers an ore with Elephant Veins to be elephantized.
-- NOTE: only ores with type "scatter" are currently supported.
-- @param ore The ore to register. This is the same as with minetest.register_ore().
-- @return Whether the ore was successfully registered.
function elephant_veins.register_ore(ore)
   local __func__ = "elephant_veins.register_ore"

   if "table" ~= type(ore) then
      _elephant_veins.log("error", __func__ .. ": got invalid ore '" .. dump(ore)
                                   .. "'. Expected table, got '" .. type(ore) .. "'")
      return false
   end

   -- Thusfar, the only ores to elephantize have been of type scatter.
   if "scatter" ~= ore.ore_type then
      _elephant_veins.log("error", __func__ .. ": unhandled ore.ore_type '"
                                   .. dump(ore.ore_type)
                                   .. "'. Expected one of: \"scatter\"")
      return false
   end

   if "string" ~= type(ore.ore) then
      _elephant_veins.log("error", __func__ .. ": got invalid ore.ore '" .. dump(ore.ore)
                                   .. "'. Expected string, got '" .. type(ore.ore) .. "'")
      return false
   end

   if "table" == type(ore.wherein) then
      for _, value in pairs(ore.wherein) do
         if "string" ~= type(value) then
            _elephant_veins.log("error", __func__ .. ": got invalid ore.wherein '"
                                   .. dump(ore.wherein)
                                   .. "'. Expected string or table of strings, but found "
                                   .. "a '" .. type(ore.wherein) .. "' in the table")
            return false
         end
      end
   elseif "string" ~= type(ore.wherein) then
      _elephant_veins.log("error", __func__ .. ": got invalid ore.wherein '"
                                   .. dump(ore.wherein)
                                   .. "'. Expected string or table of strings, got '"
                                   .. type(ore.wherein) .. "'")
      return false
   end

   _elephant_veins.log("verbose", __func__  .. ": registered ore '" .. ore.ore .. "'")
   table.insert(elephant_veins.registered_ores, ore)
   return true
end
