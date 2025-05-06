import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatme/core/theme/colors.dart';
import 'package:seatme/presentation/screens/main_screen/tabs/home_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> restaurants = [
      {
        'name': 'Beirut gate',
        'rating': 4.5,
        'image': 'assets/image(4).png',
        'location': 'Al Heera Beach, Cluster 1 - Venue1 - Al Muntazah St - Al Fisht , Sharjah, United Arab Emirates',
      },
      {
        'name': 'turkish.gate',
        'rating': 4.2,
        'image': 'assets/image(4).png',
        'location': 'Turkish Gate Restaurant - cornishe ST - Hay Al Gharb, Sharjah 6666',
      },
      {
        'name': 'Thai_gate',
        'rating': 4.7,
        'image': 'assets/image(4).png',
        'location': '📍Univesity city - Sharjah📍Al heera beach - Sharjah📍Khorfakkan📍Al qana - Abu dhabi📍Rak',
      },
    ];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('assets/general_logo.png')],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/girl.png'),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Hi, Hagar',
                    style: GoogleFonts.inter(
                      color: Color(0xffAA8255),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_active_outlined,
                    color: Color(0xffD39345),
                  ),
                  iconSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 22,
          ),
          Text('Our restaurants',style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w700),),
          Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: CarouselSlider.builder(
          itemCount: restaurants.length,
          itemBuilder: (context, index, realIndex) {
            final restaurant = restaurants[index];
            return GestureDetector(
              onTap: () {
                
              },
              child: Hero(
                tag: restaurant['name'],
                child: RestaurantCard(
                  name: restaurant['name'],
                  rating: restaurant['rating'],
                  image: restaurant['image'],
                  location: restaurant['location'],
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 255.h,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            viewportFraction: .38,
            enlargeFactor: .15,
            onPageChanged: (index, reason) {
             setState(() {
               currentIndex = index;
             });
            },
          ),
        ),),        SizedBox(height: 10.h),
        Center(
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: restaurants.length,
            effect: ExpandingDotsEffect(
              dotHeight: 6,
              dotWidth: 6,
              activeDotColor: ColorApp.secondaryColor2,
              dotColor: Colors.grey.shade300,
            ),
           ),
        ),
      

    
        ],
      ),
    );
  }
}
