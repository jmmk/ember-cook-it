App.IndexRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('recipesRecent').set('content', @store.findAll('recipe'))
    if @controllerFor('currentUser').get('content')
      @controllerFor('pantryShow').set('content', @store.find('pantry', 'current'))
    else
      @controllerFor('usersNew').set('content', @store.createRecord('user'))
      @controllerFor('sessionsNew').set('content', @store.createRecord('session'))


  renderTemplate: ->
    @render()

    @render 'recipes.recent',
      into: 'index'
      outlet: 'recentRecipes'
      controller: 'recipesRecent'

    if @controllerFor('currentUser').get('content')
      @render 'pantry',
        into: 'index'
        outlet: 'rightDashboard'

      @render 'pantry.show',
        into: 'pantry'
        controller: 'pantryShow'
    else
      @render 'users.new',
        into: 'index'
        outlet: 'rightDashboard'
        controller: 'usersNew'

  actions:
    # signIn: ->
    #   @render 'sessions.new',
    #     into: 'index'
    #     outlet: 'rightDashboard'
    #     controller: 'sessionsNew'
    #   @controllerFor('users.new').clearUnsavedChanges()

    # signUp: ->
    #   @render 'users.new',
    #     into: 'index'
    #     outlet: 'rightDashboard'
    #     controller: 'usersNew'
    #   @controllerFor('sessions.new').clearUnsavedChanges()

    willTransition: ->
      @controllerFor('users.new').clearUnsavedChanges()
      @controllerFor('sessions.new').clearUnsavedChanges()
