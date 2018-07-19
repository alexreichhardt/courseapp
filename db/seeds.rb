
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)




# # p user["name"]["first"] + user["name"]["last"]
# # p user["email"]


# 20.times do
#   url = "https://randomuser.me/api/"
#   user_serialized = open(url).read
#   user = JSON.parse(user_serialized)
#   user = user["results"][0]
#   name = user["name"]["first"].capitalize + " " + user["name"]["last"].capitalize

#   User.create!(email: user["email"],
#                 password: user["login"]["password"],
#                 name: name,
#                 remote_avatar_url: user["picture"]["medium"])
# end


# courses = Course.all

# titles = ["Great course", "Amazing Learnings", "Great instructor", "Steep learning curve", "Great lectures!"]

# contents = [ "The course is perfectly planned for people with a little programming knowledge and even for absolute beginners. The exercises are challenging and at the end of the course you get more exercises to practice on your own.",
#             "Helpful Instructor, no question of his knowledge whatsoever. Probably that's were my problem is coming from. I generally miss more detailed explanation here and there",
#             "This course is amazing for beginners , you will find almost everything you need to start coding with Python , the most impressive thing in this course is the two mile stone projects ( Tic Tac Toe and Blackjack! ) you can apply almost everything you learned in the course by creating those projects , and they will give you self confidence if you are not familiar with coding",
#             "I had no previous exposure to any programming language. I could still get a good understanding of the language and am able to code just by following the videos and solving exercises. The barrier i had for learning python is broken and I can take my skill higher with more practice.",
#             "Excellent Course! Easy to understand, clear explanations, informative, very well organized. I always wanted such type of training. The Instructor is very prompt in replying to doubts. The course is very well designed, practical and valuable for anyone who wants to enhance their skills. Thank you.",
#             "This is an amazing course! Despite my background in humanities, I was able to follow Jose's instructions. He explains material very clearly and recaps major points at the end of every lecture to emphasize them. This strategy is the very structured and clear way",
#             "It is in high level. As for the beginners it is very difficult to understand.",
#             "The course is quite extensive. It really gives an overview of how Python works. By no doubts I can recommend it to everyone who plans to develop Python knowledge and skills, even to ones who are already familiar with basic Python concepts.",
# ]

# courses.each do |course|
#   t = rand(3..7)
#   t.times do
#     CourseReview.create!(title: (titles.sample), content: contents.sample, rating: rand(3..5), course_id: course.id, user_id: User.all.pluck(:id).sample)
#   end
# end

200.times do
  Bookmark.create!(user_id: User.all.pluck(:id).sample, course_id: Course.all.pluck(:id).sample)
end
# User.delete_all

# User.create!(
#   [
#     {
#       email: "user1@test.com",
#       password: "user1@test.com",
#       name: "Robert",
#       birthdate: "1992-10-13"
#     },
#     {
#       email: "user2@test.com",
#
#
#       password: "user2@test.com",
#       name: "Bora",
#       birthdate: "1997-12-12"
#     },
#     {
#       email: "user3@test.com",
#       password: "user3@test.com",
#       name: "Jacob",
#       birthdate: "1997-04-29"
#     },
#     {
#       email: "user4@test.com",
#       password: "user4@test.com",
#       name: "Alex",
#       birthdate: "1995-12-25"
#     }
#   ]
# )

# # Course.create!(
# #   [
# #     {
# #       title: "titas-unimas",
# #       subtitle: "Islamic Civilization and Civilization Course (TITAS)",
# #       description: "Islamic civilization and history about that and what can happen",
# #       knowledge_level: 'beginner',
# #       categories: "other",
# #       price: "$0",
# #       image: "https://openlearning-cdn.s3.amazonaws.com/jirawadeekumyan-avatar-48-ts1515050476.jpg",
# #       organization: {}.to_json,
# #       duration: 0,
# #       duration_unit: 0,
# #       url: "https://www.openlearning.com/courses/titas-unimas",
# #       active: true,
# #       language: "English",
# #       instructor: {}.to_json,
# #       platform: platforms.sample
# #     },
# #     {
# #       title: "Arts and Design",
# #       subtitle: "watercolor painting focusing on nature",
# #       description: "water colour which will help you to get all information",
# #       knowledge_level: 'advanced',
# #       categories: "Other",
# #       price: "$0",
# #       image: "https://openlearning-cdn.s3.amazonaws.com/course__zhamdesign_courses_Watercolorpaintingskill__course-landing-image-1466089966.42.jpg",
# #       organization: {}.to_json,
# #       duration: 0,
# #       duration_unit: 0,
# #       url: "https://www.openlearning.com/zhamdesign/courses/Watercolorpaintingskill",
# #       active: true,
# #       language: "English",
# #       instructor: {}.to_json,
# #       platform: platforms.sample
# #     },
# #     {
# #       title: "Computers and Technology",
# #       subtitle: "UNSW in proud partnership with the CBA are releasing a sequence of public courses in cyber security, under the banner of the SecEDU  'Security Engineering Capability' program.",
# #       description: "For new era it is important to have great result and structure in the computer ones",
# #       knowledge_level: 'intermediate',
# #       categories: "Other",
# #       price: "$0",
# #       image: "https://openlearning-cdn.s3.amazonaws.com/richard.buckland-avatar-48-ts1348830373.jpg",
# #       organization: {}.to_json,
# #       duration: 0,
# #       duration_unit: 0,
# #       url: "https://www.openlearning.com/courses/sec",
# #       active: true,
# #       language: "English",
# #       instructor: {}.to_json,
# #       platform: platforms.sample
# #     },
# #     {
# #       title: "Business and Economics",
# #       subtitle: "principles and practice of marketing",
# #       description: "That what can help to understand whole structure for that",
# #       knowledge_level: 'beginner',
# #       categories: "other",
# #       price: "$0",
# #       image: "https://openlearning-cdn.s3.amazonaws.com/nurulfarihinmhdnasir-avatar-48-ts1490615140.jpg",
# #       organization: {}.to_json,
# #       duration: 0,
# #       duration_unit: 0,
# #       url: "https://www.openlearning.com/courses/principles-and-practice-of-marketing",
# #       active: true,
# #       language: "English",
# #       instructor: {}.to_json,
# #       platform: platforms.sample
# #     }
# #   ]
# # )



# # # This file should contain all the record creation needed to seed the database with its default values.
# # # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# # #
# # # Examples:
# # #
# # #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# # #   Character.create(name: 'Luke', movie: movies.first)


# # Course.create(
# #   title: "Introduction to Graduate",
# #   subtitle: "Offered at Georgia Tech as CS 8803 GA",
# #   description: "This is a graduate-level course in the design and analysis of algorithms. We study techniques for the design of algorithms (such as dynamic programming) and algorithms for fundamental problems (such as fast Fourier transform or FFT).\n\nIn addition, we study computational intractability, specifically, the theory of NP-completeness. The main topics covered in the course include: dynamic programming; divide and conquer, including FFT; randomized algorithms, including RSA cryptosystem and hashing using Bloom filters; graph algorithms; max-flow algorithms; linear programming; and NP-completeness.",
# #   knowledge_level: 2,
# #   categories: { subjects: ["Algorithms"] },
# #   price: "$0",
# #   image: "https://lh3.googleusercontent.com/484RhPFkkCUySbTHHTNzgU8aksf-ilgy1VPaDy3dqgeGpR4J7zxovy51rP2sJq-0TqBHB3pCBp06CZvV3L4=s0#w=1724&h=1060",
# #   organization: {image: "https://lh4.ggpht.com/nGlPuZaZ6BbR23QfhSVNT_Sd_U45RnUECVGhx-cKIlo3D_Onofn-nWpV3sEYEQsczb7tC4JhggdGYyhAAQ4I=s0#w=130&h=60", name: "Georgia Institute of Technology"},
# #   duration: 3,
# #   duration_unit: "months",
# #   url: "https://www.udacity.com/course/introduction-to-graduate-algorithms--ud401?utm_medium=referral&utm_campaign=api",
# #   active: true,
# #   language: "English",
# #   instructor: {instructors: [ { bio: "Professor of Algorithms since `1997, Eric has greatly influenced the field of Mathematics in the Graduate level. In his leisure time, Eric likes to share his knowledge with people from around the world.",
# #                                 image: "https://lh3.googleusercontent.com/BZsKWjpj_zHlrSavutVahO6MLC38aD5wgh49FO09tbcZPhgJRdTE8ezkv2XOOHtly3gA0b9csa_bjCna_tI=s0#w=200&h=200",
# #                                 name: "Eric Vigoda" },
# #                                 { bio: "Alexei Reichhartinho began teaching and found his passion. He enjoys the best of both worlds as he works as a Course Developer at Udacity. After earning a degree in computer science, he made the smart decision and moved into the world of HTML, CSS, and JavaScript. For over seven years he worked for an international nonprofit doing everything from frontend web development, to backend programming, to database and server management. Before graduating from the University of Florida’s Web Design and Online Communications Master’s program with a degree in Mass Communication, he had already been asked by the University to come on board as a faculty member. Even with the planning, building and development of courses, he still tries to make time to take in the beauty of the California countryside.",
# #                                  image: "https://lh3.googleusercontent.com/5Hqpv5qe5wmdyP7wQdnUg6MIuK2mPKrBQReUa5nvqotkBqQnNAAFnf5At_b_P5cZPFUxFghOkvIc2ybRmPA=s0#w=500&h=500",
# #                                  name: "Alexei Reichhartinho" } ] }
# #      )

# # Course.create(
# #   title: "Object-Oriented JavaScript",
# #   subtitle: "Build Apps with Maintainable Code algorithms",
# #   description: "This course is designed to teach web developers how to utilize the various object-oriented programming features within JavaScript. Object-oriented programming allows developers to build applications with reusable and maintainable blocks of code, which leads to efficiency and simplified software design.\n\nWith object-oriented JavaScript, you'll be able to build classes to construct objects that encapsulate both data and functionality. You'll also learn how to leverage prototypal inheritance to maintain DRY code, allowing you to pass behaviors down to objects. You'll also learn how to keep data safe and secure by creating private state with closures and immediately-invoked function expressions.",
# #   knowledge_level: 1,
# #   categories: { subjects: ["Web Development", "JavaScript", "Front-End"] },
# #   price: "$199",
# #   image: "https://lh3.googleusercontent.com/kMKTelUJaVFqSC6ekGapZP_OwU4NKY9bFCI6azveFsIZQWHp8mJFryq5dTQG8jhwlI3PvVO2rB0Ywm2xmnHw=s0#w=854&h=480",
# #   organization: {image: "https://lh4.ggpht.com/nGlPuZaZ6BbR23QfhSVNT_Sd_U45RnUECVGhx-cKIlo3D_Onofn-nWpV3sEYEQsczb7tC4JhggdGYyhAAQ4I=s0#w=130&h=60", name: "Georgia Institute of Technology"},
# #   duration: 3,
# #   duration_unit: "weeks",
# #   url: "https://www.udacity.com/course/object-oriented-javascript--ud711?utm_medium=referral&utm_campaign=api",
# #   active: true,
# #   language: "English",
# #   instructor: { instructors: [ { bio: "As an avid programmer and learner, Richard Kalehoff began teaching and found his passion. He enjoys the best of both worlds as he works as a Course Developer at Udacity. After earning a degree in computer science, he made the smart decision and moved into the world of HTML, CSS, and JavaScript. For over seven years he worked for an international nonprofit doing everything from frontend web development, to backend programming, to database and server management. Before graduating from the University of Florida’s Web Design and Online Communications Master’s program with a degree in Mass Communication, he had already been asked by the University to come on board as a faculty member. Even with the planning, building and development of courses, he still tries to make time to take in the beauty of the California countryside.",
# #                                  image: "https://lh3.googleusercontent.com/5Hqpv5qe5wmdyP7wQdnUg6MIuK2mPKrBQReUa5nvqotkBqQnNAAFnf5At_b_P5cZPFUxFghOkvIc2ybRmPA=s0#w=500&h=500",
# #                                  name: "Richard Kalehoff" },
# #                                {  bio: "Passionate programmer, Jacobo Wolfo Martineso began instructing. He enjoys as a Course Developer at Udacity. With a degree in computer science, he made the awesome decision and moved into HTML, CSS, and JavaScript. For more than seven years he has been working for an international nonprofit doing everything from frontend web development, to backend programming, to database and server management. Before graduating from the University of Florida’s Web Design and Online Communications Master’s program with a degree in Mass Communication, he had already been asked by the University to come on board as a faculty member. Even with the planning, building and development of courses, he still tries to make time to take in the beauty of the California countryside.",
# #                                   image: "https://lh3.googleusercontent.com/5Hqpv5qe5wmdyP7wQdnUg6MIuK2mPKrBQReUa5nvqotkBqQnNAAFnf5At_b_P5cZPFUxFghOkvIc2ybRmPA=s0#w=500&h=500",
# #                                   name: "Jacobo Martineso" } ] }
# #       )

# # Course.create(
# #   title: "SQL for Data Analysis by Mode",
# #   subtitle: "Databases, SQL, and More!",
# #   description: "In this course, you’ll learn to use Structured Query Language (SQL) to extract and analyze data stored in databases. You’ll first learn to extract data, join tables together, and perform aggregations. Then you’ll learn to do more complex analysis and manipulations using subqueries, temp tables, and window functions. By the end of the course, you’ll be able to write efficient SQL queries to successfully handle a variety of data analysis tasks.",
# #   knowledge_level: 0,
# #   categories: { subjects: ["Data Science", "Database", "Back-End"] },
# #   price: "$20.99",
# #   image: "https://lh3.googleusercontent.com/Lgf6LpjqJufvY9COl505e0E3W74nCOFER1ZKmtb4XRUx7pAnV6P_ccs_F5akF-Hu3LPOqSLwptA9Vcxq4g=s0#w=1749&h=932",
# #   organization: { image: "", name: "Udacity" },
# #   duration: 4,
# #   duration_unit: "weeks",
# #   url: "https://www.udacity.com/course/sql-for-data-analysis-by-mode--ud198?utm_medium=referral&utm_campaign=api",
# #   active: true,
# #   language: "English",
# #   instructor: { instructors: [ { bio: "",
# #                                 image: "",
# #                                 name: "Derek Steer" } ] }
# #       )

# # Course.create(
# #   title: "Eigenvectors and Eigenvalues Algorithms",
# #   subtitle: "Concepts in Linear Algebra",
# #   description: "One of the most interesting topics to visualize in Linear Algebra are Eigenvectors and Eigenvalues. Here you will learn how to easily calculate them and how they are applicable and particularly interesting when it comes to machine learning implementations.",
# #   knowledge_level: 0,
# #   categories: {subjects: ["Mathematics"]},
# #   price: "$9.50",
# #   image: "",
# #   # organization: {},
# #   duration: 1,
# #   duration_unit: "weeks",
# #   url: "https://www.udacity.com/course/sql-for-data-analysis-by-mode--ud198?utm_medium=referral&utm_campaign=api",
# #   active: true,
# #   language: "English",
# #   instructor: { instructors: [ {  bio: "Literally the best teacher out there for Eigenvectors and Eigenvalues. Boris Daillard is adept in everyway concerning Math and its discontents.",
# #                                   image: "",
# #                                   name: "Boris Daillard" } ] }
# #       )

# # Course.create(
# #   title: "Pythagorean Theorem Eigenvalues",
# #   subtitle: "Early trigonometrics.",
# #   description: "One of the most interesting topics to visualize in Geometry is Pythagorea's Theorem. Here you will learn how to easily calculate the hypotenuse and how they are applicable and particularly interesting when it comes to geometric problems.",
# #   knowledge_level: 0,
# #   categories: {subjects: [""]},
# #   price: "$5.50",
# #   image: "",
# #   # organization: {},
# #   duration: 9,
# #   duration_unit: "hours",
# #   url: "https://www.mathsisfun.com/pythagoras.html",
# #   active: false,
# #   language: "Spanish",
# #   instructor: { instructors: [ {bio: "As a previous fifth-grade teacher, I see great value in teaching kids at a young age when they can grasp the material",
# #                                 image: "",
# #                                 name: "Robertino Mielkoniano" } ] }
# #       )






# # Course.create(
# #   title: "Python",
# #   subtitle: "Early trigonometrics.",
# #   description: "One of the most interesting topics to visualize in Geometry is Pythagorea's Theorem. Here you will learn how to easily calculate the hypotenuse and how they are applicable and particularly interesting when it comes to geometric problems.",
# #   knowledge_level: 0,
# #   categories: {subjects: [""]},
# #   price: "$5.50",
# #   image: "",
# #   # organization: {},
# #   duration: 9,
# #   duration_unit: "hours",
# #   url: "https://www.mathsisfun.com/pythagoras.html",
# #   active: false,
# #   language: "Spanish",
# #   instructor: { instructors: [ {bio: "As a previous fifth-grade teacher, I see great value in teaching kids at a young age when they can grasp the material",
# #                                 image: "",
# #                                 name: "Robertino Mielkoniano" } ] }
# #       )
# # Course.create(
# #   title: "Web",
# #   subtitle: "Early trigonometrics.",
# #   description: "One of the most interesting topics to visualize in Geometry is Pythagorea's Theorem. Here you will learn how to easily calculate the hypotenuse and how they are applicable and particularly interesting when it comes to geometric problems.",
# #   knowledge_level: 0,
# #   categories: {subjects: [""]},
# #   price: "$5.50",
# #   image: "",
# #   # organization: {},
# #   duration: 9,
# #   duration_unit: "hours",
# #   url: "https://www.mathsisfun.com/pythagoras.html",
# #   active: false,
# #   language: "Spanish",
# #   instructor: { instructors: [ {bio: "As a previous fifth-grade teacher, I see great value in teaching kids at a young age when they can grasp the material",
# #                                 image: "",
# #                                 name: "Robertino Mielkoniano" } ] }
# #       )

# # Course.create(
# #   title: "Development",
# #   subtitle: "Early trigonometrics.",
# #   description: "One of the most interesting topics to visualize in Geometry is Pythagorea's Theorem. Here you will learn how to easily calculate the hypotenuse and how they are applicable and particularly interesting when it comes to geometric problems.",
# #   knowledge_level: 0,
# #   categories: {subjects: [""]},
# #   price: "$5.50",
# #   image: "",
# #   # organization: {},
# #   duration: 9,
# #   duration_unit: "hours",
# #   url: "https://www.mathsisfun.com/pythagoras.html",
# #   active: false,
# #   language: "Spanish",
# #   instructor: { instructors: [ {bio: "As a previous fifth-grade teacher, I see great value in teaching kids at a young age when they can grasp the material",
# #                                 image: "",
# #                                 name: "Robertino Mielkoniano" } ] }
# #       )


# titles = ["Digital Marketing", "Front-End HTML", "Front-End CSS Basics", "How to JS", "Intro to Ruby", "Combining Ruby with Rails"]
# subtitles = ["Learn features and constructs for C++", "Starting Out in Python 3", "Front-End CSS Basics", "How to JS", "Intro to Ruby", "Combining Ruby with Rails"]

# # 100.times do

# #   Course.create(
# #   title: titles.sample,
# #   subtitle: "Early trigonometrics.",
# #   description: "One of the most interesting topics to visualize in Geometry is Pythagorea's Theorem. Here you will learn how to easily calculate the hypotenuse and how they are applicable and particularly interesting when it comes to geometric problems.",
# #   knowledge_level: 0,
# #   categories: {subjects: [""]},
# #   price: "$5.50",
# #   image: "",
# #   # organization: {},
# #   duration: 9,
# #   duration_unit: "hours",
# #   url: "https://www.mathsisfun.com/pythagoras.html",
# #   active: false,
# #   language: "Spanish",
# #   instructor: { instructors: [ {bio: "As a previous fifth-grade teacher, I see great value in teaching kids at a young age when they can grasp the material",
# #                                 image: "",
# #                                 name: "Robertino Mielkoniano" } ] }
# #       )



# Bookmark.create!(
#  [
#   {
#     user: User.first,
#     course: Course.first
#   },
#   {
#     user: User.second,
#     course: Course.second
#   },
#   {
#     user: User.third,
#     course: Course.third
#   },
#   {
#     user: User.fourth,
#     course: Course.fourth
#   }
#    ]
# )

# CourseReview.create!(
#  [
#   {
#     title: "titas-unimas_review",
#     content: "Islamic Civilization and Civilization Course (TITAS) is a generic course that all students
#               in the university need to take regardless of the background differences.
#               In this context, the responsibility to deliver the contents of this course is very
#               large and heavy even though the course is generic.",
#     rating: 5,
#     user: User.first,
#     course: Course.first
#   },
#   {
#     title: "I learned a lot!",
#     content: "This was a great course and teachers were amazing!",
#     rating: 5,
#     user: User.second,
#     course: Course.second
#   },
#   {
#     title: "Computers and Technology_review",
#     content: "I liked that imagine things with translator and have fun",
#     rating: 5,
#     user: User.third,
#     course: Course.third
#   },
#   {
#     title: "Business and Economics_review",
#     content: "I like business and eonomics, it helped me to solve problems with business",
#     rating: 5,
#     user: User.fourth,
#     course: Course.fourth
#   }
#    ]
# )
