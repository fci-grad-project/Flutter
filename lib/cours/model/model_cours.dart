class ModelCourse {
    final int id;
    final String name;
    final String about;
    final String logo;
    final String professor;
    final String totalTime;
    final double ratings;
    final String price;
    final List<CourseContent> courseContent;
    final String department;
    final List<Lecture> lectures;
    final List<Record> records;

    ModelCourse({
      required this.id,
      required this.name,
      required this.about,
      required this.logo,
      required this.professor,
      required this.totalTime,
      required this.ratings,
      required this.price,
      required this.courseContent,
      this.department = '',
      this.lectures = const [],
      this.records = const [],
    });
}

class CourseContent {
    final String title;
    final String duration;
    final String video;

    CourseContent({
      required this.title,
      required this.duration,
      required this.video,
    });
}

class Lecture {
    final String lectureTitle;
    final String lectureDuration;
    final String lectureLink;

    Lecture({
      required this.lectureTitle,
      required this.lectureDuration,
      required this.lectureLink,
    });
}

class Record {
    final String professor;
    final String video;
    final String recordsDuration;

    Record({
      required this.professor,
      required this.video,
      required this.recordsDuration,
    });
}

List<ModelCourse> courses = [
    ModelCourse(
      id: 1,
      name: "File Structure",
      about: "This course introduces the concept of file structures, focusing on efficient ways to organize and manage files in computer systems.",
      logo: "https://th.bing.com/th/id/OIP.-LK0VCO9O_G4W-AtBvG5ywHaEK?rs=1&pid=ImgDetMain",
      professor: "Dr. Safa Mahmoud",
      totalTime: "95 min",
      ratings: 0,
      price: "Free",
      courseContent: [],
      department: "IS",
      lectures: [
        Lecture(lectureTitle: "Introduction to File Structures", lectureDuration: "45 min", lectureLink: "lec_1.pptx"),
        Lecture(lectureTitle: "Types of File Systems", lectureDuration: "50 min", lectureLink: "lec_2.pptx"),
      ],
      records: [
        Record(professor: "Dr. Safa Mahmoud", video: "", recordsDuration: "60 min"),
        Record(professor: "Dr. Safa Mahmoud", video: "", recordsDuration: "70 min"),
      ],
    ),
    ModelCourse(
      id: 2,
      name: "System Analysis",
      about: "Learn how to analyze and design information systems, with a focus on methods, techniques, and the tools used in system development.",
      logo: "https://media.geeksforgeeks.org/wp-content/uploads/20240110113614/system_analysis_150-300.jpg",
      professor: "Dr. Sara Mongy",
      totalTime: "95 min",
      ratings: 0,
      price: "Free",
      courseContent: [],
      department: "CS",
      lectures: [
        Lecture(lectureTitle: "System Analysis Basics", lectureDuration: "40 min", lectureLink: "lec_1.pptx"),
        Lecture(lectureTitle: "Designing Systems", lectureDuration: "55 min", lectureLink: "lec_2.pptx"),
      ],
      records: [
        Record(professor: "Dr. Sara Mongy", video: "", recordsDuration: "60 min"),
        Record(professor: "Dr. Sara Mongy", video: "", recordsDuration: "70 min"),
      ],
    ),
    ModelCourse(
      id: 3,
      name: "JavaScript for Beginners",
      about: "This course introduces JavaScript from the ground up, helping beginners understand its core concepts and applications.",
      logo: "https://www.tutorialbar.com/wp-content/uploads/2635498_6a46_2-2048x1152.jpg",
      professor: "DR Mahmoud Bakry",
      totalTime: "12 hours",
      ratings: 4.8,
      price: "\$39.99",
      courseContent: [
        CourseContent(
            title: "Introduction to JavaScript",
            duration: "20 min",
            video: "https://www.youtube.com/embed/1aM1KYvl4Dw"),
        CourseContent(
            title: "Variables and Data Types",
            duration: "25 min",
            video: "https://www.youtube.com/embed/u5lmGv93pGA"),
        CourseContent(
            title: "Functions and Scope",
            duration: "30 min",
            video: "https://www.youtube.com/embed/UX0j0gITJwA"),
      ],
    ),
    ModelCourse(
      id: 4,
      name: "Python Data Science",
      about: "Learn Python for data analysis and visualization, covering Pandas, NumPy, and essential libraries.",
      logo: "https://th.bing.com/th/id/OIP.pklnMNMW28ousLaSFwEAXQHaEI?rs=1&pid=ImgDetMain",
      professor: "DR May Abdrabo",
      totalTime: "15 hours",
      ratings: 4.7,
      price: "\$49.99",
      courseContent: [
        CourseContent(
            title: "Introduction to Python",
            duration: "25 min",
            video: "https://www.youtube.com/embed/5zuF4Ys1eAw"),
        CourseContent(
            title: "Pandas and NumPy Basics",
            duration: "30 min",
            video: "https://www.youtube.com/embed/jPDtod7M_Bc"),
        CourseContent(
            title: "Data Visualization",
            duration: "35 min",
            video: "https://www.youtube.com/embed/ad79nYk2keg"),
      ],
    ),
    ModelCourse(
      id: 5,
      name: "Web Development Bootcamp",
      about: "A comprehensive course on HTML, CSS, and JavaScript to build modern, responsive websites.",
      logo: "https://th.bing.com/th/id/R.57e269d772efb557362226367e9e2a63?rik=hrokvJu%2fCgX9BQ&pid=ImgRaw&r=0",
      professor: "Dr Amal",
      totalTime: "20 hours",
      ratings: 4.9,
      price: "\$59.99",
      courseContent: [
        CourseContent(
            title: "HTML & CSS Basics",
            duration: "30 min",
            video: "https://www.youtube.com/embed/IHZwWFHWa-w"),
        CourseContent(
            title: "JavaScript Essentials",
            duration: "35 min",
            video: "https://www.youtube.com/embed/zlm1aajH6gY"),
        CourseContent(
            title: "Building Responsive Websites",
            duration: "40 min",
            video: "https://www.youtube.com/embed/5zuF4Ys1eAw"),
      ],
    ),
    ModelCourse(
      id: 6,
      name: "Machine Learning Basics",
      about: "An introduction to fundamental machine learning concepts and techniques, including supervised and unsupervised learning.",
      logo: "https://www.interviewbit.com/blog/wp-content/uploads/2022/03/Machine-Learning-Courses-2048x1000.png",
      professor: "DR Sarah",
      totalTime: "18 hours",
      ratings: 4.6,
      price: "\$54.99",
      courseContent: [
        CourseContent(
            title: "Introduction to Machine Learning",
            duration: "25 min",
            video: "https://www.youtube.com/embed/u5lmGv93pGA"),
        CourseContent(
            title: "Supervised vs Unsupervised Learning",
            duration: "30 min",
            video: "https://www.youtube.com/embed/zlm1aajH6gY"),
        CourseContent(
            title: "Model Evaluation",
            duration: "35 min",
            video: "https://www.youtube.com/embed/ad79nYk2keg"),
      ],
    )
];
