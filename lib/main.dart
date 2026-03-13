import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/app_constants.dart';
import 'providers/post_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const InstagramCloneApp());
}

class InstagramCloneApp extends StatelessWidget {
  const InstagramCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostProvider>(
          create: (_) => PostProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appTitle,
        theme: ThemeData(
          useMaterial3: false,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.instagramDarkSurface,
          colorScheme: const ColorScheme.dark(
            primary: AppColors.lightText,
            secondary: AppColors.instagramBlue,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
