App.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionToRoute('recipes.index')
