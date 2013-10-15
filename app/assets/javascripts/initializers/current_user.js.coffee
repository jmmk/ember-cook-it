Ember.Application.initializer
  name: 'currentUser'

  initialize: (container) ->
    user = @store.find('user', 'current')

    container.lookup('controller:currentUser').set('content', user)
    container.typeInjection('controller', 'currentUser', 'controller:currentUser')
