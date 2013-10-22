App.DashboardRoute = Ember.Route.extend
  model: ->
    @store.find('recipe', type: 'recent')

  setupController: (controller, model) ->
    model.forEach (recipe) ->
      topFive = recipe.get('recipeIngredients').objectsAt([0, 1, 2, 3, 4]).compact()
      recipe.set('topFive', topFive)
    @controllerFor('recipesRecent').set('content', model)
    @controllerFor('pantryCurrent').set('content', @store.find('pantry', 'current'))

  renderTemplate: ->
    @render()

    @render 'recipes.recent',
      into: 'dashboard'
      outlet: 'recipesRecent'
      controller: 'recipesRecent'

    @render 'pantry.current',
      into: 'dashboard'
      outlet: 'pantryCurrent'
      controller: 'pantryCurrent'
