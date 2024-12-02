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
   local setting_type = type(default)
   local setting_name = "elephant_veins" .. "." .. setting

   if "number" == setting_type then
      return tonumber(core.settings:get(setting_name)) or default
   elseif "boolean" == setting_type then
      local value = core.settings:get_bool(setting_name)
      if nil ~= value then return value else return default end
   else
      assert(
         false,
         "unhandled type '" .. setting_type .. "' encountered with setting '"
         .. setting_name .. "'"
      )
   end

   return default
end



--- A table of the ores registered with Elephant Veins to be elephantized.
-- The ores registered by core.register_ore() will be compared against these
--   ores. If they have the same name, type, and occur in the same blocks as one
--   of the ores in this table, they will be elephantized.
-- Do not edit directly, use elephant_veins.register_ore() instead.
elephant_veins.registered_ores = {}

--- Registers an ore with Elephant Veins to be elephantized.
-- NOTE: only ores with type "scatter" are currently supported.
-- @param ore The ore to register. This is the same as with core.register_ore().
function elephant_veins.register_ore(ore)
   local __func__ = "elephant_veins.register_ore"

   assert(
      "table" == type(ore),
      "expected table for ore parameter, got '" .. type(ore) .. "'"
   )

   -- Thusfar, the only ores to elephantize have been of type scatter.
   assert(
      "scatter" == ore.ore_type,
      "got invalid ore.ore_type '" .. dump(ore.ore_type)
      .. "': expected one of: \"scatter\""
   )

   assert(
      "string" == type(ore.ore),
      "got invalid ore.ore '" .. dump(ore.ore) .. "': expected string, got '"
      .. type(ore.ore) .. "'"
   )

   local wherein_type = type(ore.wherein)
   assert(
      "table" == wherein_type or "string" == wherein_type,
      "got invalid ore.wherein '" .. dump(ore.wherein)
      .. "'. Expected string or table of strings, got '" .. wherein_type
      .. "'"
   )
   if "table" == wherein_type then
      for i, value in pairs(ore.wherein) do
         assert(
            "string" == type(value),
            "got invalid ore.wherein '" .. dump(ore.wherein)
            .. "'. Expected string or table of strings, but found a '"
            .. wherein_type .. "' in the table at index '" .. dump(i)
            .. "'"
         )
      end
   end

   _elephant_veins.log(
      "verbose",
      __func__  .. ": registered ore '" .. ore.ore .. "'"
   )

   table.insert(elephant_veins.registered_ores, ore)
end
