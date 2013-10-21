App.SessionsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('session')

  actions:
    willTransition: ->
      @controllerFor('sessions.new').clearUnsavedChanges()

    # signUp: ->
    #   @transitionTo 'users.new'
