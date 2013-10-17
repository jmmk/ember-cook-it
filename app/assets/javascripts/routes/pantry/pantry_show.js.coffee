App.PantryShowRoute = Ember.Route.extend
  model: ->
    @store.find('pantry', 'current')
