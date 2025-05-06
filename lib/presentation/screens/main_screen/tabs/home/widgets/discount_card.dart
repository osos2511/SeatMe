import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seatme/core/theme/colors.dart';

class DiscountCard extends StatelessWidget {
  final String text;
  final String image;

  const DiscountCard({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)).r,
            child: Image.asset(
              image,
              height: 120.h,

              width: 103.w,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 10.h),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5).r,
                child: Center(
                  child: Text(
                    text,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorApp.secondaryColor2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0).r,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorApp.secondaryColor1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10).r,
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        size: 12.sp,
                        color: Colors.black,
                      ),
                      label: Text(
                        'More Offers',
                        style: TextStyle(fontSize: 12.sp, color: Colors.black),

                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
