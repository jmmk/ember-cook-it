App.RecipesNewController = Ember.ObjectController.extend(
  Ember.Validations.Mixin,

  clearUnsavedChanges: ->
    @content.get('ingredients').forEach (ingredient) ->
      ingredient.rollback() if ingredient.get('isDirty')
    @content.rollback() if @content.get('isDirty')

  actions:
    submit: ->
      self = this
      recipe = @content
      ingredients = recipe.get('ingredients')

      recipe.save().then ->
        ingredients.invoke('save')
      .then ->
        self.transitionToRoute('recipes.show', recipe)

    addIngredient: ->
      ingredient = @store.createRecord('ingredient')
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
