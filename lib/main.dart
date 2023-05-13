import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:match_maker/module/welcomescreen/welcome.dart';
import 'package:provider/provider.dart';
import 'module/auth/presentation/profile_page.dart';
import 'module/auth/provider/auth_provider.dart';
import 'module/home_screen/home_screen.dart';
import 'module/onboarding/Intropage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child:  const MaterialApp(
        
        debugShowCheckedModeBanner: false,
        home: OnboardingScreen(),
        title: "MatchMaker",
      ),
    );
  }
}
