import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LiveTap extends StatelessWidget {
  LiveTap({super.key});

  // قائمة الاجتماعات مع بياناتها
  final List<Map<String, String>> meetings = [
    {
      'title': 'Google Meet Session',
      'description': 'Join our Google Meet session.',
      'image': 'assets/images/meet.png',
      'url': 'https://meet.google.com/', // رابط Google Meet
    },
    {
      'title': 'Zoom Meeting',
      'description': 'Join our Zoom meeting.',
      'image': 'assets/images/zoomMETTING.png',
      'url': 'https://zoom.us/', // رابط Zoom
    },
    {
      'title': 'Microsoft Teams Call',
      'description': 'Join our Microsoft Teams call.',
      'image': 'assets/images/business.png',
      'url': 'https://teams.microsoft.com/', // رابط Teams
    },
  ];

  // وظيفة لفتح الرابط
  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meetings.length,
      itemBuilder: (context, index) {
        final meeting = meetings[index];
        return Column(
          children: [
            ListTile(
              leading: Image.asset(
                meeting['image']!,
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
              title: Text(
                meeting['title']!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                meeting['description']!,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              trailing: IconButton(
                icon: FaIcon(FontAwesomeIcons.video, color: Colors.red),
                onPressed: () {
                  _launchUrl(meeting['url']!);
                },
              ),
            ),
            Divider(),
          ],
        );
      },
    );
  }
  }