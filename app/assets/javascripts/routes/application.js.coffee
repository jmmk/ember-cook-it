App.ApplicationRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('currentUser').set('content', @store.find('session', 'current'))
