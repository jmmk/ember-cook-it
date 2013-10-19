App.ApplicationRoute = Ember.Route.extend
  setupController: ->
    @store.find('session', 'current').then (user) ->
      @controllerFor('currentUser').set('content', user)
