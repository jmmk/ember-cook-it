App.RecipesFilterRoute = Ember.Route.extend
  model: (params, queryParams) ->
    @store.find('recipe', queryParams)

  setupController: (controller, model, queryParams) ->
    model.forEach (recipe) ->
      topFive = recipe.get('recipeIngredients').objectsAt([0, 1, 2, 3, 4]).compact()
      recipe.set('topFive', topFive)
    controller.set('content', model)
    @controllerFor('pantryExample').set('content', @store.find('pantry', queryParams.pantry))

  renderTemplate: (controller, model, queryParams) ->
    pantry = queryParams.pantry
    template = "pantry.#{pantry}"
    controller = "pantry#{pantry.charAt(0).toUpperCase() + pantry.slice(1)}"

    @render()

    @render template,
      into: 'recipes.filter'
      outlet: 'pantry'
      controller: controller
