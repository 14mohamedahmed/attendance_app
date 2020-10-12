import 'package:attendance_app/appConfig/app_config.dart';
import 'package:attendance_app/ui/auth/component/build_text_field.dart';
import 'package:attendance_app/ui/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  static final String routeName = '/authScreen';
  final _loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    AppConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: AppConfig.blockSizeVertical * 2),
            child: Form(
              key: _loginFormKey,
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.38,
                    child: Center(
                      child: Image.asset('assets/images/auth_pic.png'),
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),
                  BuildTextField(
                    validator: (value) {
                      if (value.trim() == '' || !value.contains('@'))
                        return 'Email must contains @';
                      return null;
                    },
                    labelText: 'Email/UserName',
                    hintText: 'Enter Your Email/UserName',
                    leadingIcon: Icons.person, //home_work_outlined
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  BuildTextField(
                    validator: (value) {
                      if (value.trim() == '') return 'Enter Valid Company ID';
                      return null;
                    },
                    labelText: 'Company ID',
                    hintText: 'Enter Your Company ID',
                    leadingIcon: Icons.home_work_outlined,
                  ),
                  SizedBox(height: size.height * 0.02),
                  BuildTextField(
                    validator: (value) {
                      if (value.trim() == '' || value.length < 6)
                        return 'password must be at least 6 charcters';
                      return null;
                    },
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                    leadingIcon: Icons.lock,
                  ),
                  SizedBox(height: size.height * 0.03),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      if (_loginFormKey.currentState.validate()) {
                        // Navigate to other page
                        _loginFormKey.currentState.save();
                        Navigator.of(context)
                            .pushReplacementNamed(DashboardScreen.routeName);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Theme.of(context).accentColor,
                      ),
                      width: size.width / 2,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: AppConfig.blockSizeVertical * 3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
