import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/ProfilePage/view_profile.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/instractour/model/Instructors_model.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:graduation_project/Contact%20Room/chats/chat_details.dart'; // ✅ استيراد صفحة الدردشة

class InstructorCard extends StatelessWidget {
  final Instructor instructor;
  const InstructorCard({super.key, required this.instructor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // ✅ عند الضغط على العنصر، انتقل إلى صفحة التفاصيل
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // الصورة بالأعلى
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                child: CachedNetworkImage(
                  imageUrl: instructor.instructorLogo,
                  height: 120,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(height: 130, color: Colors.grey),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 8),
            // اسم الدكتور
            Text(
              instructor.instructorName,
              style: GoogleFonts.cairo(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            // اللقب
            Text(
              instructor.instructorProfessor,
              style: GoogleFonts.cairo(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            // الأزرار مع الأيقونات والنصوص
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff0A97B0), Color(0xff067A92)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconButton(
                    icon: Iconsax.message,
                    label: "Chat",
                    onTap: () {
                      // ✅ عند الضغط على الشات، انتقل إلى صفحة المحادثة
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatDetails(
                            userName: instructor.instructorProfessor,
                            userIcon: instructor.instructorLogo,
                            currentUserId:
                                "user_id_here", // ✅ يجب استبداله بمعرف المستخدم الحالي
                            receiverId: instructor.instructorId
                                .toString(), // ✅ معرف الدكتور
                          ),
                        ),
                      );
                    },
                  ),
                  _buildIconButton(
                    icon: Icons.school,
                    label: "Courses",
                    onTap: () {
                      // ✅ يمكنك لاحقًا ربط هذا القسم بشاشة الدورات
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildIconButton(
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap, // ✅ ربط كل زر بالوظيفة الخاصة به
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 26),
          const SizedBox(height: 4),
          Text(label,
              style: GoogleFonts.cairo(fontSize: 12, color: Colors.white)),
        ],
      ),
    );
  }
}
