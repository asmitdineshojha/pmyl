import 'package:flutter/material.dart';
import 'package:pmyl/index.dart';
import 'package:pmyl/login/login_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      checkLoggedIn();
    });
  }

  void checkLoggedIn() async {
    final pref = await SharedPreferences.getInstance();
    final String? userid = pref.getString('userid');
    if (userid != null && userid.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreenWidget(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterUserWidget(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset("assets/images/ymml.jpeg",
                width: MediaQuery.of(context).size.width / 1.2,
              ),
              const CircularProgressIndicator(color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
