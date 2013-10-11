App.RecipesNewController = Ember.ObjectController.extend(
  Ember.Validations.Mixin,
  actions:
    submit: ->
      recipe = @get('content')
      recipe.one 'didCreate', this, ->
        @transitionToRoute 'recipe', recipe

      recipe.save()

  validations:
    title:
      presence: true
    directions:
      presence: true
)

