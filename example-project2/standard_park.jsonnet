local hot_dog_stand = import 'modules/hot-dog-stand/hot-dog-stand.libsonnet';
local waterpark = import 'modules/waterpark/waterpark.libsonnet';

{
  themePark: {
    name: 'the best themepark',

    attractions: {
      'ocean-adventure': waterpark.Waterpark,
    },

    food: {
      hotdogs: hot_dog_stand.HotDogStand,

      ballpark: hot_dog_stand.HotDogStand {
        tentColor: 'yellow',
      },

      'billiard-dogs': hot_dog_stand.HotDogStand {
        tentColor: 'green',
        refreshments+: [
          hot_dog_stand.refreshments.coca_cola_cherry,
          {
            variety: 'vanilla',
            type: 'coca-cola',
            price: 4.99,
          },
        ],
      },
    },
  },
}
