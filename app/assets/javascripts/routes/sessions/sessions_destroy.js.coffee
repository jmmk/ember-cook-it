App.SessionsDestroyRoute = Ember.Route.extend
  enter: ->
    controller = @controllerFor('currentUser')
    controller.set('content', undefined)

    @get('store').find('session', 'current').then (session) ->
      session.deleteRecord()
      session.save()

    @transitionToRoute('recipes.index')

