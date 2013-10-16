App.RecipesEditController = Ember.ObjectController.extend(
  Ember.Validations.Mixin,

  deletions: []

  clearUnsavedChanges: ->
    @deletions.forEach (ingredient) -> ingredient.rollback()
    @content.get('recipeIngredients').forEach (ingredient) ->
      ingredient.rollback() if ingredient.get('isDirty')
    @content.rollback() if @content.get('isDirty')

  actions:
    submit: ->
      self = this
      recipe = @content
      ingredients = recipe.get('recipeIngredients')

      @deletions.forEach (ingredient) ->
        ingredient.deleteRecord()
        ingredient.save()

      recipe.save() if recipe.get('isDirty')
      ingredients.forEach( (ingredient) ->
        ingredient.save() if ingredient.get('isDirty')
      ).then ->
        self.transitionToRoute('recipes.show', recipe)

    addIngredient: ->
      ingredient = @store.createRecord('recipeIngredient')
      @content.get('recipeIngredients').pushObject(ingredient)

    removeIngredient: (ingredient) ->
      @content.get('recipeIngredients').removeObject(ingredient)
      if ingredient.get('id') then @deletions.push(ingredient) else ingredient.deleteRecord()

    cancel: ->
      @transitionToRoute('recipes.index')

  validations:
    title:
      presence: true
    directions:
      presence: true
)
