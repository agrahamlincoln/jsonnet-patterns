// Main Entrypoint for building this jsonnet template
// Anyone wanting to customize this should import this file and provide their own override _config block
//
// first we import the config. This could also just live in the same file.
// I find that separating the config into it's own file makes it an easier to reference while customizing.
(import 'config.libsonnet') +
{
    config_file01: {
        foo: 'bar',
        name: $._config.mixinPattern.name
    },
}
