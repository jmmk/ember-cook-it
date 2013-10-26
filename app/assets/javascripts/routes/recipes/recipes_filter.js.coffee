App.RecipesFilterRoute = Ember.Route.extend
  model: (params, queryParams) ->
    @store.find('recipe', queryParams)

  afterModel: (model) ->
    model.forEach (recipe) ->
      recipe.get('recipeIngredients').then (recipeIngredients) ->
        topFive = recipeIngredients.objectsAt([0, 1, 2, 3, 4]).compact()
        recipe.set('topFive', topFive)

  setupController: (controller, model, queryParams) ->
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
