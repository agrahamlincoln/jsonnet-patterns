// Main Entrypoint for building this jsonnet template
// Anyone wanting to customize this should replace config.libsonnet with their own
//

// First we import the config into a local variable
local config = (import 'config.libsonnet');

// This is a "builder" function to construct configs.
// This function is great for simple things, but get's really complex as the list of arguments grows
local builderFunc = {
    newConfig(name, suffix):: {
        config_file01: {
            foo: 'bar',
            name: std.join('-', [name, suffix]),
        },
    },
};

// This is just using the same "mixin" pattern, with the problem that the _config is no longer "mixin-able"
local compiledConfig = config + {
    config_file01: {
        foo: 'bar',
        name: config._config.builderPattern.name
    },
};

// We can generate multiple configs using the "builder" function from above
// We can even generate 'n' instances of the config by using object comprehension
local multipleConfigs = {
    [whose.who]: builderFunc.newConfig(config._config.builderPattern.name, whose.nameSuffix)
                  for whose in config._config.builderPattern.whoseConfig
};

// Finally, use the local "compiled" objects above and object comprehension to generate the final output
{
    [whoseConfig + '-config']: multipleConfigs[whoseConfig],
    for whoseConfig in std.objectFields(multipleConfigs)
} +
{ [name]: compiledConfig[name] for name in std.objectFields(compiledConfig) }
