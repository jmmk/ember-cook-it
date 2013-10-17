App.ApplicationRoute = Ember.Route.extend
  setupController: ->
    user = @store.find('session', 'current')
    @controllerFor('currentUser').set('content', user)
