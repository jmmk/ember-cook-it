App.UsersNewController = Ember.ObjectController.extend

  clearUnsavedChanges: ->
    @content.rollback() if @content.get('isDirty')

  actions:
    submit: ->
      @content.save().then ->
        @transitiontoRoute('recipes.index')

    cancel: ->
      @transitiontoRoute('recipes.index')
