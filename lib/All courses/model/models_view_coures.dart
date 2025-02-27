class Instructor {
  final int instructorId;
  final String instructorNumber;
  final String instructorName;
  final String instructorLogo;
  final String instructorProfessor;
  final String instructorDepartment;
  final String instructorChatId;

  Instructor({
    required this.instructorId,
    required this.instructorNumber,
    required this.instructorName,
    required this.instructorLogo,
    required this.instructorProfessor,
    required this.instructorDepartment,
    required this.instructorChatId,
  });
}

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

// بيانات المدرسين
List<Instructor> instructors = [
  Instructor(
    instructorId: 1,
    instructorNumber: "01151403671",
    instructorName: "File Structure",
    instructorLogo: "https://cdn4.iconfinder.com/data/icons/professions-1-2/151/10-1024.png",
    instructorProfessor: "Safa Mahmoud",
    instructorDepartment: "IS",
    instructorChatId: "chat_is101",
  ),
  // ... (بقية المدرسين)
];

// بيانات الكورسات
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
  // ... (بقية الكورسات)
];