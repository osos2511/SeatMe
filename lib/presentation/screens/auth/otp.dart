import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:seatme/core/routes_manager.dart';

import 'package:seatme/core/widgets/shared_button.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String Otp = "";
  int secondsRemaining = 30;
  Timer? _timer;
  bool enableResend = false;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer?.cancel();
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
        timer.cancel();
      }
    });
  }
  void _showSuccessDialog() {
    
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) {
        
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          contentPadding: EdgeInsets.all(20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 5),
              Text(
                "Congratulation",
                style:TextStyle(
                          color: Color(0xff93714A),
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
              ),
              SizedBox(height: 15),
              Text(
                "Your account is ready. You will be redirected to the home page.",
                textAlign: TextAlign.center,
                style: TextStyle(
                          color: Color(0xff93714A),
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
              ),
            ],
          ),
        );
      },
    );  Future.delayed(Duration(seconds: 3), () {
     Navigator.pushNamed(
                          context,
                          RoutesManager.reset_pass_Route,
                        );
    });
  }

  @override
    void dispose() {
    // for (var controller in controllers) {
    //   controller.dispose();
    // }
    _timer?.cancel();
    super.dispose();
  }
  Widget build(BuildContext context) {
     final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 70),
             
            
            Text(
              'OTP Code verifcation',
              style: TextStyle(
                          color: Color(0xff93714A),
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
            ),
            const SizedBox(height: 25),
Text(
              'Enter code sent to +201******71',
               textAlign: TextAlign.center,
              style: TextStyle(
                          color: Color(0xff93714A),
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),),
            
                        const SizedBox(height: 45),

 PinCodeTextField(
              length: 4,
              obscureText: true,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 48.h,
                fieldWidth: 65.w,
                inactiveColor: Color(0xff93714A),
                activeColor: Color(0xffB1630D),
                selectedColor: Color(0xffB1630D),
              ),
              onChanged: (value) {
                setState(() => Otp = value);
              },
              appContext: context,
            ),
             const SizedBox(height: 25),
Text(
              'Resend code in 55 s',
               textAlign: TextAlign.center,
              style: TextStyle(
                          color: Color(0xff93714A),
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
            ),

            SizedBox(height: 40),

                           SharedButton(
                  text: "Continue",
                  onPressed:(){ Otp.length == 4 ? 
                 _showSuccessDialog()
                 : null;},
                   width: screenWidth * 0.7,
                  height: screenHeight * 0.06,
                  borderRadius: 4,)
                   
          ],
        ),
      ),
    );
  }
  
}