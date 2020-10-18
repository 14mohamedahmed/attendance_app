import 'package:attendance_app/appConfig/app_config.dart';
import 'package:attendance_app/ui/auth/component/build_text_field.dart';
import 'package:attendance_app/ui/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static final String routeName = '/authScreen';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  var _userEmail = '';
  var _companyId = '';

  @override
  Widget build(BuildContext context) {
    AppConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: AppConfig.safeBlockVertical * 2),
            child: Form(
              key: _loginFormKey,
              child: Column(
                children: [
                  Container(
                    height: AppConfig.screenHeight * 0.38,
                    child: Center(
                      child: Image.asset('assets/images/auth_pic.png'),
                    ),
                  ),
                  SizedBox(height: AppConfig.screenHeight * 0.04),
                  BuildTextField(
                    onsaved: (value) {
                      setState(() {
                        _userEmail = value;
                      });
                    },
                    validator: (value) {
                      if (value.trim() == '' ||
                          !value.contains('@') ||
                          !value.contains('.') ||
                          value == '@') {
                        return value == '@'
                            ? 'Email not Valid'
                            : 'Email must contains @ and .';
                      }
                      return null;
                    },
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                    leadingIcon: Icons.person, //home_work_outlined
                  ),
                  SizedBox(
                    height: AppConfig.screenHeight * 0.02,
                  ),
                  BuildTextField(
                    onsaved: (value) {
                      setState(() {
                        _companyId = value;
                      });
                    },
                    validator: (value) {
                      if (value.trim() == '') return 'Enter Valid Company ID';
                      return null;
                    },
                    labelText: 'Company ID',
                    hintText: 'Enter Your Company ID',
                    leadingIcon: Icons.home_work_outlined,
                  ),
                  SizedBox(height: AppConfig.screenHeight * 0.02),
                  BuildTextField(
                    validator: (value) {
                      if (value.trim() == '' || value.length < 6)
                        return 'password must be at least 6 charcters';
                      return null;
                    },
                    onEditingComplete: onSubmit,
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                    leadingIcon: Icons.lock,
                  ),
                  SizedBox(height: AppConfig.screenHeight * 0.03),
                  GestureDetector(
                    onTap: onSubmit,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Theme.of(context).accentColor,
                      ),
                      width: AppConfig.screenWidth / 2,
                      child: Text('Login',
                          style: Theme.of(context).textTheme.button.copyWith(
                              fontSize: AppConfig.safeBlockVertical * 3)),
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

  void onSubmit() async {
    FocusScope.of(context).unfocus();
    if (_loginFormKey.currentState.validate()) {
      _loginFormKey.currentState.save();
      Navigator.of(context)
          .pushReplacementNamed(DashboardScreen.routeName, arguments: {
        'email': _userEmail,
        'compnayId': _companyId,
      });
    }
  }
}
