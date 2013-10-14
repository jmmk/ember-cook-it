App.RecipesEditController = Ember.ObjectController.extend(
  Ember.Validations.Mixin,

  deletions: []

  clearUnsavedChanges: ->
    @deletions.forEach( (ingredient) -> ingredient.rollback() )
    @content.rollback()

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
          else
            ingredient.save()
      )

      @deletions.forEach( (ingredient) ->
        ingredient.deleteRecord()
        ingredient.save()
      )

      @transitionToRoute('recipes.show', recipe)

    addIngredient: ->
      ingredient = @store.createRecord('ingredient', name: 'New Ingredient')
      @content.get('ingredients').pushObject(ingredient)

    removeIngredient: (ingredient) ->
      @content.get('ingredients').removeObject(ingredient)
      if ingredient.get('id') then @deletions.push(ingredient) else ingredient.deleteRecord()

    cancel: ->
      @transitionToRoute('recipes.index')

  validations:
    title:
      presence: true
    directions:
      presence: true
)
