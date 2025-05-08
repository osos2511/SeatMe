import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatme/core/theme/colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('My Profile',style:TextStyle(color:  ColorApp.secondaryColor2,fontWeight: FontWeight.bold)),
        centerTitle: true,
        automaticallyImplyLeading: false,
       
      ),
      body:
               Padding(
                 padding: const EdgeInsets.symmetric(vertical:0,horizontal: 0),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   
                       SizedBox(height: 20.h),
                      CircleAvatar(
                        radius: 60.r,
                         backgroundImage: AssetImage('assets/profile_image.jpg'),
                        backgroundColor: Colors.white,
                                           ),
                                             SizedBox(height: 40.h),
                                       
                      buildField("Name",  'Ahmed',false),
                      buildField("Phone or Email", '010254897655', false),
                     
                      SizedBox(height: 55.h),
                              ] ),
               ));
           
         
  }

  
 Widget buildField(String label, String text,
  bool isEditable) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color: ColorApp.secondaryColor1)),
          TextFormField(
            // controller: controller,
           initialValue: text,
            enabled: isEditable,
            style: TextStyle(color: ColorApp.secondaryColor2),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color:  ColorApp.secondaryColor2 )),
              disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorApp.secondaryColor2)),
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}