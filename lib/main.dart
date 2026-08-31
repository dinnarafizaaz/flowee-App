import 'package:flutter/material.dart';
import 'package:flutter_application/theme/app_theme.dart';

void main() {
  runApp(FloweeApp());
}

class FloweeApp extends StatelessWidget {
  const FloweeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flowee App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: Placeholder(),
    );
  }
}