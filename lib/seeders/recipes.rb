module Seeders
  module Recipes

    class << self

      def seed
        recipes.each do |attrs|
          recipe = Recipe.where(title: attrs[:title]).first
          if recipe.nil?
            recipe = Recipe.new
            recipe.title = attrs[:title]
            recipe.directions = attrs[:directions]
            recipe.save!
          end
          attrs[:recipe_ingredients].each do |i|
            ingredient = Ingredient.find_or_create_by(name: i)
            if RecipeIngredient.where(ingredient_id: ingredient.id, recipe_id: recipe.id).first.nil?
              recipe_ingredient = RecipeIngredient.new
              recipe_ingredient.ingredient_id = ingredient.id
              recipe_ingredient.recipe_id = recipe.id
              recipe_ingredient.save!
            end
          end
        end
      end

      def seed_pantry
        user = User.where(email: 'admin@admin.com').first
        if user.nil?
          user = User.create(email: 'admin@admin.com',
            password: 'adminadmin', password_confirmation: 'adminadmin')
        end

        pantry = Pantry.where(user_id: user.id).first
        pantry = Pantry.create(user_id: user.id) if pantry.nil?

        ingredients = [
          'avocado',
          'tomato',
          'salt',
          'eggs',
          'bacon'
        ]

        ingredients.each do |i|
          ingredient = Ingredient.find_or_create_by(name: i)
          if PantryIngredient.where(ingredient_id: ingredient.id, pantry_id: pantry.id).first.nil?
            pantry_ingredient = PantryIngredient.new
            pantry_ingredient.ingredient_id = ingredient.id
            pantry_ingredient.pantry_id = pantry.id
            pantry_ingredient.save
          end
        end
      end

      def recipes
        [
          {
            title: "Spinach Frittata",
            directions: "Preheat oven to 400°F. Drain spinach and set aside.
            In a mixing bowl, whisk together eggs, milk and parmesan cheese.
            Once combined, add in sun-dried tomatoes and salt and pepper.
            In a skillet, sauté onions in olive oil on medium heat (about 2 minutes,
              or until translucent), add minced garlic and sauté for one more minute.
            Add spinach. In a pre-greased muffin pan, add spinach mixture to fill cups
             one-third to half-way. Pour egg mixture over the top. Sprinkle goat cheese over
             the top of each “muffin” and put back in the oven for 10 minutes or until
             muffins appear puffy and golden. Remove from oven and enjoy!",
             recipe_ingredients: [
              'frozen spinach',
              'olive oil',
              'onion',
              'garlic',
              'eggs',
              'milk',
              'parmesan cheese',
              'sun-dried tomatoes',
              'salt',
              'pepper',
              'goat cheese'
            ]
          },
          {
            title: "Chicken with Goat Cheese and Arugula",
            directions: "Preheat oven to 425°F. Lay cutlets flat, smooth side down.
            Season with salt and pepper, layer with arugula leaves and place goat cheese
            in the center. Starting with the narrow end of the cutlet, roll up the chicken
            tightly and secure with a toothpick. In a large, non-stick skillet, heat oil
            over medium heat. Cook the chicken, “seam” side down for 1-2 minutes or until
            golden brown. Turn once and cook for a further 1 to 2 minutes. Transfer skillet
            to oven and cook 10-12 minutes or until chicken is opaque throughout. While the
            chicken is cooking, make a quick salad of argula, tomatoes and almonds. Pile on
            one side of the plate and drizzle with olive oil and balsamic vinegar and season
            with course ground black pepper. Once chicken is done, remove toothpicks, slice
            the chicken crosswise and arrange on plate. Serves 4.",
            recipe_ingredients: [
              'chicken breast cutlets',
              'arugula',
              'goat cheese',
              'olive oil'
            ]
          },
          {
            title: "Easy Chicken Enchiladas",
            directions: "First prepare enchilada sauce. In a medium skillet,
            warm butter and oil. Add all dry ingredients, whisk in two cups of water
            and tomato sauce. Stir continually until sauce thickens. Adjust spices accordingly
            and set aside. In a second skillet, heat chicken in a quarter cup of enchilada
            sauce. Bring to simmer. In a mixing bowl, add eggs and half and half and beat
            until well blended. Heat up small skillet, spray with non-stick spray and add
              just enough egg mixture to coat pan. Allow to cook through, about 1-2 minutes.
              Repeat till all mixture is gone (you should get about 6 crepes). Inside a baking
              dish, place one of the egg crepes and coat with a small amount of sauce.
              Add chicken, a small amount of cheese and roll. When all are rolled top with
               sauce. Sprinkle chopped scallions and cheese on top and bake at 350 for 10-15
               min or until cheese melted and bubbly.",
            recipe_ingredients: [
              'chicken breast',
              'cheddar cheese',
              'cream',
              'scallions',
              'egg whites',
              'tomato sauce',
              'water',
              'olive oil',
              'butter',
              'cornstarch',
              'cumin',
              'cocoa powder',
              'garlic powder',
              'chili powder'
            ]

          },
          {
            title: "Eggplant Pizza",
            directions: "Slice the eggplant lengthwise, making probably 6-8 slices
            about ½ inch thick. Place on a greased cookie sheet and place under a
            broiler. Broil until light brown. Remove, flip and cover with tomato sauce,
            basil, oregano and mozzarella cheese. Place back under the broiler. Feel free
            to add more toppings here – peppers, onions, pepperoni, diced ham – whatever
            your favorite pizza is, feel free to add it here! Should serve 3-4 people
            depending on how big your eggplant is.",
            recipe_ingredients: [
              'eggplant',
              'mozzarella',
              'tomato sauce',
              'basil',
              'oregano'
            ]
          },
          {
            title: "Best Chili in the World",
            directions: "Heat a large heavy bottomed pot over medium heat; add 3 tablespoons
            olive oil, the onions, pasilla peppers, and red pepper. Cook until everything is
            soft and the onions are beginning to caramelize, about 10 minutes.

            Pat the beef dry and season it with salt and pepper. Add it to the pot and cook,
            stirring frequently, until it has browned on all sides, about 10 minutes.

            Add oregano, paprika, coriander, cumin, chili powder, garlic, cinnamon stick,
            tomatoes, beer and chipotle (add as little as one teaspoon to the whole can
              depending on how hot you’d like your chili).

            Bring the pot to a boil, then reduce to a simmer, cover, and cook for 1 1/2 hours.
            Remove the meat and shred it with a fork.

            Return it to the pot, and cook for another 10 minutes, uncovered, to thicken.
            Right before you are ready to serve add the red wine vinegar to the pot and stir.
            Taste and adjust seasoning. Serve with the queso fresco, cilantro, and lime for
            garnish.",
            recipe_ingredients:[
              'olive oil',
              'onion',
              'pasilla peppers',
              'red pepper',
              'beef chuck',
              'oregano',
              'paprika',
              'ground coriander',
              'cumin',
              'chili powder',
              'garlic',
              'cinnamon',
              'whole tomatoes',
              'dark beer',
              'chipotle chile',
              'red wine vinegar',
              'cilantro',
              'lime'
            ]
          },
          {
            title: "Sausage and Eggs to Go",
            directions: "Preheat oven to 350°F.

            Divide the sausage into 6 portions, and place each into its own individual
            ramekin. Use your hands to push the sausage around the bottom and up the sides
            of the ramekin, creating a “crust” for the egg to bake in.

            Crack an egg into each sausage crust. For a scrambled variation, whisk the
            eggs before pouring in.

            Top with a sprinkle of salt and a few slices of green onion.

            Bake until the eggs are set, about 30 minutes.",
            recipe_ingredients:[
              'sausage',
              'eggs',
              'green onion',
              'salt'
            ]
          },
          {
            title: "Pork-Stuffed Jalapeño Peppers",
            directions: "Heat oven to 400 ºF (205 ºC)

              Use your fingers to stuff meat into each jalapeño half.

              Snugly wrap a piece of bacon around the pepper. Secure it with a toothpick.

              You can put the peppers directly on baking sheet or pan, but the fat that
              drips off the bacon will make them a little greasy. To avoid this, set a
              cooling rack on top of a baking pan and put the pepper on the rack.

              Bake for 25 minutes, until bacon is crispy.",
            recipe_ingredients:[
              'jalapenos',
              'bacon',
              'sausage'
            ]
          },
          {
            title: "Shakshuka (Eggs Poached in Spicy Tomato Sauce)",
            directions: "Preheat the oven to 400 degrees Fahrenheit.

              Heat olive oil over medium-high heat in a deep skillet.
              Add peppers and onion and sauté until onion is lightly browned,
              about five minutes.

              Add garlic, cumin and paprika and sauté one minute more.

              Add tomatoes. Break them apart with a large spoon or spatula as they cook.
              Reduce heat slightly and simmer 15-20 minutes (longer if tomatoes are fresh),
              stirring occasionally, until sauce has thickened and most of the liquid is gone.
              Add salt to taste.

              Crack the eggs evenly around the skillet. Place the skillet in the oven and
              cook until the egg whites are set, 6-8 minutes.

              Garnish with parsley (and feta). Serve warm.",
            recipe_ingredients:[
              'olive oil',
              'jalapenos',
              'green bell pepper',
              'onions',
              'garlic',
              'cumin',
              'paprika',
              'tomatoes',
              'eggs',
              'parsley',
              'feta cheese',
              'salt'
            ]
          },
          {
            title: "Bacon, Egg, Avocado and Tomato Salad",
            directions: "Mix all ingredients together, stirring not too much, but just
            enough to make some of the avocado and egg into mush.",
            recipe_ingredients:[
              'avocado',
              'eggs',
              'tomato',
              'lemon',
              'bacon',
              'salt',
              'pepper'
            ]
          },
          {
            title: "Poke Salad",
            directions: "For the poke, mix tamari and oils together.

              Add the rest of the ingredients and mix gently. Let chill while you
              make the salad.

              For the salad, toss all but last two ingredients together in a large bowl.
              Divide the salad into individual bowls and split the poke between them.
              Garnish with sesame seeds and sliced avocado.",
            recipe_ingredients:[
              'tamari',
              'avocado oil',
              'sesame oil',
              'green onion',
              'white onion',
              'tuna',
              'crushed red pepper',
              'limu',
              'arugula',
              'romaine',
              'carrots',
              'asparagus',
              'snow peas',
              'tahini',
              'sesame seeds',
              'avocado'
            ]
          },
        ]
      end

    end
  end
end
