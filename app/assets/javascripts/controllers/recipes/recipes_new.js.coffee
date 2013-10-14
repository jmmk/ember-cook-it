App.RecipesNewController = Ember.ObjectController.extend(
  Ember.Validations.Mixin,

  clearUnsavedChanges: ->
    @content.get('ingredients').invoke('rollback')
    @content.rollback()

  actions:
    submit: ->
      recipe = @content
      ingredients = recipe.get('ingredients')

      recipe.save().then ->
        ingredients.forEach( (ingredient) ->
          if !ingredient.get('name')
            ingredient.deleteRecord()
          else
            ingredient.save()
        )

      @transitionToRoute('recipes.show', recipe)

    addIngredient: ->
      ingredient = @store.createRecord('ingredient', name: 'New Ingredient')
      @content.get('ingredients').pushObject(ingredient)

    removeIngredient: (ingredient) ->
      @content.get('ingredients').removeObject(ingredient)
      ingredient.deleteRecord()

    cancel: ->
      @transitionToRoute('recipes.index')

  validations:
    title:
      presence: true
    directions:
      presence: true
)
