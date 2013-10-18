module "User adds a recipe",
  setup: ->
    App.Recipe.FIXTURES = [
      id: 1, title: 'Super Chicken', directions: 'Stir', recipeIngredients: [1, 2]
    ]

    App.RecipeIngredient.FIXTURES = [
      id: 1, name: 'Chicken',
      id: 2, name: 'Rice'
    ]

    App.Session.FIXTURES = [
      id: 1, email: 'jmik@asd.com', password: 'asd'
    ]

    App.Pantry.FIXTURES = [
      id: 1, pantryIngredients: [1, 2]
    ]

    App.PantryIngredient.FIXTURES = [
      id: 1, name: 'Chicken',
      id: 2, name: 'Rice'
    ]

    Ember.run(App, App.advanceReadiness)

  teardown: ->
    App.reset()

test "View index", ->
  expect 1

  visit("/recipes").then ->
    ok hasContent("Recipes"), "Header Found"
