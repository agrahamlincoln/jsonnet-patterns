# jsonnet mixin pattern

I call this pattern the "mixin" pattern. It heavily uses a hidden `_config` object to store all of the module configuration. Each module looks at it's own config, and builds it's respective templates. Each module is expected to have default `_config` values, so a user can easily mixin only the changes they want to make to the config.

# building

```
jsonnet entrypoint.jsonnet
```