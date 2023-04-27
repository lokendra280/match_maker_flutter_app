import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:match_maker/module/welcomescreen/welcome.dart';

import '../../../core/presentation/resources/colors.dart';
import '../../../core/presentation/widget/app_logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: check for authenticity

    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        ),
      );
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            color: Colors.white,
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Builder(
                builder: (context) => const Center(child: AppLogo()),
              ),
            )),
      ),
    );
  }
}
