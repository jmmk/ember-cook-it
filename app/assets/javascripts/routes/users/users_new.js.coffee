App.UsersNewRoute = Ember.Route.extend
  model: ->
    @get('store')createRecord('user')
