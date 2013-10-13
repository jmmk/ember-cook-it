App.RecipesEditController = Ember.ObjectController.extend(
  Ember.Validations.Mixin,

  stopEditing: ->
    if (@content)
      @content.rollback()
      @set('content', null)

  actions:
    submit: ->
      recipe = @content
      ingredients = recipe.get('ingredients')

      recipe.one 'didUpdate', this, ->
        @set('content', null)
        @transitionToRoute('recipes.show', recipe)
      ingredients.invoke('save')
      recipe.save()

    addIngredient: ->
      ingredient = @store.createRecord('ingredient')
      @content.get('ingredients').pushObject(ingredient)

    removeIngredient: (ingredient) ->
      ingredient.deleteRecord()
      ingredient.save()
      @content.get('ingredients').removeObject(ingredient)

  validations:
    title:
      presence: true
    directions:
      presence: true
)
