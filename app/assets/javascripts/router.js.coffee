App.Router.map ()->
  @resource 'recipes', ->
    @route 'new'
    @route 'edit'
  @resource 'recipe', path: '/recipes/:recipe_id'
