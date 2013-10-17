App.Router.map ()->
  @resource 'recipes', ->
    @route 'new'
    @route 'edit', path: '/:recipe_id/edit'
    @route 'show', path: '/:recipe_id'

  @resource 'users', ->
    @route 'new'

  @resource 'pantry', ->
    @route 'edit'
    @route 'show'

  @resource 'sessions', ->
    @route 'new'
    @route 'destroy'
