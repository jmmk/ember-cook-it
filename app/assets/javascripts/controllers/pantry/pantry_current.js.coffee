App.PantryCurrentController = Ember.ObjectController.extend

  actions:
    search: ->
      @transitionToRoute('recipes.filter', queryParams: { pantry: 'current' })
