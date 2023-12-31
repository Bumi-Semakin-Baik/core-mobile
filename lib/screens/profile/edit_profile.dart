import 'dart:io';
import 'dart:math';

import 'package:new_bumi_baik/common/common_widget.dart';
import 'package:new_bumi_baik/models/user_model.dart';
import 'package:new_bumi_baik/resources/color_manager.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_bumi_baik/services/user_service.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class EditProfile extends StatefulWidget {
  UserModel userModel;
  EditProfile({required this.userModel, Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  late String selectedValue;
  List<String> gender = ["None", "Female", "Male"];
  final ImagePicker _picker = ImagePicker();
  dynamic _pickImageError;
  bool isLoading = false;
  XFile? _imageFile;
  late DateTime selectedDate;

  void _setImageFileListFromFile(XFile? value) {
    _imageFile = value;
  }

  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 100,
        maxHeight: 100,
        imageQuality: 100,
      );
      setState(() {
        _setImageFileListFromFile(pickedFile);
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  void _showDatePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
    );

    selectedDate = date ?? DateTime.parse(widget.userModel.birthDate);
    setState(() {});
  }

  @override
  void initState() {
    setDetails();
    // widget.userModel = UserModel(
    //     id: 1,
    //     name: 'Derajat',
    //     email: 'darkbludevil@gmail.com',
    //     telp: '08887125515',
    //     birthDate: '28 agustus 2020',
    //     gender: 'laki - laki',
    //     address: ' aslkdjalsdjlsakj',
    //     photo: '',
    //     type: '',
    //     emailVerifiedAt: DateTime.now());

    super.initState();
  }

  setDetails() {
    setState(() {
      nameController.text = widget.userModel.name ?? "";
      emailController.text = widget.userModel.email ?? "";
      addressController.text = widget.userModel.address ?? "";
      phoneController.text = widget.userModel.telp ?? "";
      selectedValue = widget.userModel.gender ?? gender.first;
      selectedDate = DateTime.parse(widget.userModel.birthDate);
    });
  }

  void showPickImageDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 100),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 150, left: 32, right: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox.expand(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Pilih gambar dari",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _onImageButtonPressed(ImageSource.camera,
                              context: context);

                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: const FaIcon(
                                    FontAwesomeIcons.camera,
                                    size: 35,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text('Kamera',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          ?.copyWith(
                                              fontWeight: FontWeight.normal)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _onImageButtonPressed(ImageSource.gallery,
                              context: context);

                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: const FaIcon(
                                    FontAwesomeIcons.image,
                                    size: 35,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text('Galeri',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(
                                          fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.buildCommonAppbar(context, "Edit Profil"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 13, width: MediaQuery.of(context).size.width),
              Center(
                child: SizedBox(
                  height: 129,
                  width: 140,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0), //or 15.0
                        child: SizedBox(
                          height: 120.0,
                          width: 120.0,
                          child: _imageFile == null
                              ? SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: FancyShimmerImage(
                                      boxFit: BoxFit.cover,
                                      imageUrl: widget.userModel.photo ?? "",
                                      errorWidget: Image.network(
                                          'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                                    ),
                                  ),
                                )
                              : Image.file(
                                  File(_imageFile!.path),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Positioned.fill(
                        top: 10,
                        right: 10,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () async {
                              showPickImageDialog(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 17),
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorManager.darkGrey,
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: const Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const FaIcon(FontAwesomeIcons.camera),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 13, width: MediaQuery.of(context).size.width),
              Text("Nama", style: Theme.of(context).textTheme.subtitle2),
              SizedBox(height: 15, width: MediaQuery.of(context).size.width),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 24, top: 3),
                decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Nama',
                      border: InputBorder.none,
                      labelStyle: Theme.of(context).textTheme.bodyText2),
                ),
              ),
              SizedBox(height: 20, width: MediaQuery.of(context).size.width),
              Text("Email", style: Theme.of(context).textTheme.subtitle2),
              SizedBox(height: 15, width: MediaQuery.of(context).size.width),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 24, top: 3),
                decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  enabled: false,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      border: InputBorder.none,
                      labelStyle: Theme.of(context).textTheme.bodyText2),
                ),
              ),
              SizedBox(height: 20, width: MediaQuery.of(context).size.width),
              Text("Nomor Telepon",
                  style: Theme.of(context).textTheme.subtitle2),
              SizedBox(height: 15, width: MediaQuery.of(context).size.width),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 24, top: 3),
                decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: 'Nomor Telepon',
                      border: InputBorder.none,
                      labelStyle: Theme.of(context).textTheme.bodyText2),
                ),
              ),
              SizedBox(height: 20, width: MediaQuery.of(context).size.width),
              Text("Alamat", style: Theme.of(context).textTheme.subtitle2),
              SizedBox(height: 15, width: MediaQuery.of(context).size.width),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 24, top: 3),
                decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  controller: addressController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Alamat',
                      border: InputBorder.none,
                      labelStyle: Theme.of(context).textTheme.bodyText2),
                ),
              ),
              SizedBox(height: 20, width: MediaQuery.of(context).size.width),
              Text("Jenis Kelamin",
                  style: Theme.of(context).textTheme.subtitle2),
              SizedBox(height: 15, width: MediaQuery.of(context).size.width),
              Container(
                  height: 55,
                  padding: const EdgeInsets.only(left: 24, top: 3),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 0.70),
                  ),
                  // decoration: BoxDecoration(
                  // ),
                  child: DropdownButton<String?>(
                    hint: const Text('Gender'),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value ?? "";
                      });
                    },
                    underline: const SizedBox(),
                    isExpanded: true,
                    items: gender
                        .map<DropdownMenuItem<String?>>(
                          (e) => DropdownMenuItem(
                            child: Text(
                              e.toString(),
                            ),
                            value: e,
                          ),
                        )
                        .toList(),
                  )
                  // print();),
                  ),
              SizedBox(height: 20, width: MediaQuery.of(context).size.width),
              Text("Tanggal Lahir",
                  style: Theme.of(context).textTheme.subtitle2),
              SizedBox(height: 15, width: MediaQuery.of(context).size.width),
              Container(
                height: 55,
                padding: const EdgeInsets.only(left: 9, top: 3),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 0.70),
                ),
                child: MaterialButton(
                  onPressed: _showDatePicker,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Icon(
                      //   Icons.calendar_month,
                      //   color: ColorManager.primary,
                      // ),
                      // SizedBox(
                      //   width: 4,
                      // ),
                      Text(
                        DateFormat('yyyy-MM-dd').format(selectedDate!),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
                      : const Text('SIMPAN'),
                  onPressed: () async {
                    await UserService().updateUserDetails(
                      {
                        "name": nameController.text,
                        "email": emailController.text,
                        "telp": phoneController.text,
                        "birth_date":
                            DateFormat('yyyy-MM-dd').format(selectedDate),
                        "gender": selectedValue,
                      },
                    );
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                    ;
                    await UserService().getUserDetails();
                    // print(test);
                    print(selectedDate);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//   updateUser() async {
//     Map<String, dynamic> data = {
//       'name': nameController.text.trim(),
//       'email': emailController.text.trim(),
//       'telp': phoneController.text.trim(),
//       'gender': selectedValue,
//     };
//     print(data["gender"]);
//     try {
//       AuthResponseModel? res = await AuthService().register(data);

//       try {
//         setState(() {
//           globalAccessToken = res.accessToken!;
//         });

//         UserModel user = await UserService().getUserDetails();

//         CommonMethod().saveUserLoginsDetails(
//           user.id!,
//           user.name!,
//           user.email!,
//           passwordController.text.trim(),
//           res.accessToken!,
//           true,
//           user.gender!,
//         );

//         setState(() {
//           isLoading = false;
//         });

//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => Calculate1(
//               userModel: user,
//             ),
//           ),
//         );
//       } catch (e) {
//         print(e);
//         CommonDialogWidget.buildOkDialog(context, false, e.toString());

//         setState(() {
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       print(e);
//       RegisterValidationModel er = e as RegisterValidationModel;
//       CommonDialogWidget.buildOkDialog(context, false,
//           "${er.email == null ? "" : er.email![0]}${er.telp == null ? "" : er.telp![0]}");
//       //CommonDialogWidget.buildOkDialog(context, false, e.toString());

//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
// }

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);
