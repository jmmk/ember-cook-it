App.SessionsNewController = Ember.ObjectController.extend
  needs: 'currentUser'

  clearUnsavedChanges: ->
    @content.rollback() if @content.get('isDirty')

  actions:
    submit: ->
      self = this
      @content.save().then ->
        self.get('controllers.currentUser').set('content', self.content)
        self.transitionToRoute('index')

    cancel: ->
      @transitionToRoute('recipes.index')

    # signUp: ->
    #   @transitionToRoute 'users.new'
