App.RecipesNewController = Ember.ObjectController.extend(
  Ember.Validations.Mixin,

  clearUnsavedChanges: ->
    @content.get('ingredients').invoke('rollback')
    @content.rollback()

  actions:
    submit: ->
      recipe = @content
      ingredients = recipe.get('ingredients')

      recipe.one 'didCreate', this, ->
        @transitionToRoute('recipes.show', recipe)

      recipe.save().then ->
        ingredients.forEach( (ingredient) ->
          if !ingredient.get('name')
            ingredient.deleteRecord()
          else
            ingredient.save()
        )

    addIngredient: ->
      ingredient = @store.createRecord('ingredient')
      @content.get('ingredients').pushObject(ingredient)

    removeIngredient: (ingredient) ->
      @content.get('ingredients').removeObject(ingredient)
      ingredient.deleteRecord()

  validations:
    title:
      presence: true
    directions:
      presence: true
)
