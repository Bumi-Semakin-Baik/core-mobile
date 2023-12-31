import 'package:new_bumi_baik/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../screens/auth/login.dart';

class CommonDialogWidget {
  static void buildOkNotDetectedDialog(
      BuildContext context, bool status, String message) {
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
            height: MediaQuery.of(context).size.height * 0.4,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 150, left: 32, right: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox.expand(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  status
                      ? Container(
                          decoration: BoxDecoration(
                            color: ColorManager.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: ColorManager.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      width: 213,
                      height: 55,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: ColorManager.primary),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
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

  static void buildOkDialog(BuildContext context, bool status, String message) {
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
            height: MediaQuery.of(context).size.height * 0.4,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 150, left: 32, right: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox.expand(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  status
                      ? Container(
                          decoration: BoxDecoration(
                            color: ColorManager.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: ColorManager.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      width: 213,
                      height: 55,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: ColorManager.primary),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
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

  static void buildWrongWithAuth(
      BuildContext context, bool status, String message) {
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
            height: MediaQuery.of(context).size.height * 0.4,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 150, left: 32, right: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox.expand(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  status
                      ? Container(
                          decoration: BoxDecoration(
                            color: ColorManager.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: ColorManager.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      width: 213,
                      height: 55,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: ColorManager.primary),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => Login(),
                            ),
                          );
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
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
}
