App.DashboardRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('recipesRecent').set('content',
      @store.find('recipe', type: 'recent' ))
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
