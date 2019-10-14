{
  // Some predefined condiments.
  condiments:: {
    ketchup: {
      name: 'ketchup',
      type: 'default',
    },
    yellow_mustard: {
      name: 'mustard',
      type: 'yellow',
    },
    brown_mustard: {
      name: 'mustard',
      type: 'brown',
    },
  },

  // Some predefined refreshments.
  refreshments:: {
    coca_cola_cherry: {
      type: 'coca-cola',
      variety: 'cherry',
      price: 4.99,
    },
  },

  HotDogStand:: {
    structure: {
      tentColor: 'red',
      numSeats: 3,
    },
    refreshments: [],
    condiments: [
        $.condiments.ketchup,
        $.condiments.yellow_mustard,
        $.condiments.brown_mustard],
  },
}
