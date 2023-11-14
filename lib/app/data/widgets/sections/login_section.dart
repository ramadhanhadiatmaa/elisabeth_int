import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/login/controllers/login_controller.dart';
import '../../constants/color.dart';
import '../../constants/file_string.dart';
import '../tools/text_widget.dart';

class LoginSection extends StatelessWidget {
  LoginSection({
    super.key,
  });

  final loginC = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              color: cWhite,
            ),
            const Image(
              image: AssetImage(
                back,
              ),
              fit: BoxFit.cover,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(
                  top: 140,
                ),
                width: 400,
                height: 450,
                decoration: BoxDecoration(
                    color: cWhite,
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: cBlack.withOpacity(0.2),
                        offset: const Offset(
                          25,
                          25,
                        ),
                        blurRadius: 50,
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextWidget(
                        title: "ELISABETH INTERNAL EMPLOYEE",
                        color: cRed,
                        weight: FontWeight.w800,
                        size: 16,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                title: "Log In",
                                color: cBlack,
                                weight: FontWeight.w700,
                                size: 16,
                              ),
                              TextWidget(
                                title: "Masuk untuk melanjutkan",
                                color: cBlack,
                                weight: FontWeight.w300,
                                size: 14,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          TextWidget(
                            title: "Username",
                            color: cBlack,
                            weight: FontWeight.w500,
                            size: 14,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        autocorrect: false,
                        controller: loginC.userC,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            labelText: "Username",
                            labelStyle: const TextStyle(
                              color: cGrey,
                            ),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: cRed,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          TextWidget(
                            title: "Password",
                            color: cBlack,
                            weight: FontWeight.w500,
                            size: 14,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        autocorrect: false,
                        controller: loginC.passC,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            labelText: "Password",
                            labelStyle: const TextStyle(
                              color: cGrey,
                            ),
                            prefixIcon: const Icon(
                              Icons.key_outlined,
                              color: cRed,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cRed,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                        ),
                        onPressed: () {
                          loginC.loginApi();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextWidget(
                            title: "LOGIN",
                            color: cWhite,
                            weight: FontWeight.w600,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
