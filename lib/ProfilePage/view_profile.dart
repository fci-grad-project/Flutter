import 'package:flutter/material.dart';
import 'package:graduation_project/ProfilePage/widgets/view_body_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:ViewProfileBody(),
    );
  }
}