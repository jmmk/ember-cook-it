App.RecipesEditController = Ember.ObjectController.extend(
  Ember.Validations.Mixin,

  deletions: []

  clearUnsavedChanges: ->
    @deletions.forEach (ingredient) -> ingredient.rollback()
    @content.get('ingredients').forEach (ingredient) ->
      ingredient.rollback() if ingredient.get('isDirty')
    @content.rollback() if @content.get('isDirty')

  actions:
    submit: ->
      recipe = @content
      ingredients = recipe.get('ingredients')

      @deletions.forEach (ingredient) ->
        ingredient.deleteRecord()
        ingredient.save()

      recipe.save() if recipe.get('isDirty')
      ingredients.forEach (ingredient) ->
        ingredient.save() if ingredient.get('isDirty')
      .then ->
        controller = App.__container__.lookup('controller:recipes_new')
        controller.transitionToRoute('recipes.show', recipe)

    addIngredient: ->
      ingredient = @store.createRecord('ingredient')
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
