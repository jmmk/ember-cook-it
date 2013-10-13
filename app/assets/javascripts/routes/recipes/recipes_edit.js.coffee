App.RecipesEditRoute = Ember.Route.extend
  model: (params) ->
    @get('store').find('recipe', params.recipe_id)

  deactivate: ->
    @controllerFor('recipes.edit').stopEditing()
