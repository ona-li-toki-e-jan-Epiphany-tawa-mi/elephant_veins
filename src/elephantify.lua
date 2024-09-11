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

-- Ore vein elephantification module.

-- Imports private namespace.
local _elephant_veins = ...



local vein_scarcity_multipler  = elephant_veins.get_setting("vein_scarcity_multipler",  300)
local vein_ore_count_multipler = elephant_veins.get_setting("vein_ore_count_multipler", 150)
local vein_size_multipler      = elephant_veins.get_setting("vein_size_multipler",      9)

--- Returns whether the wherein values of two ores are equivalent.
local function compare_ore_whereins(wherein1, wherein2)
   local __func__ = "compare_ore_whereins"

   if type(wherein1) ~= type(wherein2) then return false end

   if "string" == type(wherein1) then
      return wherein1 == wherein2
   elseif "table" == type(wherein1) then
      for _, wherein1_block in pairs(wherein1) do
         if -1 == table.indexof(wherein2, wherein1_block) then return false end
      end
      return true
   else
      _elephant_veins.log("error", __func__ .. ": encountered unexpected wherein "
                                   .. "type '" .. type(wherein1) .. "'")
   end

   return false
end

--- Returns whether the ore should be elephantified.
local function is_elephantifyable(ore)
   for _, registered_ore in pairs(elephant_veins.registered_ores) do
      if ore.ore == registered_ore.ore and ore.ore_type == registered_ore.ore_type
         and compare_ore_whereins(ore.wherein, registered_ore.wherein)
      then
         return true
      end
   end

   return false
end

--- Applies the Elephant Veins transformations to the ore.
local function elephantify_ore(ore)
   ore.clust_scarcity = ore.clust_scarcity * vein_scarcity_multipler
   ore.clust_num_ores = ore.clust_num_ores * vein_ore_count_multipler
   ore.clust_size     = ore.clust_size     * vein_size_multipler
end

--- Modifies the registered ores to generate the "elephant veins."
local function elephantify_ores()
   local __func__ = "elephantify_ores"

   -- Modifying registered ores requires unregistering them and reregistering
   -- the modified copies.
   local registered_ores = table.copy(minetest.registered_ores)
   minetest.clear_registered_ores()

   for _, ore in pairs(registered_ores) do
      if is_elephantifyable(ore) then
         _elephant_veins.log("info", __func__ .. ": elephantifying ore '" .. ore.ore .. "'")
         elephantify_ore(ore)
      else
         _elephant_veins.log("info", __func__ .. ": skipping ore '" .. ore.ore .. "'")
      end

      minetest.register_ore(ore)
   end
end
minetest.register_on_mods_loaded(elephantify_ores)
