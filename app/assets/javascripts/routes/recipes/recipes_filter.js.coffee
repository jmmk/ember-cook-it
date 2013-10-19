App.RecipesFilterRoute = Ember.Route.extend
  model: (params, queryParams) ->
    @store.find('recipe', queryParams)

  setupController: (controller, model) ->
    controller.set('content', model)
    @store.find('pantry', 'current').then (pantry) ->
      controller.set('pantry', pantry)
