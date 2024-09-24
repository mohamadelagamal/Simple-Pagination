import 'package:flutter/material.dart';
import 'package:pagination_project/ui/pagination_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pagination Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PaginationScreen(),
    );
  }
}
