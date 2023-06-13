import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:match_maker/module/home_screen/home_screen.dart';
import 'package:match_maker/module/landing/presentation/landing_page.dart';
import 'package:match_maker/module/notification/presentation/notification_services.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'module/auth/presentation/profile_page.dart';
import 'module/auth/provider/auth_provider.dart';
import 'module/onboarding/Intropage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  // await FirebaseAppCheck.instance.activate(
  //   webRecaptchaSiteKey: 'recaptcha-v3-site-key',

  //   androidProvider: AndroidProvider.debug,
  // );
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(fcmToken);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: 'test_public_key_9c9c77a92546481a99084130f4e62a5e',
        enabledDebugging: true,
        builder: (context, navkey) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => AuthProvider()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: LandingPage(),
              navigatorKey: navkey,
              localizationsDelegates: const [KhaltiLocalizations.delegate],
              title: "Match Maker",
            ),
          );
        });
  }
}
