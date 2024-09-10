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



-- Modifies the registered ores to generate the "elephant veins."
local function elephantify_ores()
   -- Modifying registered ores requires unregistering them and reregistering
   -- the modified copies.
   local registered_ores = table.copy(minetest.registered_ores)
   minetest.clear_registered_ores()

   for _, ore in pairs(registered_ores) do
      if "default:stone" == ore.wherein and "scatter" == ore.ore_type then
         minetest.log("info", "Elephant Veins: elephantifying ore '" .. ore.ore .. "'")

         ore.clust_scarcity = ore.clust_scarcity * 150
         ore.clust_num_ores = ore.clust_num_ores * 150
         ore.clust_size     = ore.clust_size     * 6
      end

      minetest.register_ore(ore)
   end
end

minetest.register_on_mods_loaded(elephantify_ores)
