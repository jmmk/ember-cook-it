App.Router.map ()->
  @resource 'recipes', ->
    @route 'new'
    @route 'edit', path: '/:recipe_id/edit'
    @route 'show', path: '/:recipe_id'

  @resource 'users', ->
    @route 'new'

  @resource 'sessions', ->
    @route 'new'
    @route 'destroy'
