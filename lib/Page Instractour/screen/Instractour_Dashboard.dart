import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProfDashboard extends StatefulWidget {
  const ProfDashboard({super.key});

  @override
  _ProfDashboardState createState() => _ProfDashboardState();
}

class _ProfDashboardState extends State<ProfDashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Instructors Dashboard',
            style: GoogleFonts.cairo(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: AppColors.instractourColor,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white, // لون النص عند التحديد
          unselectedLabelColor: Colors.white, // لون النص عند عدم التحديد
          tabs: const [
            Tab(icon: Icon(Iconsax.book, color: Colors.white), text: 'Courses'),
            Tab(
                icon: Icon(Iconsax.clipboard_text, color: Colors.white),
                text: 'Exams'),
            Tab(
                icon: Icon(Iconsax.task_square, color: Colors.white),
                text: 'Homework'),
            Tab(
                icon: Icon(Iconsax.profile_2user, color: Colors.white),
                text: 'Students'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCoursesTab(),
          _buildExamsTab(),
          _buildHomeworkTab(),
          _buildStudentsTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.instractourColor,
        onPressed: () {},
        child: Icon(Iconsax.add, color: Colors.white),
      ),
    );
  }

  Widget _buildCoursesTab() {
    return AnimationLimiter(
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: _buildItemCard('Name of the course',
                    'Number of Lessons: 4 ', Iconsax.book),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildExamsTab() {
    return _buildShimmerLoading();
  }

  Widget _buildHomeworkTab() {
    return _buildShimmerLoading();
  }

  Widget _buildStudentsTab() {
    return Center(
      child: Text(' Number of Students: 50',
          style: GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildItemCard(String title, String subtitle, IconData icon) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: AppColors.instractourColor),
        title:
            Text(title, style: GoogleFonts.cairo(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: GoogleFonts.cairo()),
        trailing: const Icon(Iconsax.arrow_right_3, size: 18),
      ),
    );
  }

  Widget _buildShimmerLoading() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 80,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );
      },
    );
  }
}
