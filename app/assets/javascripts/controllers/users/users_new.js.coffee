App.UsersNewController = Ember.ObjectController.extend

  clearUnsavedChanges: ->
    @content.rollback() if @content.get('isDirty')

  actions:
    submit: ->
      self = this
      @content.save().then ->
        self.transitionToRoute('sessions.new')

    cancel: ->
      @transitiontoRoute('recipes.index')
