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
