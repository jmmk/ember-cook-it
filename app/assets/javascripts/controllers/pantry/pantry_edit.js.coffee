App.PantryEditController = Ember.ObjectController.extend
  deletions: []

  clearUnsavedChanges: ->
    @deletions.forEach (ingredient) -> ingredient.rollback()
    @content.get('pantryIngredients').forEach (ingredient) ->
      ingredient.rollback() if ingredient.get('isDirty')

  actions:
    submit: ->
      self = this
      pantry = @content
      ingredients = pantry.get('pantryIngredients')

      @deletions.forEach (ingredient) ->
        ingredient.deleteRecord()
        ingredient.save()

      ingredients.forEach( (ingredient) ->
        ingredient.save() if ingredient.get('isDirty')
      ).then ->
        self.transitionToRoute('pantry.show')

    addIngredient: ->
      ingredient = @store.createRecord('pantryIngredient')
      @content.get('pantryIngredients').pushObject(ingredient)

    removeIngredient: (ingredient) ->
      @content.get('pantryIngredients').removeObject(ingredient)
      if ingredient.get('id') then @deletions.push(ingredient) else ingredient.deleteRecord()

    cancel: ->
      pantry = @content
      @transitionToRoute('pantry.show')

  validations:
    title:
      presence: true
    directions:
      presence: true
