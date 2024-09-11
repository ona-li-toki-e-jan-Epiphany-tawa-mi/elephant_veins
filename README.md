![screenshot](screenshot.png)

# Elephant Veins

A mod for Minetest ([https://minetest.net](https://minetest.net)) that modifies
ore generation to replace the small sporadic ore pockets with sparse, gigantic
ore veins.

Currently compatible with:

- Mintest Game ([https://content.minetest.net/packages/Minetest/minetest_game](https://content.minetest.net/packages/Minetest/minetest_game))

## How to install

Place this directory into the mods folder in your Minetest directory.

## How to test

Dependencies:

- luacheck - [https://luarocks.org/modules/lunarmodules/luacheck](https://luarocks.org/modules/lunarmodules/luacheck)

There is a `flake.nix` you can use with `nix develop path:.` to generate a
development enviroment.

Then, run the following command(s):

```sh
luacheck .
```
