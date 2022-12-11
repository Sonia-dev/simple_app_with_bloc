

import 'package:simple_app_with_bloc/data/models/image.dart';
import 'package:simple_app_with_bloc/data/web_services/images_web_services.dart';

class ImagesRepository{
  final ImagesWebService imagesWebServices;

  ImagesRepository(this.imagesWebServices);

  Future<List<Imagee>> getAllImages() async{
    final images = await imagesWebServices.getAllImages();

    return images.map((image) => Imagee.fromJson(image)).toList();

  }
}