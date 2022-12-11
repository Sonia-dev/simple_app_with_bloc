part of 'images_cubit.dart';

@immutable
abstract class ImagesState {}

class ImagesInitial extends ImagesState {}

class ImagesErrorCase extends ImagesState{

}


class ImagesLoaded extends ImagesState{

  final List<Imagee>images;

  ImagesLoaded(this.images);
}
