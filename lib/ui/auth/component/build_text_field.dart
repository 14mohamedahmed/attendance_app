import 'package:attendance_app/appConfig/app_config.dart';
import 'package:flutter/material.dart';

class BuildTextField extends StatefulWidget {
  final Function validator;
  final String labelText;
  final String hintText;
  final IconData leadingIcon;
  BuildTextField({
    @required this.validator,
    @required this.labelText,
    @required this.hintText,
    @required this.leadingIcon,
  });

  @override
  _BuildTextFieldState createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    AppConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppConfig.blockSizeHorizontal * 10),
      child: TextFormField(
        validator: widget.validator,
        cursorColor: Colors.white,
        cursorWidth: 3,
        obscureText:
            widget.labelText == 'Password' ? !_isPasswordVisible : false,
        style: TextStyle(
            color: Colors.white, fontSize: AppConfig.blockSizeVertical * 2.5),
        textInputAction: widget.labelText == 'Password'
            ? TextInputAction.done
            : TextInputAction.next,
        keyboardType: widget.labelText == 'Email/UserName'
            ? TextInputType.emailAddress
            : TextInputType.visiblePassword,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(fontSize: AppConfig.blockSizeVertical * 2.5),
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: AppConfig.blockSizeVertical * 2),
          errorStyle: TextStyle(fontSize: AppConfig.blockSizeVertical * 2),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).accentColor),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).accentColor),
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: Icon(
            widget.leadingIcon,
            color: Colors.yellow,
          ),
          suffixIcon: widget.labelText == 'Password'
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  child: Icon(
                    _isPasswordVisible
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye,
                    color: Colors.yellow,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
