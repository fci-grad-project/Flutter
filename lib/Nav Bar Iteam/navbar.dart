
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:graduation_project/Contact%20Room/chat_view.dart';
import 'package:graduation_project/ProfilePage/widgets/view_body_profile.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/home%20screen/view_home_screen.dart';
import 'package:graduation_project/view%20cours/screen/details_screen.dart';

class NavBarItem extends StatefulWidget {
  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    // Text(
    //   'Likes',
    //   style: optionStyle,
    // ),
    DetailsScreenCours(title: 'Flutter Course '),
    ChatView(),
    ViewProfileBody(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: AppColors.primaryColor,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: FontAwesomeIcons.home,
                  text: 'Home',
                                    textStyle: GoogleFonts.cairo(fontSize: 16, color: Colors.white),

                ),
                GButton(
                  icon: FontAwesomeIcons.heart,
                  text: 'Likes',
                                    textStyle: GoogleFonts.cairo(fontSize: 16, color: Colors.white),

                ),
                GButton(
                  icon: FontAwesomeIcons.headset,
                  text: 'Contact Room ',
                                    textStyle: GoogleFonts.cairo(fontSize: 16, color: Colors.white),

                ),
                GButton(
                  icon: FontAwesomeIcons.user,
                  text: 'Profile',
                  textStyle: GoogleFonts.cairo(fontSize: 16, color: Colors.white),
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}