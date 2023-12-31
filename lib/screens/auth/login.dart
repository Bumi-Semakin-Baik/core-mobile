import 'package:new_bumi_baik/common/common_widget.dart';
import 'package:new_bumi_baik/screens/auth/register.dart';
import 'package:new_bumi_baik/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/common_dialog_widget.dart';
import '../../common/common_method.dart';
import '../../models/auth_response_model.dart';
import '../../models/user_model.dart';
import '../../resources/color_manager.dart';
import '../../resources/token.dart';
import '../../services/auth_service.dart';
import '../menu/dashboard.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isObscure = true;

  final _formKey = GlobalKey<FormState>();

  final _emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Harap masukan email'),
    EmailValidator(errorText: "Harap masukan email yang valid")
  ]);

  final _passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Harap masukan password'),
  ]);

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * -0.35,
              left: MediaQuery.of(context).size.width * -0.3,
              child: Container(
                width: MediaQuery.of(context).size.width * 1.1,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.17),
                    Center(
                      child: Image(
                        image: const AssetImage('assets/images/logo_nama.png'),
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Selamat Datang',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                          fontSize: 23,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: emailController,
                        validator: _emailValidator,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: ColorManager.primary,
                          ),
                          border: const OutlineInputBorder(),
                          hintText: 'Email',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorManager.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                        controller: passwordController,
                        validator: _passwordValidator,
                        keyboardType: TextInputType.text,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: ColorManager.primary,
                          ),
                          border: const OutlineInputBorder(),
                          hintText: 'Password',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorManager.primary,
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: _isObscure
                                  ? Colors.grey
                                  : ColorManager.primary,
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  _isObscure = !_isObscure;
                                },
                              );
                            },
                            splashRadius: 1.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      height: 50,
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.primary, // background
                          foregroundColor: Colors.white, // foreground
                        ),
                        child: isLoading
                            ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Text('MASUK'),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });

                            loginUser();
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          const Text('Belum punya akun?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Register(),
                                  ));
                            },
                            child: Text(
                              "Daftar",
                              style: TextStyle(color: ColorManager.primary),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  loginUser() async {
    Map<String, dynamic> data = {
      'user': emailController.text.trim(),
      'password': passwordController.text.trim(),
    };

    try {
      AuthResponseModel? res = await AuthService().login(data);

      try {
        setState(() {
          globalAccessToken = res.accessToken!;
        });

        UserModel user = await UserService().getUserDetails();

        CommonMethod().saveUserLoginsDetails(
          user.id!,
          user.name!,
          user.email!,
          passwordController.text.trim(),
          res.accessToken!,
          true,
          user.gender!,
        );

        setState(() {
          isLoading = false;
        });

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(
                userModel: user,
              ),
            ));
      } catch (e) {
        CommonDialogWidget.buildOkDialog(context, false, e.toString());

        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      CommonDialogWidget.buildOkDialog(context, false, e.toString());

      setState(() {
        isLoading = false;
      });
    }
  }
}
