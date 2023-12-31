import 'package:new_bumi_baik/common/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../resources/color_manager.dart';

class EditPassword extends StatefulWidget {
  EditPassword({Key? key}) : super(key: key);

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _isObscure = true;

  final _formKey = GlobalKey<FormState>();

  final _passwordValidator = MultiValidator([
    RequiredValidator(errorText: "Harap masukan password"),
    MinLengthValidator(8, errorText: "Panjang password minimal 8 karakter"),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: "Password harus menyertakan karakter special"),
  ]);

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.buildCommonAppbar(context, "Edit Password"),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller: oldPasswordController,
                    validator: _passwordValidator,
                    keyboardType: TextInputType.text,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: ColorManager.primary,
                      ),
                      border: const OutlineInputBorder(),
                      hintText: 'Password Sekarang',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManager.primary,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                          color:
                              _isObscure ? Colors.grey : ColorManager.primary,
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
                      hintText: 'Password Baru',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManager.primary,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                          color:
                              _isObscure ? Colors.grey : ColorManager.primary,
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
                      hintText: 'Konfirmasi Password Baru',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManager.primary,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                          color:
                              _isObscure ? Colors.grey : ColorManager.primary,
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
                        : const Text('UBAH PASSWORD'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });

                        //registerUser();
                      }
                    },
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
