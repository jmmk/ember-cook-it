App.ApplicationRoute = Ember.Route.extend
  setupController: (controller) ->
    self = this
    user = @store.find('session', 'current')
    self.controllerFor('currentUser').set('content', user)
