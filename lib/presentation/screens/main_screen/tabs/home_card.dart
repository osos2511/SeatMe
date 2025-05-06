import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seatme/core/theme/colors.dart';



class RestaurantCard extends StatelessWidget {
  final String name;
  final double rating;
  final String image;
  final String location;

  const RestaurantCard({
    super.key,
    required this.name,
    required this.rating,
    required this.image,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(2, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all( Radius.circular(20)).r,
                child: Image.asset(
                  image,
                  height: 140.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8).r,
                  decoration: BoxDecoration(
                    color: ColorApp.secondaryColor1,
                    borderRadius: BorderRadius.circular(12).r,
                  ),
                  child: Row(
                    children: [
                       Icon(Icons.star, color: Colors.white, size: 14.sp),
                       SizedBox(width: 4.w),
                      Text(
                        rating.toString(),
                        style:  TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 14.sp),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
           const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0).r,
            child: Center(
              child: Text(
                name,
                style:  TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: ColorApp.secondaryColor2),
              ),
            ),
          ),
           const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Icon(Icons.location_on_outlined, color: ColorApp.secondaryColor2, size: 12.sp),
                 SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    location,
                     maxLines: 3,
    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: ColorApp.secondaryColor2, fontSize: 7.sp),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:2.0).r,
            child:Directionality(
  textDirection: TextDirection.rtl,
  child: Center(
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorApp.secondaryColor1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8).r),
        padding: const EdgeInsets.symmetric(horizontal: 10).r,
      ),
      onPressed: () {},
      icon: Icon(Icons.arrow_back, size: 12.sp, color: Colors.white),
      label: Text('Book a Table', style: TextStyle(fontSize: 12.sp, color: Colors.white),
     
      textAlign: TextAlign.left,),
    ),
  ),
)

          ),
          const Spacer(flex: 3,),
        ],
      ),
    );
  }
}
