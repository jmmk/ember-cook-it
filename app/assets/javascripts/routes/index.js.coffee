App.IndexRoute = Ember.Route.extend
  model: ->
    @store.find('recipe', type: 'recent')

  afterModel: (model) ->
    model.forEach (recipe) ->
      recipe.get('recipeIngredients').then (recipeIngredients) ->
        topFive = recipeIngredients.objectsAt([0, 1, 2, 3, 4]).compact()
        recipe.set('topFive', topFive)

  setupController: (controller, model) ->
    @controllerFor('recipesRecent').set('content', model)
    @controllerFor('pantryExample').set('content', @store.find('pantry', 'example'))

  renderTemplate: ->
    @render()

    @render 'recipes.recent',
      into: 'index'
      outlet: 'recipesRecent'
      controller: 'recipesRecent'

    @render 'pantry.example',
      into: 'index'
      outlet: 'pantryExample'
      controller: 'pantryExample'
