import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class LiveEventsList extends StatelessWidget {
  final List<Map<String, String>> liveEvents = [
    {
      "title": "Live Flutter Workshop",
      "image": "assets/images/Flutter.jpeg",
      "description": "Join our live session on Flutter development.",
      "date": "Feb 15, 2025",
      "time": "5:00 PM GMT"
    },
    {
      "title": "AI & Machine Learning Talk",
      "image": "assets/images/artificial intelligences.jpeg",
      "description": "Discussion on AI trends and future.",
      "date": "Feb 20, 2025",
      "time": "7:00 PM GMT"
    },
    {
      "title": "Web Development Workshop",
      "image": "assets/images/webjpeg.jpeg",
      "description": "Hands-on workshop on web development.",
      "date": "Feb 25, 2025",
      "time": "6:00 PM GMT"
    }
    

  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210, // تحديد ارتفاع القائمة
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: liveEvents.length,
        itemBuilder: (context, index) {
          final event = liveEvents[index];
          return FadeInUp(
            duration: Duration(milliseconds: 500 + (index * 200)),
            child: Container(
              width: 300,
              margin: EdgeInsets.only(right: 10),
              child: buildLiveEventCard(event),
            ),
          );
        },
      ),
    );
  }

  Widget buildLiveEventCard(Map<String, String> event) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(event["image"]!),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.8), Colors.transparent],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text("LIVE",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(event["title"]!,
                    style: GoogleFonts.cairo(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(height: 4),
                Text("${event["date"]} | ${event["time"]}",
                    style: TextStyle(color: Colors.white70, fontSize: 14)),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.play_arrow, color: Colors.white),
                      SizedBox(width: 5),
                      Text("Join Now", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
