import 'package:bumibaik_app/common/common_dialog_widget.dart';
import 'package:bumibaik_app/common/common_method.dart';
import 'package:bumibaik_app/models/auth_response_model.dart';
import 'package:bumibaik_app/models/register_validation_model.dart';
import 'package:bumibaik_app/resources/token.dart';
import 'package:bumibaik_app/screens/auth/login.dart';
import 'package:bumibaik_app/screens/calculate_carbon/calculate_1.dart';
import 'package:bumibaik_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../models/user_model.dart';
import '../../resources/color_manager.dart';
import '../menu/dashboard.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _DaftarState();
}

class _DaftarState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _isObscure = true;

  final _formKey = GlobalKey<FormState>();

  final _nameValidator = MultiValidator([
    RequiredValidator(errorText: 'Harap masukan nama'),
    MinLengthValidator(3, errorText: "Panjang nama minimal 3 karakter"),
  ]);

  final _phoneValidator = MultiValidator([
    RequiredValidator(errorText: 'Harap masukan nomor telepon'),
    MinLengthValidator(10,
        errorText: "Panjang nomor telepon minimal 10 karakter"),
    MaxLengthValidator(15,
        errorText: "Panjang nomor telepon maksimal 15 karakter"),
  ]);

  final _passwordValidator = MultiValidator([
    RequiredValidator(errorText: "Harap masukan password"),
    MinLengthValidator(8, errorText: "Panjang password minimal 8 karakter"),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: "Password harus menyertakan karakter special"),
  ]);

  final _emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Harap masukan email'),
    EmailValidator(errorText: "Harap masukan email yang valid")
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
                child: Stack(
                  children: [
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.1,
                      left: MediaQuery.of(context).size.width * 0.6,
                      child: Image(
                        image: const AssetImage('assets/images/logo_icon.png'),
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.17),
                        SizedBox(height: height * 0.025),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Text(
                            'Buat Akun Baru',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: nameController,
                            validator: _nameValidator,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: ColorManager.primary,
                              ),
                              border: const OutlineInputBorder(),
                              hintText: 'Nama',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorManager.primary,
                                ),
                              ),
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
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: phoneController,
                            validator: _phoneValidator,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: ColorManager.primary,
                              ),
                              border: const OutlineInputBorder(),
                              hintText: 'Telepon',
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
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            controller: confirmPasswordController,
                            validator: (val) => MatchValidator(
                                    errorText: "Konfirmasi password tidak sama")
                                .validateMatch(val!, passwordController.text),
                            keyboardType: TextInputType.text,
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: ColorManager.primary,
                              ),
                              border: const OutlineInputBorder(),
                              hintText: 'Konfirmasi Password',
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
                              backgroundColor:
                                  ColorManager.primary, // background
                              foregroundColor: Colors.white, // foreground
                            ),
                            child: isLoading
                                ? const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text('DAFTAR'),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });

                                registerUser();
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
                              const Text('Sudah punya akun?'),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Login(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Masuk",
                                  style: TextStyle(color: ColorManager.primary),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  registerUser() async {
    Map<String, dynamic> data = {
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'telp': phoneController.text.trim(),
      'password': passwordController.text.trim(),
      'password_confirm': confirmPasswordController.text.trim(),
    };

    try {
      AuthResponseModel? res = await AuthService().register(data);

      print(res);

      UserModel? user = res.user!;

      print(user.type);

      CommonMethod().saveUserLoginsDetails(
        user.id!,
        user.name!,
        user.email!,
        passwordController.text.trim(),
        res.accessToken!,
        true,
      );

      setState(() {
        isLoading = false;
        globalAccessToken = res.accessToken!;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Calculate1(
            userModel: user,
          ),
        ),
      );
    } catch (e) {
      RegisterValidationModel er = e as RegisterValidationModel;
      CommonDialogWidget.buildOkDialog(context, false,
          "${er.email == null ? "" : er.email![0]}${er.telp == null ? "" : er.telp![0]}");

      setState(() {
        isLoading = false;
      });
    }
  }
}
