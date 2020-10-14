import 'package:attendance_app/appConfig/app_config.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BuildBottomSheet extends StatelessWidget {
  final dashboardProvider;
  final Function getImage;
  BuildBottomSheet({this.dashboardProvider, this.getImage});
  @override
  Widget build(BuildContext context) {
    AppConfig().init(context);
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildImageSourceTitle(context: context, title: 'Gallery'),
          buildImageSourceTitle(context: context, title: 'Camera'),
        ],
      ),
    );
  }

  Widget buildImageSourceTitle({
    context,
    @required String title,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if (title == 'Gallery')
          dashboardProvider.getImagePicker(ImageSource.gallery).then((value) {
            getImage(value);
          });
        else {
          dashboardProvider.getImagePicker(ImageSource.camera).then((value) {
            // pass picked image to pervious page.
            getImage(value);
          });
        }
      },
      child: Text(
        title,
        style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: AppConfig.blockSizeVertical * 3),
      ),
    );
  }
}
