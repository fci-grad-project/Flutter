// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class DashboardScreen extends StatelessWidget {
//   final bool isProfessor;

//   DashboardScreen({required this.isProfessor});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             _buildHeader(),
//             _buildStatisticsGrid(),
//             if (isProfessor) _buildProfessorControls(),
//             _buildImageSlider(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xff0A97B0), Color(0xff007A99)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(20),
//           bottomRight: Radius.circular(20),
//         ),
//       ),
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(50),
//             child: SizedBox(
//               width: 60,
//               height: 60,
//               child: CachedNetworkImage(
//                 imageUrl:
//                     "https://images.unsplash.com/photo-1497633762265-9d179a990aa6?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SizedBox(width: 16),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Welcome, Professor!",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "Manage your courses and students",
//                 style: TextStyle(color: Colors.white70, fontSize: 16),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStatisticsGrid() {
//     List<Map<String, dynamic>> stats = [
//       {
//         'icon': Iconsax.people,
//         'label': 'Students',
//         'number': 150,
//         'progress': 0.7
//       },
//       {'icon': Iconsax.book, 'label': 'Courses', 'number': 12, 'progress': 0.6},
//       {
//         'icon': Iconsax.document,
//         'label': 'Todos',
//         'number': 45,
//         'progress': 0.9
//       },
//       {'icon': Iconsax.clock, 'label': 'Hours', 'number': 200, 'progress': 0.8},
//     ];

//     return Padding(
//       padding: EdgeInsets.all(16),
//       child: GridView.builder(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         itemCount: stats.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//           childAspectRatio: 1.2,
//         ),
//         itemBuilder: (context, index) {
//           var stat = stats[index];
//           return Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.2),
//                   spreadRadius: 3,
//                   blurRadius: 5,
//                   offset: Offset(0, 4),
//                 ),
//               ],
//             ),
//             padding: EdgeInsets.all(16),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircularPercentIndicator(
//                   radius: 40,
//                   lineWidth: 8,
//                   percent: stat['number'] / 200,
//                   center:
//                       Icon(stat['icon'], size: 28, color: Color(0xff0A97B0)),
//                   progressColor: Color(0xff0A97B0),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   stat['label'],
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   stat['number'].toString(),
//                   style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildProfessorControls() {
//     return Padding(
//       padding: EdgeInsets.all(16),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           _buildControlButton(Iconsax.note_add, "New Post"),
//           _buildControlButton(Iconsax.book_1, "New Course"),
//           _buildControlButton(Iconsax.task_square, "New Quiz"),
//         ],
//       ),
//     );
//   }

//   Widget _buildControlButton(IconData icon, String label) {
//     return ElevatedButton.icon(
//       style: ElevatedButton.styleFrom(
//         padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         backgroundColor: Color(0xff0A97B0),
//       ),
//       onPressed: () {},
//       icon: Icon(icon, color: Colors.white),
//       label: Text(
//         label,
//         style: TextStyle(fontSize: 16, color: Colors.white),
//       ),
//     );
//   }

//   Widget _buildImageSlider() {
//     List<String> images = [
//       "https://unsplash.com/photos/shallow-focus-photography-of-books-lUaaKCUANVI",
//       "https://unsplash.com/photos/man-and-woman-sitting-on-chairs-zFSo6bnZJTw",
//       "https://unsplash.com/photos/people-sitting-on-chair-in-front-of-computer-YRMWVcdyhmI",
//       "https://images.unsplash.com/photo-1581726707445-75cbe4efc586?q=80&w=2076&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     ];

//     return Padding(
//       padding: EdgeInsets.all(16),
//       child: CarouselSlider(
//         options: CarouselOptions(
//           height: 180,
//           autoPlay: true,
//           aspectRatio: 16 / 9,
//           enlargeCenterPage: true,
//           enableInfiniteScroll: true,
//         ),
//         items: images.map((image) {
//           return ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: CachedNetworkImage(
//                 imageUrl: image, fit: BoxFit.cover, width: double.infinity),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
