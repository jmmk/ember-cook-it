App.RecipesFilterRoute = Ember.Route.extend
  model: (params, queryParams) ->
    @store.find('recipe', queryParams)

  setupController: (controller, model) ->
    controller.set('content', model)
    pantry = @store.find('pantry', 'current')
    controller.set('pantry', pantry)
