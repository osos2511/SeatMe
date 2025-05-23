import 'package:flutter/material.dart';
import 'package:seatme/core/routes_manager.dart';
import '../../../core/widgets/app_Bar.dart';
import '../../../core/widgets/custom_textForm_field.dart';
import '../../../core/widgets/dialog_success.dart';
import '../../../core/widgets/shared_button.dart';

class EnterEmailOrPass extends StatefulWidget {
  const EnterEmailOrPass({super.key});

  @override
  State<EnterEmailOrPass> createState() => _EnterEmailOrPassState();
}

class _EnterEmailOrPassState extends State<EnterEmailOrPass> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
      appBar: customAppBar(
        title: "Forgot Password",
        screenWidth: screenWidth,
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
                SharedButton(
                  text: "Send",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showSuccessDialog(
                        context,
                        "Your code has been sent successfully!",
                        RoutesManager.otpRoute,
                      );
                    }
                  },
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.06,
                  borderRadius: 4,
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
