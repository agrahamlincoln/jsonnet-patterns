# jsonnet builder pattern

I call this pattern the "builder" pattern. It relies on importing the configuration rather than allowing it to be mixin to the current config. The upside to importing the config is that it can be easily iterated over via a for loop. The downside to this config is that when this file is imported as a separate project (maybe with a tool like jsonnet-bundler) the config cannot be easily modified without replacing the file.

# building

```
jsonnet entrypoint.jsonnet
```