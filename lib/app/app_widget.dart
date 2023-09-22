import 'package:flutter/material.dart';
import 'package:list_people_provider/app/app_routes.dart';
import 'package:list_people_provider/app/data/repositories/people_repository.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PeopleRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lista de pessoas - provider',
        initialRoute: '/home',
        routes: AppRoutes.all,
      ),
    );
  }
}
