import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool _isLastPage = false;

  @override
  void initState() {
    super.initState();
  }

  // When "Start Now" is pressed, save the state and navigate to the home page
  _onStart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seenOnboarding', true);
    Navigator.pushReplacementNamed(context, '/LoginView');
  }

  // Function to skip to LoginView page
  _skipOnboarding() {
    Navigator.pushReplacementNamed(context, '/LoginView');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (int page) {
              setState(() {
                _isLastPage = (page == 5); // Last page condition
              });
            },
            children: [
              _buildPage(
                image: 'assets/images/exams.svg',
                title: 'Prepare for Exams',
                description: 'A comprehensive system to help you prepare for exams with ease.',
                titleColor: Colors.blue, 
                descriptionColor: Colors.grey,
              ),
              _buildPage(
                image: 'assets/images/Chat bot.svg',
                title: 'Smart Assistant',
                description: 'Use the smart bot to ask questions and get instant answers.',
                titleColor: Colors.green, 
                descriptionColor: Colors.black,
              ),
              _buildPage(
                image: 'assets/images/Mobile payments-cuate.svg',
                title: 'Mobile Payments',
                description: 'Pay for courses and tasks easily via mobile.',
                titleColor: Colors.orange, 
                descriptionColor: Colors.blueGrey,
              ),
              _buildPage(
                image: 'assets/images/online course.svg',
                title: 'Online Courses',
                description: 'Discover a wide range of courses that suit all your interests.',
                titleColor: Colors.purple, 
                descriptionColor: Colors.teal,
              ),
              _buildPage(
                image: 'assets/images/articlesi.svg',
                title: 'Articles for You',
                description: 'Explore educational articles that will help you grow your knowledge.',
                titleColor: Colors.red, 
                descriptionColor: Colors.brown,
              ),
              _buildPage(
                image: 'assets/images/contact teacher.svg',
                title: 'Contact Your Teacher',
                description: 'Get in touch with your teacher for any questions or assistance.',
                titleColor: Colors.pink, 
                descriptionColor: Colors.indigo,
                isLastPage: true,
              ),
            ],
          ),
          // Positioning the Skip button as a clickable button
          Positioned(
            top: 50,
            right: 7,
            child: GestureDetector(
              onTap: _skipOnboarding,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                color: Colors.transparent,
                child: ElevatedButton(
                  onPressed: _skipOnboarding,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 213, 211, 211), // Changed 'primary' to 'backgroundColor'
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Raised the page indicator only when it's not the last page
          if (!_isLastPage)
            Positioned(
              bottom: 70, // Raised the page indicator a bit
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 6, // Number of pages
                  effect: ExpandingDotsEffect(
                    activeDotColor: Color(0xff0A97B0), // Active dot color
                    dotColor: Colors.grey, // Inactive dot color
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 12,
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomSheet: _isLastPage
          ? GestureDetector(
              onTap: _onStart,
              child: Container(

                height: 70, // Increased height of the Start button
                color: Color(0xff0A97B0),
                child: Center(
                  child: Text(
                    'Start Now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22, // Increased font size for better visibility
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }
  Widget _buildPage({required String image, required String title, required String description, bool isLastPage = false, required Color titleColor, required Color descriptionColor}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image of the page
          if (image.endsWith('.svg'))
            SvgPicture.asset(image, height: 300)
          else if (image.endsWith('.json'))
            Lottie.asset(image, height: 300),
          SizedBox(height: 30),
          // Title
          Text(
            title,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: titleColor),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          // Description
          Text(
            description,
            style: TextStyle(fontSize: 16, color: descriptionColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
