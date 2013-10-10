App.RecipesIndexRoute = Ember.Route.extend
  model: ->
    @get('store').findAll 'recipe'
