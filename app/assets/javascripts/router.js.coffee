App.Router.map ()->
  @resource 'recipes', ->
    @route 'new'
    @route 'edit', path: '/:recipe_id/edit'
    @route 'show', path: '/:recipe_id'
