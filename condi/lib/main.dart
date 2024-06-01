import 'package:condi/models/exam.dart';
import 'package:condi/models/question.dart';
import 'package:condi/models/result.dart';
import 'package:condi/providers/image_cache_provider.dart';
import 'package:condi/screens/auth/auth_page.dart';
import 'package:condi/services/exam_service.dart';
import 'package:condi/services/result_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 159, 99, 255),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(ExamAdapter());
  Hive.registerAdapter(QuestionAdapter());
  Hive.registerAdapter(ResultAdapter());

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ExamService>(
          create: (_) => ExamService(),
        ),
        ChangeNotifierProvider(
          create: (_) => ImageCacheProvider(),
        ),
        ChangeNotifierProvider<ResultService>(
          // Add this provider
          create: (_) => ResultService(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  color: kColorScheme.onSecondaryContainer,
                  fontSize: 20,
                ),
              ),
        ),
        home: const AuthPage(),
      ),
    );
  }
}
