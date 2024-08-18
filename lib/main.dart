import 'package:event_planning2/firebase_options.dart';
import 'package:event_planning2/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:event_planning2/src/features/authentication/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:event_planning2/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:event_planning2/src/features/authentication/screens/welcome/welcome.dart';
import 'package:event_planning2/src/features/core/controllers/notification_controller.dart';
import 'package:event_planning2/src/features/core/screens/calendar/calendar_view.dart';
import 'package:event_planning2/src/features/core/screens/events/add_event.dart';
import 'package:event_planning2/src/features/core/screens/events/event_detail.dart';
import 'package:event_planning2/src/repository/authentication_repository/authentication_repository.dart';
import 'package:event_planning2/src/utils/app_bindings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((_) => Get.put(AuthenticationRepository()));

  // Initialize notifications
  NotificationManager.initNotifications();

  // Initialize Firebase Cloud Messaging
  setupFirebaseMessaging();

  // Initialize GoogleSignIn
  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId:
        "616095060047-3ved0ie18o09sf4m2ihmi7udrd195f2i.apps.googleusercontent.com",
  );

  // Initialize Authentication Repository
  // await Get.putAsync(() => AuthenticationRepository());

  // Initialize OnBoardingController
  Get.put(OnBoardingController());

  // Remove splash screen after initialization
  FlutterNativeSplash.remove();

  // Start the app
  runApp(const App());
}

void setupFirebaseMessaging() {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  messaging.getToken().then((token) {
    print("FCM Token: $token");
  });

  // Handle incoming messages
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("Received message: ${message.notification?.title}");
  });

  // Handle notification when the app is in the background
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("Notification clicked: ${message.notification?.title}");
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Event Planning App',
      initialRoute: '/',
      initialBinding: InitialBinding(), // Set the initial route to SplashScreen
      getPages: [
        GetPage(
            name: '/', page: () => const SplashScreen()), // SplashScreen route
        GetPage(
            name: '/OnBoardingScreen',
            page: () => const OnBoardingScreen()), // OnBoardingScreen route
        GetPage(name: '/WelcomeScreen', page: () => const WelcomeScreen()),
        //GetPage(name: '/login', page: () => LoginScreen()), // WelcomeScreen route
        // Other routes...
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
