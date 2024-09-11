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

-- Debugging module.

-- Imports private namespace.
_elephant_veins = ...



local do_ore_dump = elephant_veins.get_setting("do_ore_dump_logging", false)

--- Logs a dump of all registered ores.
local function log_ore_dump()
   local __func__ = "log_ore_dump"

   for _, ore in pairs(minetest.registered_ores) do
      _elephant_veins.log("warning", __func__ .. ": " .. dump(ore))
   end
end

if do_ore_dump then
   minetest.register_on_mods_loaded(log_ore_dump)
end
