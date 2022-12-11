import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_app_with_bloc/business_logic/images_cubit.dart';
import 'package:simple_app_with_bloc/data/repository/images_repository.dart';
import 'package:simple_app_with_bloc/data/web_services/images_web_services.dart';
import 'package:simple_app_with_bloc/presentation/screens/images_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/strings.dart';

class AppRouter {
  late ImagesRepository imagesRepository;
  late ImagesCubit imagesCubit;

  AppRouter() {
    imagesRepository = ImagesRepository(ImagesWebService());
    imagesCubit = ImagesCubit(imagesRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => BlocProvider(
            create: (BuildContext context)=>ImagesCubit(imagesRepository),

        child:  ImagesScreen(),

        ));
    }
  }
}
