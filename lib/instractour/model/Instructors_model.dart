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

List<Instructor> instructors = [
  Instructor(
    instructorId: 1,
    instructorNumber: "01151403671",
    instructorName: "File Structure",
    instructorLogo: "https://cdn4.iconfinder.com/data/icons/professions-1-2/151/10-1024.png",
    instructorProfessor: "Dr. Safa Mahmoud",
    instructorDepartment: "IS",
    instructorChatId: "chat_is101",
  ),
  Instructor(
    instructorId: 2,
    instructorNumber: "01151403671",
    instructorName: "System Analysis",
    instructorLogo: "https://cdn-icons-png.flaticon.com/512/6833/6833590.png",
    instructorProfessor: "Dr. Sara Mongy",
    instructorDepartment: "CS",
    instructorChatId: "chat_cs202",
  ),
  Instructor(
    instructorId: 3,
    instructorNumber: "01151403671",
    instructorName: "Web Development",
    instructorLogo: "https://cdn-icons-png.flaticon.com/512/4042/4042422.png",
    instructorProfessor: "Dr Amal",
    instructorDepartment: "CS",
    instructorChatId: "chat_cs305",
  ),
  Instructor(
    instructorId: 4,
    instructorNumber: "01151403671",
    instructorName: "Security",
    instructorLogo: "https://cdn4.iconfinder.com/data/icons/professions-1-2/151/10-1024.png",
    instructorProfessor: "Dr. Mahmoud Elsharqawy",
    instructorDepartment: "General",
    instructorChatId: "chat_gen101",
  ),
  Instructor(
    instructorId: 5,
    instructorNumber: "01151403671",
    instructorName: "File Processing",
    instructorLogo: "https://cdn-icons-png.flaticon.com/512/4042/4042529.png",
    instructorProfessor: "Dr. Samah Zakaria",
    instructorDepartment: "SE",
    instructorChatId: "chat_se204",
  ),
  Instructor(
    instructorId: 6,
    instructorNumber: "01151403671",
    instructorName: "Database",
    instructorLogo: "https://cdn-icons-png.flaticon.com/512/4042/4042522.png",
    instructorProfessor: "Dr. Sara Mongy",
    instructorDepartment: "BIO",
    instructorChatId: "chat_bio301",
  ),
];
