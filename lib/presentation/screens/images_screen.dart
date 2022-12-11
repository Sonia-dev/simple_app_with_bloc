import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_app_with_bloc/business_logic/images_cubit.dart';
import 'package:simple_app_with_bloc/data/models/image.dart';
import 'package:simple_app_with_bloc/presentation/screens/image_item.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({Key? key}) : super(key: key);

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  List<Imagee>? allImages;
  @override
  void initState() {
    super.initState();
    allImages = BlocProvider.of<ImagesCubit>(context).getAllImages();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<ImagesCubit, ImagesState>(builder: (ctx, state) {
      if (state is ImagesLoaded) {
        allImages = (state).images;
        return buildLoadedListWidget();
      } else {
        return buildLoadingListWidget();
      }
    });
  }

  Widget buildLoadingListWidget() {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.green,
      ),
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.amber,
        child: Column(
          children: [
            buildImagesList(),
          ],
        ),
      ),
    );
  }

  Widget buildImagesList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      itemCount: allImages?.length,
      itemBuilder: (ctx, index) {
        return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.network(
                  allImages![index].urls?.thumb ?? "",
                  fit: BoxFit.cover,
                )));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          'Images',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: buildBlocWidget(),
    );
  }
}
