App.RecipesFilterRoute = Ember.Route.extend
  model: (params, queryParams) ->
    @store.find('recipe', queryParams)

  setupController: (controller, model, queryParams) ->
    controller.set('content', model)
    @store.find('pantry', queryParams.pantry).then (pantry) ->
      controller.set('pantry', pantry)

  renderTemplate: (controller, model, queryParams) ->
    pantry = queryParams.pantry
    template = "pantry.#{pantry}"
    controller = "pantry#{pantry.charAt(0).toUpperCase() + pantry.slice(1)}"

    @render()

    @render template,
      into: 'recipes.filter'
      outlet: 'pantry'
      controller: controller
