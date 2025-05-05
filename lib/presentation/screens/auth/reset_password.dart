import 'package:flutter/material.dart';
import '../../../core/widgets/app_Bar.dart';
import '../../../core/widgets/custom_textForm_field.dart';
import '../../../core/widgets/dialog_success.dart';
import '../../../core/widgets/shared_button.dart';
import '../../../core/routes_manager.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({super.key});

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
   
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
        title: "Reset Password",
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
                  text: "Reset",
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
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
