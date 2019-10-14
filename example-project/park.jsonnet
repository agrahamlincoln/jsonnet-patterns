local hotDogBuilder = {
    newHotDogStand(hdsConfig)::
        (import 'modules/hot-dog-stand/hot-dog-stand.jsonnet') + hdsConfig
};

local importedConfig = (import 'config.libsonnet')._config;

// use object comprehension to compile all of the hotdogstand configs
local compiledHDS = {
# THIS THROWS AN ERROR - `No top-level object found.'
#    [stand.name]: newHotDogStand(stand) for stand in $._config.hotDogStands
    [stand.name]: hotDogBuilder.newHotDogStand(stand) for stand in importedConfig.hotDogStands
};

{
    themePark: {
        name: 'the best themepark',
        food+: compiledHDS,
        attractions: [(import 'modules/waterpark/waterpark.jsonnet')],
    },
}

/*
For sake of brevity, i'll use 'park' terminology from the example:
The problem is worse if we want to create multiple Amusement Parks, but with some differences. An example might be that a standard Park has 3 hot dog stands, but my new JsonnetPark has 4, so I want to mixin a new top level config with 4 defined stands. In this example as it stands, if you were to provide that config, it would customize the name of the park, and the attractions, but you would still get 3 hotdog stands unless you modified importedConfig to import my JsonnetPark config.libsonnet instead of it's own
*/
