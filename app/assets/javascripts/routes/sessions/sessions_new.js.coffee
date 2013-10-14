App.SessionsNewRoute = Ember.Route.extend
  model: ->
    @get('store').createRecord('session')
