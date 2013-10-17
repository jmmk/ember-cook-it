App.PantryShowRoute = Ember.Route.extend
  model: ->
    @store.find('pantry', 1)
