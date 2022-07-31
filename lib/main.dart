import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_monitoring/Models/Providers/healthProvider.dart';
import 'package:fitness_monitoring/Utils/Routes/routes.dart';
import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:fitness_monitoring/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// Platform  Firebase App Id
// android   1:331295253172:android:6342c9cbe7009abb152de1

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HealthProvider>(
          create: (ctx) => HealthProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        initialRoute: RouteManager.welcome,
        onGenerateRoute: RouteManager.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
