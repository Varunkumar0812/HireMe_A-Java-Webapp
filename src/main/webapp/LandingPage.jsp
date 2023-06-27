<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype HTML>
<html>
<head>
    <title>HireMe - A Job Portal Website</title>

    <link rel="icon" type="image/x-icon" href="images/logo.png">
    <style>
        html {
            scroll-behavior  : smooth;
        }

        body {
            background       : black;
            margin           : 0;
        }

        .outer-box {
            background       : url("images/bg.jpg") no-repeat left/cover;
            height           : 500px;
            width            : 100%;
            margin           : 0 0 0 0;
            padding          : 150px 0 0 0;
        }

        #container {
            color            : white;
            height           : 100px;
            width            : 800px;
            margin           : 0 40vw;
            text-align       : center;
            font-size        : 100px;
        }

        #title {
            font-family      : 'Roboto Slab', serif;
        }

        #title:hover {
            font-size        : 120px;
            cursor           : default;
            transition       : 0.3s;
        }

        #con_text {
            font-size        : 20px;
            text-align       : center; 
            font-family      : 'Courgette', cursive;   
        }

        #sign_in, #sign_up {
            background       : #9AC5F4;
            width            : 150px;
            height           : 50px;
            border           : none;
            border-radius    : 5px;
            font-size        : 18px;
            font-family      : 'Play', sans-serif;
        }

        #sign_in:hover, #sign_up:hover {
            background       : #061c3f;
            width            : 160px;
            height           : 60px;
            color            : white;
            border           : 5px solid white;
            border-radius    : 0px;
            cursor           : pointer;
            transition       : 0.3s;
        }

        .about {
            background       : black;
            color            : white; 
            display          : flex;
        }

        #about_content {
            background       : black;
            width            : 40%;    
            margin           : 75px 0 75px 100px;
            padding          : 25px;
            font-size        : 25px;
            font-family      : 'PT Sans', sans-serif;
            justify-content  : left;
        }

        #about_content_title {
            margin-bottom    : 20px;
            font-size        : 40px;
            font-family      : 'Roboto Slab', serif;
        }

        #about_image_holder {
            background       : black;
            width            : 50%;
            margin           : 75px 0 75px 0;
            justify-content  : right;
        }

        #about_image {
            background       : url("images/about_image.jpg") no-repeat center/cover;
            width            : 90%;
            height           : 80%;
            margin-top       : 50px;
        }

        #about_image:hover {
            height           : 100%;
            width            : 100%; 
            margin           : 0px;  
            transition       : 0.3s;
        }

        .review_holder {
            padding          : 70px 0 70px 0;
            display          : flex;
            justify-content  : space-evenly;
            flex-wrap        : wrap;
        }

        #review_box_holder {
            height           : 500px;
            width            : 450px;
        }

        #review_box {
            background       : rgb(255, 255, 255);
            height           : 75%;
            width            : 75%;
            margin           : 25px 0 0 15px;
            padding          : 40px;
            text-align       : center;
            display          : flex;
            justify-content  : space-around;
            flex-direction   : column;
        }

        #review_box:hover {
            margin           : 0px;
            height           : 84%;
            width            : 82%;
            cursor           : default;
            transition       : 0.5s;
        }

        #review_image {
            background-size  : cover;
            height           : 120px;
            width            : 120px;
            margin-left      : 36%;
            border-radius    : 100px;
        }

        #review_name  {
            height           : 50px;
            width            : 100%;
            padding-top      : 15px;
            font-size        : 25px;
            font-family      : 'Roboto Slab', serif;
        }

        #review_content {
            height           : 50%;
            width            : 100%;
            font-size        : 16px;
            font-family      : 'Nunito', sans-serif;
        }

        .last_section {
            height           : 250px;
            text-align       : center;
            color            : white;
        }

        #last_section_content {
            margin-top       : 40px;
            font-size        : 30px;
            font-family      : 'PT Sans', sans-serif;
        }

        #last_section_link {
            background       : black;
            color            : white;
            height           : 60px;
            width            : 190px;
            margin-top       : 40px;
            border           : 5px solid white; 
            border-radius    : 30px;  
            font-size        : 25px;
        }

        #last_section_link:hover {
            background       : white;
            color            : black;
            height           : 70px;
            width            : 200px;
            margin-top       : 35px;
            border-radius    : 40px;
            cursor           : pointer;
            transition       : 0.3s;
        }


        @media screen and (max-width : 1035px) {
            #container {
                margin-left  : 5vw;
                width        : 100%;
            }

            .btn-container {
                margin-left  : 2vw;
            }

            #about_image_holder {
                display      : none;
            }

            #about_content {
                width        : 100%;
            }
        }
    </style>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Courgette&family=Nunito&family=PT+Sans&family=Play:wght@700&family=Roboto+Slab:wght@600&display=swap" rel="stylesheet">
 
</head>
<body>    
     <div class="outer-box" id="home">
        <div id="container">
            <div id="title">HireMe</div>
            <div id="con_text">
                A bridge between millions of job seekers and job providers.
                <br>
                Join us to connect to the world !
            </div>
    
            <div class="btn-container">
                 <button onclick="location.href='Login.jsp'" id="sign_in">Sign In</button>
                 <button onclick="location.href='Registration1.jsp'" id="sign_up">Sign Up</button>
            </div>
        </div>
    </div>

    <div style="background-color: white; height : 5px;"></div>

    <section id="about">
        <div class="about">
            <div id="about_content">
                <div id="about_content_title">About</div>
                We provide a platform for people with skills to connect to people those who need that skills.
                HireMe is a profite-less organization aimed to help job seekers to get a job they are fit for, also
                for job hirers to find people they require. HireMe works completely based on skills and no 
                educational background is required to find a job here. If you have the skills we find you the right
                place for you to set you career. Over the year we have helped millions of people to get the job they 
                desire.            
            </div>
            <div id="about_image_holder">
                <div id="about_image"></div>
            </div>
        </div>

        <div style="background-color: white; height : 5px;"></div>

        <div class="about">
            <div id="about_image_holder">
                <div id="about_image" style="float : right; background-image: url('images/number_of_users.jpg');"></div>
            </div>

            <div id="about_content">
                <div id="about_content_title" style="font-size : 45px;">Number of active job seekers</div>
                102221    
                <div id="about_content_title" style="font-size : 45px; margin-top : 30px;">Number of active job providers</div>
                9129  
            </div>
        </div>

        <div style="background-color: white; height : 5px;"></div>

        <div class="review_holder">
                <span id="review_box_holder">
                    <div id="review_box">
                        <div id="review_image" style="background-image: url('images/person1.jpg');"></div>
                        <div id="review_name">
                            Varunkumar R
                        </div>
                        <div id="review_content">
                            I find HireMe to be an incredibly user-friendly platform for job seeking. 
                            The interface is intuitive and easy to navigate. I can quickly search for 
                            job opportunities, filter by various criteria, and save interesting listings
                            for later. The platform also provides helpful recommendations based on my
                            profile and preferences, making the job search process efficient and 
                            effective.
                        </div>
                    </div>
                </span>

                <span id="review_box_holder">
                    <div id="review_box">
                        <div id="review_image" style="background-image: url('images/person2.jpg');"></div>
                        <div id="review_name">
                            Metta Surendhar         
                        </div>
                        <div id="review_content">
                            HireMe is a fantastic platform for connecting with 
                            people in various industries. The ability to engage in discussions has been invaluable for 
                            expanding my professional network. I have had the opportunity to connect
                            with like-minded individuals, attend industry events, and even secure
                            job opportunities through these connections.
                        </div>
                    </div>
                </span>

                <span id="review_box_holder">
                    <div id="review_box">
                        <div id="review_image" style="background-image: url('images/person3.jpg');"></div>
                        <div id="review_name">
                            Dinesh Kumar
                        </div>
                        <div id="review_content">
                            The job application process on HireMe is streamlined and convenient.
                            With just a few clicks. The platform also allows me to track the status of 
                            my applications and receive updates on whether my application has been viewed
                            or offered. This transparency and ease of use have made the application
                            process hassle-free.
                        </div>
                    </div>
                </span>
        </div>

        <div style="background-color: white; height : 5px;"></div>

        <div class="last_section">
            <div id="last_section_content">
                Join us to experience an easy job searching process and explore
                <br> professionals in you field of expertise
            </div>
            <button onclick="location.href='#home'" id="last_section_link">Get Started</button>
        </div>
    </section>

</body>
</html>