import 'package:flutter/material.dart';
import 'package:seatme/core/routes_manager.dart';
import 'package:seatme/core/theme/colors.dart';
import '../../../core/widgets/app_Bar.dart';
import '../../../core/widgets/custom_textForm_field.dart';
import '../../../core/widgets/dialog_success.dart';
import '../../../core/widgets/shared_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
      appBar: customAppBar(
        title: "SignIn",
        screenWidth: MediaQuery.of(context).size.width,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            top: screenHeight * 0.2,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextFormField(
                  controller: phoneController,
                  labelText: "Phone Number or Email",
                  hintText: "Enter your phone number or email",
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone number or email is required";
                    } else if (RegExp(r'^\d{9,15}$').hasMatch(value)) {
                      return null;
                    } else if (RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                      return null;
                    } else {
                      return "Enter a valid phone number or email";
                    }
                  },
                ),
                SizedBox(height: screenHeight * 0.05),
                CustomTextFormField(
                  controller: passwordController,
                  labelText: "Password",
                  hintText: "Enter your password",
                  isSecure: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    } else if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesManager.enter_email_code_Route
                        );
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: ColorApp.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.06),
                SharedButton(
                  text: "SignIn",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showSuccessDialog(
                        context,
                        "Welcome back! You have signed in successfully.",
                      );
                    }
                  },
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.06,
                  borderRadius: 4,
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesManager.signUpRoute
                        );
                      },
                      child: const Text(
                        "SignUp",
                        style: TextStyle(
                          color: ColorApp.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
