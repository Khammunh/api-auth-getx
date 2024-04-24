// ignore_for_file: avoid_unnecessary_containers

import 'package:api_auth/controllers/login_controller.dart';
import 'package:api_auth/controllers/registeration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/input_fields.dart';
import '../widgets/submit_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  RegisterController registerController = Get.put(
    RegisterController(),
  );
  LoginController loginController = Get.put(
    LoginController(),
  );

  var isLogin = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(36),
          child: Center(
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: const Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        color: !isLogin.value ? Colors.white : Colors.amber,
                        onPressed: () {
                          isLogin.value = false;
                        },
                        child: const Text('Register'),
                      ),
                      MaterialButton(
                        color: !isLogin.value ? Colors.white : Colors.amber,
                        onPressed: () {
                          isLogin.value = true;
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  isLogin.value ? loginWidget() : registerWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget registerWidget() {
    return Column(
      children: [
        InputTextFieldWidget(
          registerController.nameController,
          'name',
        ),
        const SizedBox(height: 20),
        InputTextFieldWidget(
          registerController.lastNameController,
          'lastName',
        ),
        const SizedBox(height: 20),
        InputTextFieldWidget(
          registerController.emailController,
          'email address',
        ),
        const SizedBox(height: 20),
        InputTextFieldWidget(
          registerController.passwordController,
          'password',
        ),
        const SizedBox(height: 20),
        InputTextFieldWidget(
          registerController.birthController,
          'birth',
        ),
        const SizedBox(height: 20),
        InputTextFieldWidget(
          registerController.genderController,
          'gender',
        ),
        const SizedBox(height: 20),
        SubmitButton(
          onPressed: () => registerController.registerWithEmail(),
          title: 'Register',
        )
      ],
    );
  }

  Widget loginWidget() {
    return Column(
      children: [
        SizedBox(height: 20),
        InputTextFieldWidget(
          loginController.emailController,
          'email address',
        ),
        SizedBox(height: 20),
        InputTextFieldWidget(
          loginController.passwordController,
          'password',
        ),
             SizedBox(height: 20),
             SubmitButton(onPressed: () => loginController.loginWithEmail(),title: "Login")
      ],
    );
  }
}
