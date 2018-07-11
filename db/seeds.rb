Bookmark.delete_all
CourseReview.delete_all
Course.delete_all
User.delete_all


User.create!(
  [
    {
      email: "user1@test.com",
      password: "user1@test.com",
      name: "Robert",
      birth_date: "1992-10-13"
    },
    {
      email: "user2@test.com",
      password: "user2@test.com",
      name: "Bora",
      birth_date: "1997-12-12"
    },
    {
      email: "user3@test.com",
      password: "user3@test.com",
      name: "Jacob",
      birth_date: "1997-04-29"
    },
    {
      email: "user4@test.com",
      password: "user4@test.com",
      name: "Alex",
      birth_date: "1995-12-25"
    }
  ]
)

Course.create!(
  [
    {
      title: "titas-unimas",
      subtitle: "Islamic Civilization and Civilization Course (TITAS)",
      description: "Islamic civilization and history about that and what can happen",
      knowledge_level: 'beginner',
      categories: "other",
      price: "$0",
      image: "https://openlearning-cdn.s3.amazonaws.com/jirawadeekumyan-avatar-48-ts1515050476.jpg",
      organization: {}.to_json,
      duration: 0,
      duration_unit: 0,
      url: "https://www.openlearning.com/courses/titas-unimas",
      active: true,
      language: "English",
      instructor: {}.to_json
    },
    {
      title: "Arts and Design",
      subtitle: "watercolor painting focusing on nature",
      description: "water colour which will help you to get all information",
      knowledge_level: 'advanced',
      categories: "Other",
      price: "$0",
      image: "https://openlearning-cdn.s3.amazonaws.com/course__zhamdesign_courses_Watercolorpaintingskill__course-landing-image-1466089966.42.jpg",
      organization: {}.to_json,
      duration: 0,
      duration_unit: 0,
      url: "https://www.openlearning.com/zhamdesign/courses/Watercolorpaintingskill",
      active: true,
      language: "English",
      instructor: {}.to_json
    },
    {
      title: "Computers and Technology",
      subtitle: "UNSW in proud partnership with the CBA are releasing a sequence of public courses in cyber security, under the banner of the SecEDU  'Security Engineering Capability' program.",
      description: "For new era it is important to have great result and structure in the computer ones",
      knowledge_level: 'intermediate',
      categories: "Other",
      price: "$0",
      image: "https://openlearning-cdn.s3.amazonaws.com/richard.buckland-avatar-48-ts1348830373.jpg",
      organization: {}.to_json,
      duration: 0,
      duration_unit: 0,
      url: "https://www.openlearning.com/courses/sec",
      active: true,
      language: "English",
      instructor: {}.to_json
    },
    {
      title: "Business and Economics",
      subtitle: "principles and practice of marketing",
      description: "That what can help to understand whole structure for that",
      knowledge_level: 'beginner',
      categories: "other",
      price: "$0",
      image: "https://openlearning-cdn.s3.amazonaws.com/nurulfarihinmhdnasir-avatar-48-ts1490615140.jpg",
      organization: {}.to_json,
      duration: 0,
      duration_unit: 0,
      url: "https://www.openlearning.com/courses/principles-and-practice-of-marketing",
      active: true,
      language: "English",
      instructor: {}.to_json
    }
  ]
)

Bookmark.create!(
 [
  {
    user: User.first,
    course: Course.first
  },
  {
    user: User.second,
    course: Course.second
  },
  {
    user: User.third,
    course: Course.third
  },
  {
    user: User.fourth,
    course: Course.fourth
  }
   ]
)

CourseReview.create!(
 [
  {
    title: "titas-unimas_review",
    content: "Islamic Civilization and Civilization Course (TITAS) is a generic course that all students
              in the university need to take regardless of the background differences.
              In this context, the responsibility to deliver the contents of this course is very
              large and heavy even though the course is generic.",
    rating: 5,
    user: User.first,
    course: Course.first
  },
  {
    title: "I learned a lot!",
    content: "This was a great course and teachers were amazing!",
    rating: 5,
    user: User.second,
    course: Course.second
  },
  {
    title: "Computers and Technology_review",
    content: "I liked that imagine things with translator and have fun",
    rating: 5,
    user: User.third,
    course: Course.third
  },
  {
    title: "Business and Economics_review",
    content: "I like business and eonomics, it helped me to solve problems with business",
    rating: 5,
    user: User.fourth,
    course: Course.fourth
  }
   ]
)
