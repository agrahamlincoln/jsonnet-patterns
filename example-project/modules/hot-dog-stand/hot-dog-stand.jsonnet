// Note: this file uses a mixin pattern
(import 'config.libsonnet') +
{
    name: $._config.hotDogStand.name,
    structure: {
        tentColor: $._config.hotDogStand.tentColor,
        numSeats: $._config.hotDogStand.numSeats,
    },
    goods: {
        refreshments: [{
            variety: 'cherry',
            type: 'coca-cola',
            price: 4.99,
        }] + $._config.hotDogStand.refreshments,
        condiments: $._config.hotDogStand.condiments,
        food: 'hot-dog'
    },
}
