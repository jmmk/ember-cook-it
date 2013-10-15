App.UsersNewController = Ember.Controller.extend

  clearUnsavedChanges: ->
    @content.deleteRecord()

  actions:
    submit: ->
      @content.save().then ->
        @transitiontoRoute('recipes.index')

    cancel: ->
      @transitiontoRoute('recipes.index')
