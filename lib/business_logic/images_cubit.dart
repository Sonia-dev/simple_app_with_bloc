import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:simple_app_with_bloc/data/models/image.dart';
import '../data/repository/images_repository.dart';
part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  final ImagesRepository imagesRepository;
   List<Imagee>? images;
  ImagesCubit(this.imagesRepository) : super(ImagesInitial());
  List<Imagee>? getAllImages() {
    imagesRepository.getAllImages().then((images) {
      emit(ImagesLoaded(images));
      this.images = images;
    });
    return images;
  }
}
