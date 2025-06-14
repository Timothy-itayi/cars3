import 'package:flutter/material.dart';
import 'screens/title_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turn the Corner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const TitleScreen(),
    );
  }
}
