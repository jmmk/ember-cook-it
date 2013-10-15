App.ApplicationRoute = Ember.Route.extend
  setupController: ->
    self = this
    user = @store.find('session', 'current')
    self.controllerFor('currentUser').set('content', user)
