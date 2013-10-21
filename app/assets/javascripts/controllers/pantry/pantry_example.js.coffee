App.PantryExampleController = Ember.ObjectController.extend

  actions:
    search: ->
      @transitionToRoute('recipes.filter', queryParams: { pantry: 'example' })
