App.SessionsNewController = Ember.ObjectController.extend
  needs: 'currentUser'

  clearUnsavedChanges: ->
    @content.deleteRecord()

  actions:
    submit: ->
      @content.save().then ->
        userJSON = @content.toJSON()
        userJSON.id = 'current'
        user = @store.find('user', 'current')

        @get('controllers.currentUser').set('content', user)
        @transitionToRoute('recipes.index')

    cancel: ->
      @transitionToRoute('recipes.index')
