import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('👋 مرحبًا، الطالب!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _buildStatsSection(),
            SizedBox(height: 20),
            Text('📚 كورساتك الحالية',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildCoursesSection(),
            SizedBox(height: 20),
            Text('📝 المهام القادمة',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildTasksSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatCard('📖 الكورسات', '5'),
        _buildStatCard('✅ المهام المكتملة', '8'),
        _buildStatCard('⏳ المهام المتبقية', '3'),
      ],
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text(title, style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoursesSection() {
    List<String> courses = ['Flutter', 'AI', 'Data Science', 'Networking'];
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 120,
              padding: EdgeInsets.all(10),
              child: Center(child: Text(courses[index], style: TextStyle(fontSize: 16))),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTasksSection() {
    List<String> tasks = ['تسليم مشروع Flutter', 'حل واجب AI', 'حضور محاضرة Data Science'];
    return Column(
      children: tasks.map((task) {
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Text(task),
            trailing: Icon(Icons.check_circle, color: Colors.green),
          ),
        );
      }).toList(),
    );
  }
}