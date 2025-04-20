import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Ai%20Tech/screen/chat_screen_AI.dart';
import 'package:graduation_project/Ai%20Tech/widgets/Suggetion_Box.dart';
import 'package:graduation_project/core/utils/app_colors.dart';

class HomeScreenAiTech extends StatefulWidget {
  static const String routeName = 'NavBar';
  const HomeScreenAiTech({super.key});

  @override
  State<HomeScreenAiTech> createState() => _HomeScreenAiTechState();
}

class _HomeScreenAiTechState extends State<HomeScreenAiTech> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black,
            AppColors.primaryColor,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(

          backgroundColor: Colors.transparent,
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ask",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Text(
                "Master",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),

                Center(
                  child: BounceInDown(
                    duration: const Duration(milliseconds: 1200),
                    child: Image.asset(
                      'assets/images/robotlearn.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                FadeIn(
                  duration: const Duration(milliseconds: 1200),
                  child: AnimatedTextKit(
                    displayFullTextOnTap: true,
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      TyperAnimatedText(
                        "Hello, What can I do for you?",
                        speed: const Duration(milliseconds: 60),
                        textStyle: const TextStyle(
                          fontFamily: "Cera Pro",
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                FadeInUp(
                  duration: const Duration(milliseconds: 1200),
                  delay: const Duration(milliseconds: 300),
                  child: const Text(
                    "Here are some features",
                    style: TextStyle(
                      fontFamily: "Cera Pro",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 4.0,
                          color: Colors.black45,
                          offset: Offset(1.5, 1.5),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                FadeInLeft(
                  duration: const Duration(milliseconds: 1200),
                  delay: const Duration(milliseconds: 500),
                  child: const SuggetionBox(
                    header: "Ask For Information",
                    body: "Feel free to ask whatever goes in your mind",
                    color: Colors.deepOrange,
                    icon: Icons.question_answer,
                  ),
                ),
                const SizedBox(height: 12),

                FadeInRight(
                  duration: const Duration(milliseconds: 1200),
                  delay: const Duration(milliseconds: 700),
                  child: const SuggetionBox(
                    header: "Powerful AI",
                    body:
                        "Giving facts and up-to-date information with a trained AI bot",
                    color: Colors.deepPurple,
                    icon: Icons.flash_on,
                  ),
                ),
                const SizedBox(height: 12),

                FadeInUp(
                  duration: const Duration(milliseconds: 1200),
                  delay: const Duration(milliseconds: 900),
                  child: const SuggetionBox(
                    header: "Fast and Accurate",
                    body:
                        "Our model is trained to be as fast and accurate as possible",
                    color: Colors.green,
                    icon: Icons.speed,
                  ),
                ),
              ],
            ),
          ),
        ),

        floatingActionButton: Pulse(
          
          infinite: true,
          duration: const Duration(seconds: 5),
          child: FloatingActionButton(
             
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  ChatScreenAI()),
              );
            },
            
            elevation: 10,
            backgroundColor: Colors.white,
            tooltip: "Start chatting with AskMaster",
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/robotlearn.png",
                  width: 40,
                ),
                const Text(
                  "Chat",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
