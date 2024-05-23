<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DietPlan.aspx.cs" Inherits="project_registration.DietPlan" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diet plan Page</title>
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
        <h1>WEEKLY DIET PLAN</h1>
    </header>

    <nav>
        <a href="#day1">DAY 1</a>
        <a href="#day2">DAY 2</a>
        <a href="#day3">DAY 3</a>
        <a href="#day4">DAY 4</a>
        <a href="#day5">DAY 5</a>
        <a href="#day6">DAY 6</a>
        <a href="#day7">DAY 7</a>
        
        
    </nav>

    <!-- DAY 1 -->
    <div id="day1" class="recipe-card">
        <img class="recipe-img" src="https://www.eatingwell.com/thmb/-EEYuMpDC4HIcq6DeA89OZfaipg=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/3759256-0b15ae3e86604d0f9ecc5965261ad347.jpg" alt="Recipe 1 Image">
        <div class="recipe-content">
            <h2>DAY 1</h2>
            <p>
                Breakfast:
                <ul>
                    <li> 1 serving Strawberry-Pineapple Smoothie</li>
                </ul>
                </p>
            <p>
                A.M. Snack :
                <ul>
                    <li>1 ½ cups edamame, in pods</li>
                </ul>
            </p>
            <p>  
                Lunch:
                <ul>
                    <li>1 serving Vegan Superfood Grain Bowl</li>
                </ul>
            </p>
            <p> 
                P.M. Snack:
                <ul>
                    <li> ¼ cup dry-roasted unsalted almonds</li>
                </ul>
            </p>
            <p> 
                Dinner 
            <ul>
                <li>1 serving One-Pot Tomato Basil Pasta</li>
                <li> 2 cups mixed greens</li>
                <li> 1 serving Lemon-Garlic Vinaigrette</li>
                   
                </ul>
            </p>
            
        </div>
    </div>

    <!-- DAY 2 -->
    <div id="day2" class="recipe-card">
        <img class="recipe-img" src="https://www.eatingwell.com/thmb/YsJYxGEgVkoEImf8OslFdQTPB-k=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/45650891-b4331b153fd44ad297be6932fa683353.jpg">
        <div class="recipe-content">
            <h2>DAY 2</h2>
            <p>
                Breakfast:
            <ul>
                <li> 1 serving Peanut Butter & Chia Berry Jam English Muffin
</li>
            </ul>
            </p>
            <p>
                 A.M. Snack :
            <ul>
                <li> cup edamame pods, seasoned with a pinch of salt</li>
            </ul>
            </p>
            <p>  
                Lunch:
            <ul>
                <li>4 cups White Bean & Veggie Salad</li>
            </ul>
            </p>
            <p> 
                 Dinner:
            <ul>
                <li> 2 cups Black Bean-Quinoa Bowl</li>
            </ul>
            </p>
            
        </div>
    </div>

    <!-- DAY 3-->
    <div id="day3" class="recipe-card">
        <img class="recipe-img" src="https://www.eatingwell.com/thmb/Jz9RuPcU_CrvLvLmM_OQz9DaFS4=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/42935371-8081fba24de540868aa46aae2864f5c7.jpg" alt="Recipe 3 Image">
        <div class="recipe-content">
            <h2>DAY 3</h2>
            <p>
            Breakfast:
            <ul>
                <li> 1 serving Peanut Butter-Banana Cinnamon Toast</li>
            </ul>
             </p>
            <p>
                A.M. Snack :
            <ul>
                    <li>2 Tbsp. pumpkin seeds (pepitas)</li>
            </ul>
            </p>
            <p>  
                 Lunch:
            <ul>
                 <li>4 cups serving Green Salad with Edamame & Beets</li>
            </ul>
            </p>
            <p> 
                 P.M. Snack:
            <ul>
                  <li>2 cups air-popped popcorn</li>
            </ul>
            </p>
            <p> 
                Dinner 
            <ul>
                <li>1 1/2 cups Roasted Cauliflower & Potato Curry Soup</li>
                <li> 1/2 small whole-wheat pita, toasted</li>
                 <li> 1/3 cup hummus </li>
       
            </ul>
            </p>
        </div>
    </div>

     <!-- DAY 4 -->
    <div id="day4" class="recipe-card">
        <img class="recipe-img" src="https://www.eatingwell.com/thmb/KyfSdk76a409XNovhU69kE-9qlA=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Stuffed-Sweet-Potato-with-Hummus-Dressing-92af930dff534218b4692b9d2c61732f.jpeg" alt="Recipe 4 Image">
        <div class="recipe-content">
            <h2>DAY 4</h2>
            <p>
    Breakfast:
    <ul>
        <li> 1/3 cup Quinoa & Chia Oatmeal Mix cooked with 1 1/4 cups unsweetened soymilk</li>
    </ul>
    </p>
<p>
    A.M. Snack :
    <ul>
        <li>1 small plum</li>
    </ul>
</p>
<p>  
    Lunch:
    <ul>
        <li>1 1/2 cups Roasted Cauliflower & Potato Curry Soup</li>
        <li>1/2 small whole-wheat pita, toasted</li>
    </ul>
</p>
<p> 
    P.M. Snack:
    <ul>
        <li>2 Tbsp. pumpkin seeds (pepitas) </li>
    </ul>
</p>
<p> 
    Dinner 
<ul>
    <li>1 serving Stuffed Sweet Potato with Hummus Dressing</li>
   
 </ul>
</p>
        </div>
    </div>

     <!-- DAY 5 -->
    <div id="day5" class="recipe-card">
        <img class="recipe-img" src="https://www.eatingwell.com/thmb/2Dpt9hZcevmwdhr4_Un4hor1Ibg=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/chickpea-curry-825047148a8d497b9d9f4b2cb5048831.jpg" alt="Recipe 5 Image">
        <div class="recipe-content">
            <h2>DAY 5</h2>
            <p>
    Breakfast:
    <ul>
        <li>2 Vegan Pancakes<//li>
        <li>1/4 cup blackberries</li>
        <li>1 Tbsp. peanut butter</li>
    </ul>
    </p>
<p>
    A.M. Snack :
    <ul>
        <li>1 serving Veggie & Hummus Sandwich</li>
    </ul>
</p>
<p>  
    Lunch:
    <ul>
        <li>1/2 cup edamame pods, seasoned with a pinch of salt</li>
    </ul>
</p>

<p> 
    Dinner 
<ul>
    <li>1 cup Chickpea Curry</li>
 <li>1 cup Basic Quinoa</li>
   
    </ul>
</p>
        </div>
    </div>



      <!-- DAY 6 -->
    <div id="day6" class="recipe-card">
        <img class="recipe-img" src="https://www.eatingwell.com/thmb/OqGHZrqKauEc6CNPy6iTiCvL8e0=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/55716801-6a40334eeedc4b0e962be75a363f7228.jpg" alt="Recipe 6 Image">
        <div class="recipe-content">
            <h2>DAY 6</h2>
            <p>
    Breakfast:
    <ul>
        <li>1 serving Peanut Butter & Chia Berry Jam English Muffin</li>
    </ul>
    </p>
<p>
    A.M. Snack :
    <ul>
        <li>1/4 cup hummus</li>
        <li> 2 medium celery stalks, cut into sticks</li>
    </ul>
</p>
<p>  
    Lunch:
    <ul>
        <li>1 serving Vegan Bistro Lunch Box</li>
        <li>2 Tbsp pumpkin seeds (pepitas)</li>
    </ul>
</p>

<p> 
    Dinner 
<ul>
    <li>1 serving Spaghetti Squash with Peanut Sauce & Edamame</li>
    <li>1 cup Spicy Cucumber Salad with Cilantro & Peanuts</li>
  </ul>
</p>
        </div>
    </div>

   <!-- DAY 7 -->
    <div id="day7" class="recipe-card">
        <img class="recipe-img" src="https://www.eatingwell.com/thmb/LxyWyG8X4xgFbwNAkc0Q4XAKVIk=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/39999061-b338f88cee1e45c9b4f69d080ea95d0d.jpg" alt="Recipe 7 Image">
        <div class="recipe-content">
            <h2>DAY 7</h2>
            <p>
    Breakfast:
    <ul>
        <li> 1 serving Sprouted-Grain Toast with Peanut Butter & Banana</li>
    </ul>
    </p>
<p>
    A.M. Snack :
    <ul>
        <li>1 ¾ cups edamame, in pods</li>
    </ul>
</p>
<p>  
    Lunch:
    <ul>
        <li>1 serving Vegan Superfood Grain Bowl</li>
    </ul>
</p>
<p> 
    P.M. Snack:
    <ul>
        <li> ¼ cup dry-roasted unsalted almonds</li>
    </ul>
</p>
<p> 
    Dinner 
<ul>
    <li>1 serving One-Pot Tomato Basil Pasta</li>
    <li> 2 cups mixed greens</li>
    <li> 1 serving Lemon-Garlic Vinaigrette</li>
       
    </ul>
</p>
        </div>
    </div>

</body>
</html>
