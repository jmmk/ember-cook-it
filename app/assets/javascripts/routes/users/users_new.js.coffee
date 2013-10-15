App.UsersNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('user')

  actions:
    willTransition: ->
      @controllerFor('users.new').clearUnsavedChanges()
