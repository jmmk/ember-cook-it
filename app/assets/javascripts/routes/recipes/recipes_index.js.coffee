App.RecipesIndexRoute = Ember.Route.extend
  model: ->
    @store.findAll('recipe')

  setupController: (controller, model) ->
    model.forEach (recipe) ->
      topFive = recipe.get('recipeIngredients').objectsAt([0, 1, 2, 3, 4]).compact()
      recipe.set('topFive', topFive)
    controller.set('content', model)
