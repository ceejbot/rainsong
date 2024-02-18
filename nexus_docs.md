A Skyrim mod that extends [Azurite II weathers](https://www.nexusmods.com/skyrimspecialedition/mods/42731) and [RAID weathers](https://www.nexusmods.com/skyrimspecialedition/mods/63116) to enhance rain sounds with regional variations as well as intensity variations.

I love the sound of rain in Skyrim. I love sheltering in a tent, lighting a campfire, and waiting out a storm. But it never sounds right to me! I decided to do something about it. The new rain loops were synthesized with a VST plugin. They're all 8 seconds long and stereo. They make a great base for layering on field recordings of thunder, wind, and closer-range rain sounds.

## What the mod does

This mod adds new rain weathers to Azurite2 and RAID to set up regionally distinct sound loops. It does not use any scripts, so it is safe to add and remove any time you want.

These are the vanilla rain weathers and which regions use them:

- **SkyrimOvercastRain**: Solitude, pine forest, Falkreath
- **SkyrimStormRain**: Solitude, pine forest, Falkreath
- **SkyrimOvercastRainMA**: tundra marsh, aka the Morthal area
- **SkyrimOvercastRainRE**: Markarth, the reach
- **SkyrimStormRainFF**: Riften, fall forest aka the Rift
- **SkyrimOvercastRainFF**: Riften, fall forest aka the Rift
- **SkyrimStormRainTU**: Whiterun, tundra, volcanic tundra
- **SkyrimOvercastRainTU**: Whiterun, tundra, volcanic tundra
- **SkyrimOvercastRainVT**: volcanic tundra

In vanilla, each of these regions use the same two short rain sound loops: one for "overcast" that's labeled as drizzle, and one for storms that's labeled as "light". Azurite 2 edits these weathers, but doesn't distinguish overcast from storm: both categories of weather have the same amount of thunder. RAID Weathers has four storm varieties: drizzle, overcast, storm, and heavy storm.

This mod adds new rain weathers for each region, so that Solitude and Falkreath can sound different. It defines light and medium variations of rain for each region, using 21 new rain loops.

Rain intensity variations:

- drizzle: very light rain, no thunder
- overcast: moderate rain, only distant thunder
- storm: significant rain, thunder
- heavy storm: get inside that storm shelter!

Rain soundscapes:

- Fall forest: The Rift. Forest canopy, but not as dense as pine.
- Marsh: The area around Morthal, called "tundra marsh" in the game. Wet and drippy.
- Pine forest: Falkreath Hold, Riverwood, Hjaalmarch. Dense forest canopy.
- Stone city: Water falling on stone and running in gutters. Solitude & Markarth.
- The Reach: Open spaces, distant rain.
- Tundra: The plains around Whiterun Hold. Windy, airy, with damping foliage underfoot.
- Volcanic tundra: Open spaces with hissing rain.
- Wood town: Riften, the town of Falkreath. Water falling onto wooden rooftops, with puddles underfoot.

8 x 4 = 32 sound loops. That's a lot. As it turns out, too many. Some of those variations are unnecessary, because it's difficult to hear the differences at the extreme ends of the storm spectrums. There are only 4 drizzle variations: forest, marsh, tundra, and city. There is only one extremely heavy rain variation.

### Base sounds

Here are the sounds the mod makes available:

- RainLoop_Light_City.wav: light esp formid `0x800`
- RainLoop_Light_FallForest.wav
- RainLoop_Light_Marsh.wav
- RainLoop_Light_PineForest.wav
- RainLoop_Light_Reach.wav
- RainLoop_Light_Town.wav
- RainLoop_Light_Tundra.wav
- RainLoop_Light_VolcanicTundra.wav
- RainLoop_Medium_City.wav
- RainLoop_Medium_FallForest.wav
- RainLoop_Medium_Marsh.wav
- RainLoop_Medium_PineForest.wav
- RainLoop_Medium_Reach.wav
- RainLoop_Medium_Town.wav
- RainLoop_Medium_Tundra.wav
- RainLoop_Medium_VolcanicTundra.wav
- RainLoop_Heavy.wav
- RainLoop_Drizzle_City.wav
- RainLoop_Drizzle_Forest.wav
- RainLoop_Drizzle_Marsh.wav
- RainLoop_Drizzle_Tundra.wav: light esp formid `0x814`

### Azurite 2 edits

The Azurite expansion adds 11 weathers, supplying overcast and storm variations for the vanilla regions that re-use weathers. All rain weathers have their sounds tweaked to use the new loops, with thunder removed completely from overcast weathers. Overcast weathers use the regular Cathedral precipitation particle, and storms use the storm particle. There are no drizzles.

### RAID edits

The RAID expansion adds four new drizzles, four overcasts, and five storm variations. The existing rain weathers have had their sounds tweaked to use the new loops.

### Other weather mods

I'd be happy to look at weather mods with permissions that edits. You can also do this yourself!

The best way to edit new weather mods to use these sounds is to use the `rainsong.esp` plugin as a master. It defines the new sounds and nothing more. Then you can look at the weather mod you want to extend in SSEdit. Copy the existing rainy weather records as overrides into your new plugin. For weather/region combinations that the mod doesn't already cover, copy existing regional weathers as _new_ records. When in doubt, start with the weather that has the visual design appropriate for that region and make a copy of that. Give it a name that includes the intensity and the region.

In your overridden and new weather records, replace any exterior rain loops with one from Rainsong that has the soundscape you want. For new weather records, edit the _region_ record to replace the existing weather with your new variation. If you choose to add entirely new weather variations, like a drizzle, adjust the chances of it showing up so the total is 100 across all variations.

## Permissions and credits

[Azurite II weathers](https://www.nexusmods.com/skyrimspecialedition/mods/42731) is created by DrJacopo. [RAID weathers](https://www.nexusmods.com/skyrimspecialedition/mods/63116) was the work of the late Olivier Doorenbos.

[Source on GitHub](https://github.com/ceejbot/rainsong).

This mod is released under [the Parity Public License](https://paritylicense.com). This license requires people who build on top of this source code to share their work with the community, too. In Skyrim modding language, this license allows "cathedral" modding, not "parlor" modding. Please see the text of the license for details.

Translation: Permissions are open, so long as your mod also has open permissions.

I would appreciate credit for the sounds, and please do give the original authors of the weather mods credit for their much more significant work designing the look of the weathers.
