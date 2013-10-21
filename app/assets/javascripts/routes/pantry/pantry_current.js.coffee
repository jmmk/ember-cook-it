App.PantryCurrentRoute = Ember.Route.extend
  model: ->
    @store.find('pantry', 'current')
