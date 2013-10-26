App.DashboardRoute = Ember.Route.extend
  model: ->
    @store.find('recipe', type: 'recent')

  afterModel: (model) ->
    model.forEach (recipe) ->
      recipe.get('recipeIngredients').then (recipeIngredients) ->
        topFive = recipeIngredients.objectsAt([0, 1, 2, 3, 4]).compact()
        recipe.set('topFive', topFive)

  setupController: (controller, model) ->
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
