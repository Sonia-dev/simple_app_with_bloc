import 'package:flutter/material.dart';
import 'package:simple_app_with_bloc/presentation/app_router.dart';
import 'package:simple_app_with_bloc/presentation/screens/images_screen.dart';

void main() {
  runApp( MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key,required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

     onGenerateRoute: appRouter.generateRoute
    );
  }
}

