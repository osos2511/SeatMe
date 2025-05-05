import 'package:flutter/material.dart';
import 'package:seatme/core/routes_manager.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Quality Food",
      "description": "Beirut Gate,\nAn authentic Lebanese experience on Sharjah’s beach.",
      "background": "assets/bg-1.png",
      "logo": "assets/logo-1.png",
    },
    {
      "title": "Fast Delivery",
      "description": "Turkish Gate,\nAn authentic Turkish experience in a sophisticated oriental atmosphere.",
      "background": "assets/bg-2.jpg",
      "logo": "assets/logo-2.png",
    },
    {
      "title": "Reward Surprises",
      "description": "Thailand Gate,\nFlavors of Thailand and Japan in a unique Asian atmosphere.",
      "background": "assets/bg-3.png",
      "logo": "assets/logo-3.png",
    },
  ];

  void _nextPage() {
    if (currentPage < onboardingData.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      _goToHome();
    }
  }

  void _goToHome() {
    Navigator.pushReplacementNamed(context, RoutesManager.signInRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) => OnboardingPage(
              title: onboardingData[index]["title"]!,
              description: onboardingData[index]["description"]!,
              background: onboardingData[index]["background"]!,
              logo: onboardingData[index]["logo"]!,
              isLastPage: index == onboardingData.length - 1,
              currentIndex: index,
              currentPage: currentPage,
              onNext: _nextPage,
              onGetStarted: _goToHome, // تمرير الدالة نفسها هنا
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: _goToHome,
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String background;
  final String logo;
  final bool isLastPage;
  final int currentIndex;
  final int currentPage;
  final VoidCallback onNext;
  final VoidCallback onGetStarted;

  const OnboardingPage({
    required this.title,
    required this.description,
    required this.background,
    required this.logo,
    required this.isLastPage,
    required this.currentIndex,
    required this.currentPage,
    required this.onNext,
    required this.onGetStarted,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color(0xFFD4AF37);
    final Color inactiveDotColor = Colors.grey.withOpacity(0.6);
    final bool isActive = currentIndex == currentPage;

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          background,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(0.4),
        ),
        Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: isActive ? 150 : 100,
                height: isActive ? 150 : 100,
                child: Image.asset(logo),
              ),
              SizedBox(height: 30),
              Text(
                title,
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.9),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              // مؤشرات النقاط
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    height: 8,
                    width: currentPage == index ? 24 : 8,
                    decoration: BoxDecoration(
                      color: currentPage == index ? primaryColor : inactiveDotColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
              SizedBox(height: 30),
              // زر Next أو Get Started
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLastPage ? onGetStarted : onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                  ),
                  child: Text(
                    isLastPage ? "Get Started" : "Next",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
