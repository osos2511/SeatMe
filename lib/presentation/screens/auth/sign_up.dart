import 'package:flutter/material.dart';
import '../../../core/widgets/app_Bar.dart';
import '../../../core/widgets/custom_textForm_field.dart';
import '../../../core/widgets/dialog_success.dart';
import '../../../core/widgets/shared_button.dart';
import '../../../core/routes_manager.dart'; // تأكد من استيراد المسارات

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    companyNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
      appBar: customAppBar(
        title: "SignUp",
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
              children: [
                CustomTextFormField(
                  controller: companyNameController,
                  labelText: "Name",
                  hintText: "Enter your name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomTextFormField(
                  controller: phoneController,
                  labelText: "Phone Number or Email",
                  hintText: "Enter your phone number or email",
                  keyboardType: TextInputType.text, // نستخدم TextInputType.text لأنه يدعم كلا النوعين
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone number or email is required";
                    } else if (RegExp(r'^\d{9,15}$').hasMatch(value)) {
                      // تحقق من رقم الهاتف
                      return null;
                    } else if (RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                      // تحقق من البريد الإلكتروني
                      return null;
                    } else {
                      return "Enter a valid phone number or email";
                    }
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
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
                SizedBox(height: screenHeight * 0.02),
                CustomTextFormField(
                  controller: confirmPasswordController,
                  labelText: "Confirm password",
                  hintText: "Confirm your password",
                  isSecure: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Confirm password is required";
                    } else if (value != passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.06),
                SharedButton(
                  text: "SignUp",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showSuccessDialog(
                        context,
                        "Your registration has been completed successfully!",
                      );
                    }
                  },
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.06,
                  borderRadius: 4,
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RoutesManager.signInRoute,
                        );
                      },
                      child: const Text(
                        "SignIn",
                        style: TextStyle(
                          color: Color(0xff93714A),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
