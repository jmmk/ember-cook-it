App.RecipesNewController = Ember.ObjectController.extend
  actions:
    save: ->
      @get('content').save().then @get('store').commit

