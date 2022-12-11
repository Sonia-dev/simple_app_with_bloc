import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_app_with_bloc/data/models/image.dart';

class ImageItem extends StatelessWidget {
  final Imagee? image;

  const ImageItem({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        child: Container(
            color: Colors.grey,
            child: Image.network(
              image?.urls?.thumb ?? "",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            )),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Icon( CupertinoIcons.heart_fill, color:image?.likes == 0 ? Colors.grey:Colors.red,
                size: 12.0,),
              Text('${image?.likes}',style: TextStyle(
                color: Colors.white70,

                height: 1.3,
                fontSize: 16,
                fontWeight: FontWeight.bold,

              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }
}
