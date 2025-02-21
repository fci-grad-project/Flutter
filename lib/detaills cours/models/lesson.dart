class Lesson {
  String name;
  String duration;
  bool isPlaying;
  bool isCompleted;
  String videoUrl;

  Lesson({
    required this.duration,
    required this.isCompleted,
    required this.isPlaying,
    required this.name,
    required this.videoUrl,
  });
}

List<Lesson> lessonList = [
  Lesson(
    duration: '11 min 20 sec',
    isCompleted: true,
    isPlaying: true,
    name: "Why Flutter Development",
    videoUrl: 'https://youtu.be/I9ceqw5Ny-4?si=Fb-1ctIWmtMV6CZM',
  ),
  Lesson(
    duration: '10 min 11 sec',
    isCompleted: false,
    isPlaying: false,
    name: "Setup Flutter on MacOS",
    videoUrl: 'https://youtu.be/kLpFZm_3Epk?si=hp4DdZxtkmWl618t',
  ),
  Lesson(
    duration: '7 min',
    isCompleted: false,
    isPlaying: false,
    name: "Setup Flutter on Windows",
    videoUrl: 'https://youtu.be/mMeQhLGD-og?si=x1-1rYR-GlejpXh-',
  ),
  Lesson(
    duration: '5 min',
    isCompleted: false,
    isPlaying: false,
    name: "Introduction to Flutter widgets.",
    videoUrl: 'https://youtu.be/CQlA2p--oEg?si=pKZqkQuMFhms0C4T',
  ),
  Lesson(
    duration: '5 min',
    isCompleted: false,
    isPlaying: false,
    name: "What are Stateless Widgets?",
    videoUrl: 'https://youtu.be/FU2Eeizo95o?si=uXwXQQ_gYQhy4oK3',
  ),
  Lesson(
    duration: '5 min',
    isCompleted: false,
    isPlaying: false,
    name: "What are Statefull Widgets?",
    videoUrl: 'https://youtu.be/1xipg02Wu8s?si=T7JSSY4wiZhIfEvQ',
  )
];
