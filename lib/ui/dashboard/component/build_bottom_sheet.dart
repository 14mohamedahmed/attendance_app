import 'package:attendance_app/appConfig/app_config.dart';
import 'package:attendance_app/provider/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class BuildBottomSheet extends StatelessWidget {
  final Function getImage;
  BuildBottomSheet({this.getImage});
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
    final dashboardProvider =
        Provider.of<DashboardProvider>(context, listen: false);
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
