<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NutritionalInfo.aspx.cs" Inherits="project_registration.NutritionalInfo" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nutritional innformation Page</title>
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
        <h1>Nutritional Information</h1>
    </header>

    <nav>
        <a href="#day1">Leafy Vegetables</a>
        <a href="#day2">Ground Vegetables</a>
        <a href="#day3">Fruits</a>
        <a href="#day4">Dry Fruit</a>
        <a href="#day5">Fish & Meat</a>
        <a href="#day6">Eggs</a>
        <a href="#day7">Dairy Products</a>
        
        
    </nav>

    <!-- DAY 1 -->
    <div id="day1" class="recipe-card">
        <img class="recipe-img" src="https://gabbarfarms.com/cdn/shop/products/Harvest-Box_600x.jpg?v=1634637652" alt="Recipe 1 Image">
        <div class="recipe-content">
            <h2>Leafy Vegetables</h2>
            <p>
              <ul> <li> Packed with Vitamins– All leafy greens have an abundant store of nature’s vitamins. However, kale, spinach, moringa, and cabbage are known for their superior vitamin content. You get a good amount of vitamin A, vitamin K, vitamin E, vitamin C, beta-carotene, folate, vitamin B1, B2, B3, B5 and, B6 from these vegetables.</li></ul>
<ul><li>High mineral content–  Minerals like iron, magnesium, potassium, zinc, calcium, phosphorus, and sodium can be added naturally to your diet by eating green leafy veggies. They help to maintain the daily requirement and overcome the deficiency of dietary minerals by providing an adequate amount of minerals in every bite.</li></ul>
<ul><li>Rich in dietary fibers–  Green leaves have good fiber content which makes you feel satisfied after you consume them. Fiber also provides various other health benefits.</li></ul>
<ul><li>Low-fat content–  These leafy greens save you from consuming fats and lipids as they have nearly zero fat content.</li></ul>


            </p>
            
        </div>
    </div>

    <!-- DAY 2 -->
    <div id="day2" class="recipe-card">
        <img class="recipe-img" src="https://backontrack2wellness.com/wp-content/uploads/2020/12/fresh-organic-root-vegetables-on-rustic-background-LV2RYCW-scaled.jpg">
        <div class="recipe-content">
            <h2>Ground Vegetables</h2>
            <p>
                <ul>

               Edible roots have some similar nutritional features. All of them constitute a good source of fiber (1.6–7.3 g/100 g). 
                Moreover, they are characterized by a low energy value (16–81 kcal/100 g) due to their high content of water (75.0–95.4%) 
                The caloric value of root vegetables increases in the following order: radish < turnip < carrot < celery < beetroot < parsley < horseradish. 
                </ul>
                <ul>
                    One of their most important features is their high content of bioactive compounds, such as polyphenols, phenols, and flavonoids. 
                Moreover, they are rich in vitamin C (3.9 mg/100 g in celery and up to 114.0 mg/100 g in horseradish). 
                Therefore, root vegetables can be considered a biofunctional food.
            </ul>
            </p>
            
        </div>
    </div>

    <!-- DAY 3-->
    <div id="day3" class="recipe-card">
        <img class="recipe-img" src="https://food.fnr.sndimg.com/content/dam/images/food/fullset/2022/06/23/fn_fruit-bowl-healthy-getty_s4x3.jpg.rend.hgtvcom.1280.1280.suffix/1655995735443.jpeg" alt="Recipe 3 Image">
        <div class="recipe-content">
            <h2>Fruits</h2>
            <p>
               <ul>
                Fruits represent nature's remarkable gift to humanity, serving as life-enhancing remedies rich in
                vitamins, minerals, antioxidants, and numerous phytonutrients (micronutrients derived from plants). 
                They captivate our senses, not only with their vibrant colors and delightful flavors but also with their distinctive
                nutritional composition that promotes fitness, rejuvenation, and overall well-being while guarding against diseases!
               </ul> 
                
               <ul> 
                Within fruits lie a plethora of antioxidants, including polyphenolic flavonoids, vitamin C, and anthocyanins.
                These compounds serve a dual purpose: firstly, shielding the human body from oxidative stress, diseases, and cancers, and secondly, enhancing the body's ability to combat these ailments by bolstering our immune system.
                Compared to vegetables and cereals, many fruits boast remarkably high antioxidant values, measured by their "Oxygen Radical Absorbent Capacity" (ORAC).
               </ul>

           
            </p>
        </div>
    </div>

     <!-- DAY 4 -->
    <div id="day4" class="recipe-card">
        <img class="recipe-img" src="https://images.healthshots.com/healthshots/en/uploads/2022/11/27124337/nuts.jpg" alt="Recipe 4 Image">
        <div class="recipe-content">
            <h2>Dry Fruits</h2>
            <p>
     <ul>
         There’s a huge range of dried fruits available on the market, all with varied nutrient profiles. 
            One cup of mixed dried fruit contains approximately:
       </ul>
       <ul>
       <li> Calories: 480</li>
         <li>Protein: 4 grams</li>
        <li> Fat: 0 grams</li>
         <li>Carbohydrates: 112 grams</li>
         <li>Fiber: 8 grams</li>
         <li>Sugar: 92 grams</li>
           </ul>

       
    </ul>
    </p>

        </div>
    </div>

     <!-- DAY 5 -->
    <div id="day5" class="recipe-card">
        <img class="recipe-img" src="https://media.istockphoto.com/id/1165495283/photo/different-types-of-animal-protein.jpg?s=612x612&w=0&k=20&c=90eC1JAUl9zVzPoW_rZDmP4yTTQEDjTa-_xzkZD-sHM=" alt="Recipe 5 Image">
        <div class="recipe-content">
            <h2>Fish&Meat</h2>
            <p>
    
    <ul>
        Generally meats consist of about 20 percent protein, 20 percent fat, and 60 percent water.
        The amount of fat present in a particular portion of meat varies greatly, not only with the kind of meat but also with the quality;
        the “energy value” varies in direct proportion with the fat content . 
        </ul>
        <ul>

        Meat is valuable for its protein, which is of high biological value. Pork is an excellent source of thiamin.
        Meat is also a good source of niacin, vitamin B12, vitamin B6, and the mineral nutrients iron, zinc, phosphorus, potassium, and magnesium. 
</ul>
                <ul>
        Liver is the storage organ for, and is very rich in, vitamin A, riboflavin, and folic acid. 
        In many cultures the organs (offal) of animals—including the kidneys, the heart, the tongue, and the liver—are considered delicacies. 
        Liver is a particularly rich source of many vitamins.
         </ul>
      </p>
    
        </div>
    </div>



      <!-- DAY 6 -->
    <div id="day6" class="recipe-card">
        <img class="recipe-img" src="https://media.istockphoto.com/id/520889612/photo/boiled-eggs-in-bowl.jpg?s=612x612&w=0&k=20&c=wwes11nnPnZu7IFz6SSSjhsfoBK-ZcTFsqH9Em72ClA=" alt="Recipe 6 Image">
        <div class="recipe-content">
            <h2>Eggs</h2>
            <p>
  
    <ul>
        The egg has a deservedly high reputation as a food. Its white contains protein, and its yolk is rich in both protein and vitamin A (see table). 
        An egg also provides calcium and iron. 
        Egg yolk, however, has a high cholesterol content.
    </ul>
    <p>
        WHOLE EGG
        <ul>
            <li>Energy: 149</li>
            <li>Water: 75.33</li>
            <li>Protein:12.49</li>
            <li>Fat: 10.02</li>
            <li>Cholesterol:425</li>
            <li>Carbohydrate: 1.22</li>
            <li>Vitamin A:635</li>
            <li>Riboflavin: 0.508</li>
            <li>Calcium: 49</li>
            <li>Phosphorus:178</li>

        </ul>
    </p>
            </p>
        </div>
    </div>

   <!-- DAY 7 -->
    <div id="day7" class="recipe-card">
        <img class="recipe-img" src="https://d1n5l80rwxz6pi.cloudfront.net/general/blog/importance-of-dairy-products.jpg" alt="Recipe 7 Image">
        <div class="recipe-content">
            <h2>Dairy Products</h2>
    <p>
        <ul>
            Dairy is an important part of a balanced diet. Milk and dairy products can be important sources of calcium, magnesium, selenium, riboflavin, vitamin B12 and pantothenic acid.
            Consumption of dairy can bring important nutritional benefits to large segments of the population in developing and developed countries.
            Because of the important contribution dairy makes to nutrition, most countries recommend at least one serving of milk or milk products daily. 
            Some recommend up to four servings each day.
        </ul>
        <ul>
            Dairy is a highly nutritious food which provides:
            High quality protein: A glass of milk contains 8-10 grams of protein, about one-fifth the daily recommendation for a 135-pound person.
            Important minerals such as: calcium, iodine, phosphorus and potassium Vitamin B2, B5 and B12

        </ul>
</p>
        </div>
    </div>

</body>
</html>