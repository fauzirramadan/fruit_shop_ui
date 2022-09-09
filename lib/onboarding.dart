import 'package:flutter/material.dart';
import 'package:food_shop_ui/main.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isLoading = false;

  Future splashLoading() async {
    Future.delayed(const Duration(seconds: 3), () {
      isLoading = true;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
          (route) => false);
    });
  }

  @override
  void initState() {
    splashLoading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/fruit_splash.png"),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Find fresh and healthy fruit",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              !isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.grey,
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
