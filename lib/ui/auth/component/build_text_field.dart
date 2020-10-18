import 'package:attendance_app/appConfig/app_config.dart';
import 'package:attendance_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildTextField extends StatefulWidget {
  final Function validator;
  final Function onsaved;
  final Function onEditingComplete;
  final String labelText;
  final String hintText;
  final IconData leadingIcon;
  BuildTextField({
    @required this.validator,
    this.onsaved,
    this.onEditingComplete,
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
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    AppConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppConfig.safeBlockHorizontal * 10),
      child: TextFormField(
        validator: widget.validator,
        onSaved: widget.onsaved,
        onEditingComplete: widget.onEditingComplete,
        cursorColor: Colors.white,
        cursorWidth: 3,
        obscureText:
            widget.labelText == 'Password' ? !_isPasswordVisible : false,
        style: Theme.of(context)
            .textTheme
            .headline3
            .copyWith(fontSize: AppConfig.safeBlockVertical * 2.5),
        textInputAction: widget.labelText == 'Password'
            ? TextInputAction.go
            : TextInputAction.next,
        keyboardType: widget.labelText == 'Email'
            ? TextInputType.emailAddress
            : TextInputType.visiblePassword,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(fontSize: AppConfig.safeBlockVertical * 2.5),
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.headline4.copyWith(
                fontSize: AppConfig.safeBlockVertical * 2.5,
              ),
          errorStyle: TextStyle(fontSize: AppConfig.safeBlockVertical * 2),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).accentColor),
              borderRadius: BorderRadius.circular(20.0)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).accentColor),
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: Icon(
            widget.leadingIcon,
            color: themeProvider.getleadingTextFieldColor,
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
                    color: themeProvider.getleadingTextFieldColor,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
