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
      return tonumber(minetest.settings:get(setting_name)) or default
   elseif "boolean" == setting_type then
      local value = minetest.settings:get_bool(setting_name)
      if nil ~= value then return value else return default end
   else
      _elephant_veins.log("error", "elephant_veins.get_setting: unhandled type '"
                                   .. setting_type .. "' encountered with setting '"
                                   .. setting_name .. "'")
   end

   return default
end
