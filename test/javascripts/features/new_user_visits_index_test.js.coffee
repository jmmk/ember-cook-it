module 'new user visits index',
  setup: ->
    App.Recipe.FIXTURES = [
      id: 1, title: 'Super Chicken', directions: 'Stir', recipeIngredients: [1, 2]
    ]

    App.RecipeIngredient.FIXTURES = [
      {id: 1, name: 'Chicken'},
      {id: 2, name: 'Rice'}
    ]

    App.Session.FIXTURES = [
      # id: 'current', email: 'jmik@asd.com', password: 'asd'
    ]

    App.Pantry.FIXTURES = [
      id: 'example', pantryIngredients: [1, 2, 3]
    ]

    App.PantryIngredient.FIXTURES = [
      {id: 1, name: 'Chicken'},
      {id: 2, name: 'Tomato'}
    ]

    Ember.run(App, App.advanceReadiness)

  teardown: ->
    App.reset()

test 'Show pantry and recent recipes', ->
  expect 5

  visit('/').then ->
    ok hasContent('Recent Recipes'), 'Recipes header'
    ok hasContent('Pantry'), 'Pantry header'
    ok hasContent('Super Chicken'), 'Recipe title'
    ok hasContent('Rice'), 'Recipe ingredient name'
    ok hasContent('Tomato'), 'Pantry ingredient name'
