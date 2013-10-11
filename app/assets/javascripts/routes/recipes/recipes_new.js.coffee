App.RecipesNewRoute = Ember.Route.extend
  model: ->
    @get('store').createRecord 'recipe'
