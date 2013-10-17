App.RecipesNewController = Ember.ObjectController.extend(
  Ember.Validations.Mixin,

  clearUnsavedChanges: ->
    @content.get('recipeIngredients').forEach (ingredient) ->
      ingredient.rollback() if ingredient.get('isDirty')
    @content.rollback() if @content.get('isDirty')

  actions:
    submit: ->
      self = this
      recipe = @content

      recipe.save().then(->
        recipe.get('recipeIngredients').invoke('save')
      ).then ->
        self.transitionToRoute('recipes.show', recipe)

    addIngredient: ->
      ingredient = @store.createRecord('recipeIngredient')
      @content.get('recipeIngredients').pushObject(ingredient)

    removeIngredient: (ingredient) ->
      @content.get('recipeIngredients').removeObject(ingredient)
      ingredient.deleteRecord()

    cancel: ->
      @transitionToRoute('recipes.index')

  validations:
    title:
      presence: true
    directions:
      presence: true
)
