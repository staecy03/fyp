
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mansau_sabah/models/guidebook.dart';
import 'package:mansau_sabah/pages/nav_pages/main_page.dart';
import 'package:mansau_sabah/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:mansau_sabah/intro_page.dart';
import 'pages/login&signUp/screen/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/config/.env");
  await Firebase.initializeApp();
  //await DbHelper.initDb();
  //await GetStorage.init();
// ugPaintSizeEnabled = true;
  runApp(MultiProvider(
    providers: [
      //theme provider
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => Guidebook()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MainPage();
          } else {
            return LoginPage();
          }
        },
      ),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/loginpage': (context) => const LoginPage(),
      },
    );
  }
}
