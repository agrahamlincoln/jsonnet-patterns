local hot_dog_stand = import 'modules/hot-dog-stand/hot-dog-stand.libsonnet';
local waterpark = import 'modules/waterpark/waterpark.libsonnet';
local standard_park = import 'standard_park.jsonnet';

/*
An example might be that a standard Park has 3 hot dog stands, but my new JsonnetPark has 4, so I
want to mixin a new top level config with 4 defined stands.
*/

{
  themePark: standard_park.themePark {
    name: 'A new version of ' + super.name,

    food+: {
      'new-stand': hot_dog_stand.HotDogStand {
        tentColor: 'hot pink',
        refreshments+: [
          {
            variety: 'diet',
            type: 'lemonade',
            price: 3.99,
          },
        ],
      },
    },
  },
}
