App.Router.map ()->
  @resource 'recipes', ->
    @route 'new'
    @route 'edit', path: '/:recipe_id/edit'
    @route 'show', path: '/:recipe_id'
    @route 'filter', queryParams: ['pantry']

  @resource 'users', ->
    @route 'new'

  @resource 'pantry', ->
    @route 'edit'
    @route 'current'
    @route 'example'

  @resource 'sessions', ->
    @route 'new'
    @route 'destroy'

  @route 'dashboard'
