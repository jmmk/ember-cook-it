App.RecipesNewController = Ember.ObjectController.extend(
  Ember.Validations.Mixin,

  clearUnsavedChanges: ->
    @content.get('ingredients').invoke('rollback')
    # @content.set('ingredients', null)
    @content.rollback()
    # @set('content', null)

  actions:
    submit: ->
      recipe = @content
      ingredients = recipe.get('ingredients')

      recipe.one 'didCreate', this, ->
        @transitionToRoute('recipes.show', recipe)

      recipe.save().then ->
        ingredients.invoke('save')

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
