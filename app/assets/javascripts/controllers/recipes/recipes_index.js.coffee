App.RecipesIndexController = Ember.ArrayController.extend

  actions:
    search: ->
      @transitionToRoute('recipes.filter', queryParams: { pantry: 'current' })
