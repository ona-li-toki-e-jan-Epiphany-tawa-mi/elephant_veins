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
