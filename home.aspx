<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="project_registration.home" %>

<!DOCTYPE html>

<html lang="en">
  <head>
    <title>NUTRIASSURE Landing Page</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <link rel="stylesheet" href="style.css" />
      <style>

          @import url("https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,400;0,500;0,600;0,800;1,600&display=swap");
@import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap");
:root {
  font-size: 10px;
  font-family: "Open Sans", sans-serif;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  scroll-behavior: smooth;
}
body {
  margin: 0;
  padding: 0;
}
#header {
  height: max-content;
  font-family: "Montserrat", sans-serif;
  width: 100%;
  background-color: white;
  padding: 1rem 0;
  position: sticky;
  z-index: 99;
  top: 0;
  left: 0;
  box-shadow: 0 6px 31px -2px rgba(0, 0, 0, 0.1);
}
@media (max-width: 800px) {
  #header {
    text-align: center;
    height: auto;
  }
}
.header-content-div {
  max-width: 95rem;
  width: auto;
  margin: 0 auto;
}
@media (max-width: 991px) {
  .header-content-div {
    max-width: 75rem;
  }
}
#header-img {
  height: 5rem;
  width: auto;
}
@media (max-width: 800px) {
  #header-img {
    height: 4rem;
  }
}
nav {
  position: relative;
  top: 0.8rem;
  float: right;
  font-size: 1.6rem;
  font-weight: 500;
  padding: 1.5rem 0;
}
@media (max-width: 800px) {
  nav {
    position: static;
    float: none;
    font-size: 1.4rem;
    padding: 0.5rem 1rem;
  }
}
.nav-link {
  text-decoration: none;
  color: #333;
  margin: 0 0.5rem;
  padding: 0 0.6rem;
  transition: border-bottom 0.2s;
}
@media (max-width: 475px) {
  .nav-link {
    margin: 0 0.2rem;
    padding: 0 0.2rem;
    font-size: 1.2rem;
  }
}
.nav-link:hover {
  color: #e23d3d;
  border-bottom: 2px solid #e23d3d;
}
.nav-link:active {
  color: #f84848;
}
.flexible {
  display: flex;
  flex-flow: row wrap;
  justify-content: center;
  align-content: center;
  text-align: center;
}
.home-sec {
  font-family: "Montserrat", sans-serif;
  background-color: #ffffff;
  text-align: start;
  min-height: 60rem;
  height: auto;
  margin: 0 auto 5rem auto;
  justify-content: start;
  max-width: 95rem;
  color: #333;
}
@media (max-width: 800px) {
  .home-sec {
    flex-flow: column wrap;
    max-width: 100%;
  }
}
.eye-grabber {
  flex: 1;
  padding: 0 2rem;
}
@media (max-width: 800px) {
  .eye-grabber {
    max-width: max-content;
    padding-bottom: 8rem;
  }
}
.eye-grabber h1 {
  font-size: 5rem;
  line-height: 1.5;
  font-weight: 600;
  color: green;
}
.eye-grabber h3 {
  font-size: 3rem;
  line-height: 1.5;
  font-weight: 600;
}
.eye-grabber h2 {
  font-size: 2rem;
  font-weight: 500;
  color: #666;
}
.eye-grabber-img {
  flex: 1;
}
@media (max-width: 800px) {
  .eye-grabber-img {
    width: 100%;
  }
}
.eye-grabber-img img {
  max-width: 100%;
}
.btn {
  border: none;
  font-size: 2rem;
  border-radius: 0.4rem;
  padding: 2rem;
  background-color: #3eae06;
  color: #fafafa;
  outline: 0;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  transition: all 0.2s;
}

.btn:hover {
  background-color: #f84848;
  cursor: pointer;
}
.btn:active {
  transform: scale(0.9);
}
.section-heading {
  font-size: 2.5rem;
  font-family: "Montserrat", sans-serif;
  font-weight: 500;
  line-height: 1.2;
  margin: 0;
  padding: 5rem 0 5rem 0;
  text-align: center;
}
.sec-content-div {
  font-size: 2rem;
  text-align: start;
  padding: 0 2rem 5rem 2rem;
  width: auto;
  justify-content: space-around;
  max-width: 95rem;
  margin: 0 auto;
}
.sec-padding {
  padding: 8rem 0 10rem 0;
}
#about {
  background-color: #fafafa;
}
#about img {
  max-width: 100%;
  height: auto;
  background-color: white;
  border-radius: 0.5rem;
  box-shadow: 0 6px 31px -2px rgba(0, 0, 0, 0.1);
}
#varieties {
  background-color: #e3e3e3;
}
.tile {
  background-color: #fafafa;
  height: 40rem;
  width: 25rem;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  border-radius: 0.5rem;
  transition: all 0.2s;
  padding: 1.5rem;
  margin: 1.5rem;
}
@media (max-width: 680px) {
  .tile {
    width: auto;
    max-width: 100%;
    min-width: 20rem;
    margin: 1.5rem auto;
    height: auto;
    text-decoration: none;
    cursor: pointer;
    display: block;
  }
}
.tile img {
  width: 100%;
  max-width: 48rem;
  border-radius: 0.5rem;
}
.tile h4 {
  font-size: 2rem;
  font-weight: 600;
  padding: 1rem 0;
  color: rgb(99, 222, 136) 226, 77);
  margin: 0;
}
.tile p {
  font-size: 1.6rem;
  padding: 0;
  margin: 0;
}
.tile:hover {
  transform: scale(1.05);
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.19), 0 16px 16px rgba(0, 0, 0, 0.23);
}
#our-service {
  background-color: #6ef097;
}
.bars {
  height: max-content;
  display: flex;
  flex-flow: row wrap;
  justify-content: space-between;
  align-content: flex-start;
  margin: 2rem;
  width: 100%;
}
@media (max-width: 990px) {
  .bars {
    flex-flow: column wrap;
  }
  .icon-container {
    margin: 0 2.5rem;
  }
}
.bars .icon-container {
  max-width: 10rem;
  flex: 1;
}
.icon-container img {
  max-height: 100%;
  max-width: 100%;
}
.bars .txt-container {
  flex: 2;
  padding: 3rem;
}
.txt-container h5 {
  font-size: 4rem;
  font-weight: 500;
  padding: 0;
  margin: 0;
  font-family: "Montserrat", sans-serif;
}
.txt-container p {
  font-size: 2.3rem;
}
#benefits {
  background-color:#6ef097;
}
#benefits iframe {
  outline: 0;
  border: none;
  width:100%;
  border-radius: 0.4rem;
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.19), 0 16px 16px rgba(0, 0, 0, 0.23);
}
#contact {
  background-color: #37cb6d;
  color: #fafafa;
}
#contact h6 {
  font-size: 3rem;
  font-weight: 500;
}
input[type="email"] {
  border: none;
  outline: 0;
  font-size: 2rem;
  border-radius: 0.4rem;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  padding: 2rem;
}
@media (max-width: 520px) {
  #contact h6 {
    font-size: 2rem;
  }
  #contact input[type="submit"],
  #contact input[type="email"] {
    margin: 1rem 1rem 0 1rem;
  }
}
footer {
  font-size: 1.4rem;
  background-color: #2fd14d;
  text-align: center;
  padding: 2rem;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  color: #fafafa;
}
footer a {
  color: #e3e3e3;
  text-decoration: none;
}
      </style>
  </head>
  <body>
    <header id="header">
      <div class="header-content-div">
        <a href="#home-sec">
          <img
            src="nutriassure.jpg"
            alt="Website Logo"
            id="header-img"
        /></a>
        <nav id="nav-bar">
          <a href="#" class="nav-link">HOME</a>
          <a href="#about" class="nav-link">ABOUT</a>
          <a href="#our-service" class="nav-link">OUR SERVICE</a>
	        <a href="membershipaspx.aspx" class="nav-link">MEMBERSHIPS</a>
          <a href="#benefits" class="nav-link">NUTRITIONIST INFO</a>

        </nav>
      </div>
    </header>
    <main>
      <section id="home-sec" class="flexible home-sec">
        <div class="eye-grabber-img">
          <img src="nutriassure.jpg" alt="Image of Unhealthy and healthy" />
        </div>
        <div class="eye-grabber">
          <h1>NUTRIASSURE</h1>
          <h3>Building Healthy Lifestyle</h3>
          <h2>
            Certified Nutritionits and Dietitians, Provide valuable Diet related consultation
            Heaven of Earth.
              
          </h2>
            <form runat="server">
             <asp:Button ID="Register1" runat="server" Text="Register Now" CssClass="btn" OnClick="Register1_Click" />
         </form>
        </div>
      </section>
      <section id="about" class="sec-padding">
        <h3 class="section-heading">ABOUT US</h3>
        <div class="sec-content-div flexible">
          <p>
            NutriAssure is an online platform designed to assist individuals in evaluating and
            understanding their nutritional status. The website aims to promote overall health and
            well-being by providing users with tools and information to assess their diet and make
            informed choices about their nutrition.
		       In this new era of the digital world, we know the concept of Online Appointment whichr̥r̥
	        does not include the usage of paper and pen. NutriAssure is a type of learning Nutritional
	        Health Information digitally via electronic media, typically involving the Internet.
	        Nowadays Hospitals and Clinics are also implementing Online Appointment systems in
	        the form of Websites and apps.
          </p>
          <img src="images of healthy and unhealthy.jpg "/>
        </div>
      </section>
      <section id="our-service" class="sec-padding">
        <h3 class="section-heading">OUR-SERVICE</h3>
        <div class="sec-content-div flexible">
            <a href="assessment.aspx">
          <div class="tile">
            <img src="nutritionalassessment.jpg" alt="photo of ASSESSMENT" />
            <h4>Nutritional Assessment </h4>
              </a>
            <p>
              It is about your daily routine Questionary. User can check their nutritional
              health status through the assessment. 
           </p>
          </div>
            
          <a href="Consult.aspx">
          <div class="tile ">
            <img src="images of healthy and unhealthy.jpg"
              alt="photo of consultant"
            />
            <h4> Consultation </h4>
              </a>
            <p>
             Take Nutritionist or dietatian's consult by booking an appointment with them with offline/online mode.
            </p>
          </div>

         
          <div class="tile">
              <a href="NutritionalInfo.aspx">
            <img src="Nutritional info.jpg" alt="photo of confused girl" />
            <h4> Nutritional Info</h4>
                  </a>
            <p>
             Nutritional information about food
            </p>
          </div>
          <a href="DietPlan.aspx">
          <div class="tile">
            <img src="https://img.freepik.com/free-vector/diet-plan-schedule_3446-617.jpg" alt="photo of dietplan" />
            <h4>Diet Plans</h4>
              </a>
            <p>
              Free diet plans to stay healthy as well as personalised diet plans according to medical condition.
              
            </p>

          </div>
          <a href="fooddiary.aspx">
          <div class="tile">
            <img src="https://i.pinimg.com/736x/6a/18/c1/6a18c1a9f7425550f8b48362c92c03f6.jpg" alt="photo of food" />
            <h4>Food Diary</h4>
              </a>
            <p>
             This feature will contain various diet food
	            recipes as per MEDICAL HISTORY,AND TRADITIONAL/CULTURAL ASPECT.
            </p>
          </div>
          <a href="membershipaspx.aspx">
          <div class="tile">
            <img src="https://static.vecteezy.com/system/resources/thumbnails/004/442/878/small/wallet-illustrated-on-a-background-free-video.jpg" alt="photo of premium" />
            <h4>Premium Membership</h4>
              </a>
            <p>
              Get Rewards and Discounts
              
            </p>
          </div>

           <a href="Premiumassessment.aspx">
          <div class="tile">
            <img src="https://us.123rf.com/450wm/iconscart/iconscart2008/iconscart200801228/167555469-clipboard-icon-for-website-design-and-desktop-envelopment-development-premium-pack.jpg?ver=6" alt="photo of premium assessmnet" />
            <h4>Premium Assessment</h4>
              </a>
            <p>
              Get Rewards and Discounts
              
            </p>
          </div>

        </div>
      </section>
      <section id="memberships" class="sec-padding">
        <h3 class="section-heading">MEMBERSHIPS</h3>
        <div class="sec-content-div">
          <div class="bars">
            <div class="icon-container">
              <img src="https://i.ibb.co/w6H542X/Fresh.png" alt="" />
            </div>
            <div class="txt-container">
              <h5>Accuracy</h5>
              <p>We provide 90% accurate results.</p>
            </div>
          </div>
          <div class="bars">
            <div class="icon-container">
              <img src="certified.jpg" alt="" />
            </div>
            <div class="txt-container">
              <h5>Certified Nutritionist/Dietitian</h5>
              <p>
                We have certified and experienced Nutritionist/Dietitian's.
              </p>
            </div>
          </div>
          <div class="bars">
            <div class="icon-container">
              <img src="https://i.ibb.co/HHQK1wV/happy.png" alt="" />
            </div>
            <div class="txt-container">
              <h5>Satisfying</h5>
              <p>
                We guarantee 100% customer satisfaction. We do our best to make
                your nutritional health journey smooth. 
              </p>
            </div>
          </div>
        </div>
      </section>
      <section id="benefits" class="sec-padding">
        <h3 class="section-heading">Nutritionist/Dietitians</h3>
        <div class="sec-content-div flexible">
         <img src="yash_image.jpg" alt="Nutritionist_image">
            <br />
    
         
          <div>
              <label>Name: Yash Narendra Sawant</label>
                 <label>Education/Specialization: </label>
                    <li>Bachelor in Microbiology</li>
                    <li>Diploma in Clinical Dietetics and Nutrition</li>
                    <li> Diploma in Sports Nutrition and Rehabilitation</li>
                 <asp:Label ID="Label3" runat="server"></asp:Label>
         </div>
        
    <div>
        <p>
            <label>Experience: </label>
           
                4 years of experirnce working at DR.patkars Company as Nutritionist.
            </p>
            <asp:Label ID="Label4" runat="server"></asp:Label>
        </div>

        <div>
            <label>Certification Details:</label>
            <br />
<img src="certificate1.jpg" alt="Recipe 1 Image" height="500px" width="500px">
            
            <asp:Label ID="Label5" runat="server"></asp:Label>
        </div>

        </div>
      </section>
    <section class="sec-padding" id="contact">
  <h3 class="section-heading">CONTACT</h3>
  <div class="sec-content-div flexible">
    <h6>For any Query or To just know more, contact us:</h6>
    <form id="form" action="mailto:knowd1499@gmail.com" method="POST">
      <input type="email" name="email" id="email" placeholder="knowd1499@gmail.com" required>
    </form>
  </div>
</section>

        
    </main>
  </body>
</html>