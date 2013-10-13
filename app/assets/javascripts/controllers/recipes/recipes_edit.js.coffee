App.RecipesEditController = Ember.ObjectController.extend(
  Ember.Validations.Mixin,

  deletions: []

  clearUnsavedChanges: ->
    @deletions.forEach( (ingredient) -> ingredient.rollback() )
    @content.rollback()
    # @content.get('ingredients').forEach ( (ingredient) ->
    #   if !ingredient.get('name')
    #     ingredient.deleteRecord()
    # )


  actions:
    submit: ->
      recipe = @content
      ingredients = recipe.get('ingredients')
      recipe.save() if recipe.get('isDirty')

      ingredients.forEach( (ingredient) ->
        if ingredient.get('isDirty')
          if !ingredient.get('name')
            ingredient.deleteRecord()
          ingredient.save() if ingredient.get('id')
      )

      @deletions.forEach( (ingredient) ->
        ingredient.deleteRecord()
        ingredient.save()
      )

      @transitionToRoute('recipes.show', recipe)

    addIngredient: ->
      ingredient = @store.createRecord('ingredient')
      @content.get('ingredients').pushObject(ingredient)

    removeIngredient: (ingredient) ->
      @content.get('ingredients').removeObject(ingredient)
      if ingredient.get('id') then @deletions.push(ingredient) else ingredient.deleteRecord()

  validations:
    title:
      presence: true
    directions:
      presence: true
)
