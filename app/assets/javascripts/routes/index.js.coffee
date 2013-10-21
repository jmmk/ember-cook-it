App.IndexRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('recipesRecent').set('content',
      @store.find('recipe', type: 'recent' ))
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

  # actions:
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

    # willTransition: ->
      # @controllerFor('users.new').clearUnsavedChanges()
      # @controllerFor('sessions.new').clearUnsavedChanges()
