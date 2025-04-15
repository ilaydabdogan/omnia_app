import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/explore_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const OmniaApp());
}

class OmniaApp extends StatelessWidget {
  const OmniaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Omnia World AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: const ExploreScreen(),
    );
  }
}
