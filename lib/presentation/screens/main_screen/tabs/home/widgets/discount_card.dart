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
      height: 120.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
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
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset(
              image,
              height: 120.h,
              width: 103.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0).r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorApp.secondaryColor2,
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorApp.secondaryColor1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4).r,
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

