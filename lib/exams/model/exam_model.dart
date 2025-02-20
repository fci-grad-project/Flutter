class Exams {
  final int id;
  final String name;
  final String logo;
  final DateTime startTime;
  final DateTime endTime;
  final String examTime;
  final String doctor;
  final String status;
  final int points;
  final String examLink;
  final DateTime? submitTime;

  Exams({
    required this.id,
    required this.name,
    required this.logo,
    required this.startTime,
    required this.endTime,
    required this.examTime,
    required this.doctor,
    required this.status,
    required this.points,
    required this.examLink,
    this.submitTime,
  });

  factory Exams.fromJson(Map<String, dynamic> json) {
    return Exams(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      examTime: json['examTime'],
      doctor: json['doctor'],
      status: json['status'],
      points: json['points'],
      examLink: json['examLink'],
      submitTime: json['submitTime'] != null
          ? DateTime.parse(json['submitTime'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'examTime': examTime,
      'doctor': doctor,
      'status': status,
      'points': points,
      'examLink': examLink,
      'submitTime': submitTime?.toIso8601String(),
    };
  }
}

List<Exams> exams = [
  Exams(
    id: 1,
    name: "Decision Support Exam",
    logo:
        "https://static.vecteezy.com/system/resources/previews/032/517/175/large_2x/decision-support-analyst-line-icon-illustration-vector.jpg",
    startTime: DateTime.parse("2025-02-15 12:00:00"),
    endTime: DateTime.parse("2025-02-15 14:00:00"),
    examTime: "2 hours",
    doctor: "Dr. Amal Mahmoud",
    status: "upcoming",
    points: 25,
    examLink:
        "https://docs.google.com/forms/d/e/1FAIpQLScQa0K0hyw3QQrBDQrFdSIZdLJPAX0RN8ztzrfnB275FmHPNw/viewform?usp=header",
  ),
  Exams(
    id: 2,
    name: "Network Exam",
    logo:
        "https://static.vecteezy.com/system/resources/previews/000/429/625/original/vector-global-technology-or-social-network-emblem.jpg",
    startTime: DateTime.parse("2025-02-14 08:00:00"),
    endTime: DateTime.parse("2025-02-14 10:00:00"),
    examTime: "2 hours",
    doctor: "Dr. Mahmoud Elsharqawy",
    status: "past due",
    points: 25,
    examLink:
        "https://docs.google.com/forms/d/e/1FAIpQLScQa0K0hyw3QQrBDQrFdSIZdLJPAX0RN8ztzrfnB275FmHPNw/viewform?usp=header",
  ),
  Exams(
    id: 3,
    name: "File Structure Exam",
    logo:
        "https://th.bing.com/th/id/OIP.Z-RGMRH5nJfKcn1T84drVwHaHS?rs=1&pid=ImgDetMain",
    startTime: DateTime.parse("2025-02-15 07:00:00"),
    endTime: DateTime.parse("2025-02-15 09:00:00"),
    examTime: "2 hours",
    doctor: "Dr. Safa Mahmoud",
    status: "turned in",
    submitTime: DateTime.parse("2025-02-15 08:30:00"),
    points: 25,
    examLink:
        "https://docs.google.com/forms/d/e/1FAIpQLScQa0K0hyw3QQrBDQrFdSIZdLJPAX0RN8ztzrfnB275FmHPNw/viewform?usp=header",
  ),
  Exams(
    id: 4,
    name: "System Analysis Exam",
    logo:
        "https://th.bing.com/th/id/OIP.3KYVvyINaELChrJSQtNx0gHaII?rs=1&pid=ImgDetMain",
    startTime: DateTime.parse("2025-02-16 14:00:00"),
    endTime: DateTime.parse("2025-02-16 16:00:00"),
    examTime: "2 hours",
    doctor: "Dr. Sara Mongy",
    status: "upcoming",
    points: 25,
    examLink:
        "https://docs.google.com/forms/d/e/1FAIpQLScQa0K0hyw3QQrBDQrFdSIZdLJPAX0RN8ztzrfnB275FmHPNw/viewform?usp=header",
  ),
  Exams(
    id: 5,
    name: "Data Structure Exam",
    logo:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTc1aj2E-PEuOu3o-lDBcvKbxeILp6IS-BT8vzvi9TqqNidBRFKB6MyaHJ2twMWIdhy28&usqp=CAU",
    startTime: DateTime.parse("2025-02-17 09:00:00"),
    endTime: DateTime.parse("2025-02-17 11:00:00"),
    examTime: "2 hours",
    doctor: "Dr. Safa Mahmoud",
    status: "turned in",
    submitTime: DateTime.parse("2025-02-17 10:45:00"),
    points: 25,
    examLink:
        "https://docs.google.com/forms/d/e/1FAIpQLScQa0K0hyw3QQrBDQrFdSIZdLJPAX0RN8ztzrfnB275FmHPNw/viewform?usp=header",
  ),
  Exams(
    id: 6,
    name: "Operating System Exam",
    logo:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3uXwcCzf09NVx7J3ID57EAPZWglPdyBaBJA&s",
    startTime: DateTime.parse("2025-02-18 10:00:00"),
    endTime: DateTime.parse("2025-02-18 12:00:00"),
    examTime: "2 hours",
    doctor: "Dr. Amal Mahmoud",
    status: "upcoming",
    points: 25,
    examLink:
        "https://docs.google.com/forms/d/e/1FAIpQLScQa0K0hyw3QQrBDQrFdSIZdLJPAX0RN8ztzrfnB275FmHPNw/viewform?usp=header",
  ),
  Exams(
    id: 7,
    name: "Database Exam",
    logo: "https://cdn-icons-png.freepik.com/512/6862/6862322.png",
    startTime: DateTime.parse("2025-02-19 11:00:00"),
    endTime: DateTime.parse("2025-02-19 13:00:00"),
    examTime: "2 hours",
    doctor: "Dr. Mahmoud Elsharqawy",
    status: "turned in",
    submitTime: DateTime.parse("2025-02-19 12:15:00"),
    points: 25,
    examLink:
        "https://docs.google.com/forms/d/e/1FAIpQLScQa0K0hyw3QQrBDQrFdSIZdLJPAX0RN8ztzrfnB275FmHPNw/viewform?usp=header",
  ),
  Exams(
    id: 8,
    name: "Software Engineering Exam",
    logo:
        "https://e7.pngegg.com/pngimages/127/393/png-clipart-software-engineer-computer-software-software-development-web-developer-engineer-software-engineer-computer-software-thumbnail.png",
    startTime: DateTime.parse("2025-02-19 11:00:00"),
    endTime: DateTime.parse("2025-02-19 13:00:00"),
    examTime: "2 hours",
    doctor: "Dr. Mahmoud Elsharqawy",
    status: "turned in",
    submitTime: DateTime.parse("2025-02-19 12:15:00"),
    points: 25,
    examLink:
        "https://docs.google.com/forms/d/e/1FAIpQLScQa0K0hyw3QQrBDQrFdSIZdLJPAX0RN8ztzrfnB275FmHPNw/viewform?usp=header",
  ),
  
];
