<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fooddiary.aspx.cs" Inherits="project_registration.fooddiary" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Diary Page</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
        }

        header {
            background-color: black;
            color: white;
            padding: 10px;
            text-align: center;
        }

        nav {
            display: flex;
            justify-content: space-around;
            background-color: #333;
            padding: 10px;
        }

        nav a {
            color: white;
            text-decoration: none;
        }

        h1, h2 {
            color: #4CAF50;
            margin-bottom: 20px;
        }

        .recipe-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .recipe-img {
            width: 250px;
            height: 200px;
            object-fit: cover;
            border-radius: 8px 8px 0 0;
        }

        .recipe-content {
            padding: 20px;
        }

        .recipe h2 {
            color: #e44d26;
            margin-bottom: 10px;
        }

        ul, ol {
            margin: 10px 0;
            padding-left: 20px;
        }

        li {
            margin-bottom: 5px;
        }

        @media screen and (min-width: 768px) {
            .recipe-card {
                display: flex;
            }

            .recipe-img {
                 width: 500px;
            height: 500px;
                border-radius: 8px 0 0 8px;
            }

            .recipe-content {
                width: 60%;
            }
        }
    </style>
</head>
<body>

    <header>
        <h1>Food Diary</h1>
    </header>

    <nav>
        <a href="#recipe1">Avocado Toast with Sprouts</a>
        <a href="#recipe2">Green Goddess Salad</a>
        <a href="#recipe3">Pomegranate salad with feta and beetroot</a>
        <a href="#recipe4">Mango salad with avocado and black beans</a>
        <a href="#recipe5">couscous Salad</a>
        <a href="#recipe6">Chicken Salad</a>
        <a href="#recipe7">Fish Salad</a>
        
        
    </nav>

    <!-- Recipe 1 -->
    <div id="recipe1" class="recipe-card">
        <img class="recipe-img" src="https://img.freepik.com/premium-photo/avocado-toast-with-boiled-egg-seeds-sprouts-white-background-healthy-diet-food_745171-2639.jpg?w=996" alt="Recipe 1 Image">
        <div class="recipe-content">
            <h2>Avocado Toast with Sprouts</h2>
            <p>
                Ingredients:
                <ul>
                    <li>1 cup mixed salad greens</li>
                    <li>1 teaspoon red-wine vinegar</li>
                    <li>1 teaspoon extra-virgin olive oil</li>
                    <li>Pinch of salt and pepper</li>
                    <li>2 slices sprouted whole-wheat bread, toasted</li>
                    <li>¼ cup plain hummus</li>
                    <li>¼ avocado, sliced</li>
                    <li>¼ cup alfalfa sprouts</li>
                </ul>
            </p>
            <p>
                Instructions:
                <ol>
                    <li>Toss greens with vinegar, oil, salt, and pepper in a medium bowl.</li>
                    <li>Spread each slice of toast with 2 tablespoons hummus.</li>
                    <li>Top with sprouts, avocado, and the greens and sprinkle with sunflower seeds.</li>
                </ol>
            </p>
        </div>
    </div>

    <!-- Recipe 2 -->
    <div id="recipe2" class="recipe-card">
        <img class="recipe-img" src="https://www.sprinkleofgreen.com/wp-content/uploads/2019/03/Green-Goddess-Salad-7-of-7-copy.jpg" alt="Recipe 2 Image">
        <div class="recipe-content">
            <h2>Green Goddess Salad</h2>
            <p>
                Ingredients:
                <ul>
                    <li>2 cups mixed salad greens</li>
                    <li>1 cup cherry tomatoes, halved</li>
                    <li>1 cucumber, sliced</li>
                    <li>1/2 cup broccoli florets</li>
                    <li>1/4 cup red onion, thinly sliced</li>
                    <li>1/4 cup feta cheese, crumbled</li>
                    <li>1/4 cup balsamic vinaigrette dressing</li>
                </ul>
            </p>
            <p>
                Instructions:
                <ol>
                    <li>In a large bowl, combine salad greens, cherry tomatoes, cucumber, broccoli, red onion, and feta cheese.</li>
                    <li>Drizzle balsamic vinaigrette dressing over the salad.</li>
                    <li>Toss the salad gently to coat all ingredients with the dressing.</li>
                    <li>Serve immediately and enjoy your healthy and delicious diet salad!</li>
                </ol>
            </p>
        </div>
    </div>

    <!-- Recipe 3 -->
    <div id="recipe3" class="recipe-card">
        <img class="recipe-img" src="https://images.squarespace-cdn.com/content/v1/51c2c520e4b083db82094b30/1371762716784-L7RTXQV9LW1N4RXUX9YW/Pomegranate+Salad+01.jpg" alt="Recipe 3 Image">
        <div class="recipe-content">
            <h2>Pomegranate salad with feta and beetroot</h2>
            <p>
                Ingredients:
             <ul>
             <li>2 tsp rapeseed oil</li>
            <li>1 tbsp pomegranate molasses</li>
            <li>pinch of ground cinnamon</li>
            <li>1 tsp cumin seeds, toasted</li>
            <li>squeeze of lemon juice</li>
            <li>handful of parsley, finely chopped</li>
            <li>handful of mint leaves, torn</li>
            <li>2 cooked beetroot, cut into thin wedges</li>
            <li>30g feta, crumbled</li>
            <li>handful of rocket leaves</li>
            <li>½ romaine lettuce, torn into bite-sized pieces</li>
            <li>20g pomegranate seeds</li>
             
         </ul>
            </p>
            <p>
                Instructions:
                <ol>
                    <li>Whisk the oil, pomegranate molasses, cinnamon, cumin seeds and lemon juice together in a bowl.</li>
             <li> Add 1 tbsp water to loosen, and season.</li>
             <li>Toss in the herbs, beetroot, feta, rocket and lettuce, and toss to coat in the dressing.</li>
             <li>Sprinkle over the pomegranate seeds to serve.</li>
                </ol>
            </p>
        </div>
    </div>

     <!-- Recipe 4 -->
    <div id="recipe4" class="recipe-card">
        <img class="recipe-img" src="https://i0.wp.com/kaleforniakravings.com/wp-content/uploads/2023/06/Black-bean-mango-salad-3-2.jpg?fit=800%2C1200&ssl=1" alt="Recipe 4 Image">
        <div class="recipe-content">
            <h2>Mango salad with avocado and black beans</h2>
            <p>
                Ingredients:
              <ul>
            <li>1 lime, zested and juiced</li>
            <li>1 small mango, stoned, peeled and chopped</li>
            <li>1 small avocado, stoned, peeled and chopped</li>
            <li>100g cherry tomatoes, halved</li>
            <li>1 red chilli, deseeded and chopped</li>
            <li>1 red onion, chopped</li>
            <li>½ small pack coriander, chopped</li>
            <li>400g can black beans, drained and rinsed</li>
          
        </ul>
            </p>
            <p>
                Instructions:
               <ol>
            <li>Put the lime zest and juice, mango, avocado, tomatoes, chilli and onion in a bowl,</li>
            <li>stir through the coriander and beans.</li>
        </ol>
            </p>
        </div>
    </div>

     <!-- Recipe 5 -->
    <div id="recipe5" class="recipe-card">
        <img class="recipe-img" src="https://www.wellplated.com/wp-content/uploads/2016/07/Israeli-Couscous-Salad-Feta.jpg" alt="Recipe 5 Image">
        <div class="recipe-content">
            <h2>couscous salad</h2>
            <p>
                Ingredients:
             <ul>
             <li>100g couscous</li>
             <li>200ml hot low salt vegetable stock (from a cube is fine)</li>
             <li>2 spring onions</li>
             <li>1 red pepper</li>
             <li>50g feta cheese, cubed</li>
             <li>2tbsp pesto</li>
             <li>2tbsp pine nuts</li>
           
        </ul>
            </p>
            <p>
                Instructions:
             <ol>
            <li>Tip the couscous into a large bowl and pour over the stock.</li>
            <li>Cover, then leave for 10 mins until fluffy and all the stock has been absorbed.</li>
            <li>Meanwhile, slice the onions and pepper, and dice the cucumber.</li>
            <li>Add these to the couscous, fork through the pesto, crumble in the feta.</li>
            <li>then sprinkle over pine nuts to serve. </li>
            
        </ol>
            </p>
        </div>
    </div>



      <!-- Recipe 6 -->
    <div id="recipe6" class="recipe-card">
        <img class="recipe-img" src="https://www.licious.in/blog/wp-content/uploads/2022/03/shutterstock_1089760742-min.jpg" alt="Recipe 6 Image">
        <div class="recipe-content">
            <h2>Chicken salad</h2>
            <p>
                Ingredients:
             <ul>
             <li>1 large chicken breast or 2 small</li>
             <li>1 small baby cos lettuce, sliced in chunks</li>
            <li>4 cherry tomatoes, havled</li>
            <li>1 lebanese cumcumber, sliced</li>
            <li>4 cup mushrooms, wiped and sliced</li>
            <li>½ cup corn</li>
            <li>1 tbsp. olive oil</li>
            <li>2 slices multigrain toast, cut into squares</li>
            <li>2 tbsp. sweet chilli sauce</li>
            <li>2 tbsp. lemon or lime juice</li>
            <li>Salt & Pepper to taste</li>
        </ul>
            </p>
            <p>
                Instructions:
            <ol>
            <li>Heat a griddle pan or BBQ for 5 mins. </li>
            <li>Place a sheet of baking paper on bench,spray a little cooking spray,</li>
            <li> place chicken breast on the paper then season with Salt & Pepper and a sprinkle of rosemary.</li>
            <li>Cover with another sheet of baking paper and flatten with rolling pin or mallet until even.</li>
            <li>Place chicken on griddle pan and cook 5 mins each side or until cooked all the way through. </li>
            <li>Take off, set on a plate, cover with foil to rest.</li>
             <li> Meanwhile cut the lettuce into chunks and add the tomatoes, cucumber, corn and mushrooms on top of the lettuce.</li>
             <li> In a small bowl mix the sweet chilli sauce lime juice, olive oil until all incorporated.</li>
             <li> With a sharp knife slice chicken into chunks or slices and place on salad ingredients.</li>
             <li> Drizzle dressing over, season with more cracked pepper.</li>
    
        </ol>
            </p>
        </div>
    </div>



     <!-- Recipe 7 -->
    <div id="recipe7" class="recipe-card">
        <img class="recipe-img" src="https://cheflolaskitchen.com/wp-content/uploads/2019/10/easy-healthy-salmon-salad-recipe-375.jpg.webp" alt="Recipe 7 Image">
        <div class="recipe-content">
            <h2>Fish salad</h2>
            <p>
                Ingredients:
            <ul>
             <li>300 gms fish</li>
            <li>1 tbsp olive oil</li>
             <li>½ tsp oregano</li>
            <li>½ cup Basil</li>
            <li>½ cup cherry tomatoes</li>
            <li>½ cup black olives pitted</li>
            <li>½ cup cucumber chopped</li>
            <li>½ cup Red Bell Pepper thinly sliced</li>
            <li>½ cup red onion thinly sliced</li>
            <li>Salt and pepper to taste</li>
        </ul>
            </p>
            <p>
                Instructions:
           <ol>
            <li>Rub each side of the fish fillet with olive oil,</li>
            <li>salt, pepper and oregano. In a non-stick pan, heat olive oil on a high flame and place the fish fillets.</li>
            <li>Cook the fish for about 3-4 minutes on each side or until slightly golden on the outside.</li>
            <li>Toss all of the salad ingredients in a bowl.</li>
            <li>Whisk together all the dressing ingredients and pour over the salad.</li>
            <li>Place the fish over the top of the salad and serve with lemon wedges and an extra drizzle of olive oil.</li>
        </ol>
            </p>
        </div>
    </div>

</body>
</html>
