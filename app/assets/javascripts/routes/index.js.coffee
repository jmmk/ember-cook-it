App.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo 'recipes.index'
