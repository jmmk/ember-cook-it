App.RecipesIndexRoute = Ember.Route.extend
  model: ->
    @store.findAll('recipe')

  afterModel: (model) ->
    model.forEach (recipe) ->
      recipe.get('recipeIngredients').then (recipeIngredients) ->
        topFive = recipeIngredients.objectsAt([0, 1, 2, 3, 4]).compact()
        recipe.set('topFive', topFive)

  setupController: (controller, model) ->
    controller.set('content', model)
