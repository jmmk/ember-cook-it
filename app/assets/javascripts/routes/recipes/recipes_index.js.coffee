App.RecipesIndexRoute = Ember.Route.extend
  model: ->
    @store.findAll('recipe')
