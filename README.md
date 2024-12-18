![screenshot](screenshot.png)

# Elephant Veins

A mod for Luanti [https://www.luanti.org](https://www.luanti.org/) that modifies
ore generation to replace the small sporadic ore pockets with sparse, gigantic
ore veins.

The size, density, and frequency of ore veins are configurable in the settings
menu.

Currently compatible with the following games:

- Minetest Game - [https://content.luanti.org/packages/Minetest/minetest_game](https://content.luanti.org/packages/Minetest/minetest_game)
- Mineclonia - [https://content.luanti.org/packages/ryvnf/mineclonia](https://content.luanti.org/packages/ryvnf/mineclonia)

It should theoretically work with VoxeLibre
[https://content.luanti.org/packages/Wuzzy/mineclone2](https://content.luanti.org/packages/Wuzzy/mineclone2)
too, but it only seems to generate iron and copper in the overworld.

When playing with Mineclonia, I recommend using the following settings instead
of the defaults:

- Vein scarcity multiplier - 350.
- Vein ore count multiplier - 1000.
- Vein size multiplier - 10.

## How to install

You can install it from ContentDB
[https://content.luanti.org/packages/ona-li-toki-e-jan-Epiphany-tawa-mi/elephant_veins](https://content.luanti.org/packages/ona-li-toki-e-jan-Epiphany-tawa-mi/elephant_veins).

Or, you can place this directory, or symlink it, into the mods folder in your
Minetest directory.

## How to test

Dependencies:

- luacheck - [https://github.com/lunarmodules/luacheck](https://github.com/lunarmodules/luacheck)

There is a `flake.nix` you can use with `nix develop` to generate a development
enviroment.

Then, run the following command(s):

```sh
luacheck .
```

## API

There is an API for other mods to register their ores with Elephant Veins, see
`src/api.lua` for details.

## Release notes

- Switched from `minetest` namespace to `core`.
- Replaced error logging in API and elsewhere with assertions.
- Set development state to maintenence only.
