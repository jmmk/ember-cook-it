App.RecipesShowController = Ember.ObjectController.extend
  actions:
    delete: ->
      recipe = @get('content')
      recipe.one 'didDelete', this, ->
        @transitionToRoute 'recipes.index'

      recipe.deleteRecord()
      recipe.save()
