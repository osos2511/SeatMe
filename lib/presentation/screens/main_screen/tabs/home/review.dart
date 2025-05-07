import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatme/presentation/screens/main_screen/tabs/home/widgets/most_requested_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/theme/colors.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final List<String> reviewRestaurant = [
      'assets/review-1.png',
      'assets/review-1.png',
      'assets/review-1.png',
    ];

    final List<Map<String, dynamic>> mostRequested = [
      {
        'image': 'assets/most-req1.png',
        'title': 'Lebanese spicy hummus',
        'description':'Mashed chickpeas with tahini, lemon juice, and garlic, with a distinctive spicy flavor, served with olive oil and oriental spices.',
        'duration': 17,
        'price':40,
      },
      {
        'image': 'assets/most-req2.png',
        'title': 'Ras al Asfour',
        'description':'Small pieces of chicken liver sautéed with garlic, lemon, and coriander, in a rich Lebanese marinade and optional hot sauce.',
        'duration': 25,
        'price':50,
      },
      {
        'image': 'assets/most-req1.png',
        'title': 'Lebanese spicy hummus',
        'description':'Mashed chickpeas with tahini, lemon juice, and garlic, with a distinctive spicy flavor, served with olive oil and oriental spices.',
        'duration': 17,
        'price':40,
      },
      {
        'image': 'assets/most-req2.png',
        'title': 'Ras al Asfour',
        'description':'Small pieces of chicken liver sautéed with garlic, lemon, and coriander, in a rich Lebanese marinade and optional hot sauce.',
        'duration': 25,
        'price':50,
      },

    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset('assets/general_logo.png')],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xffD39345),
                      ),
                      iconSize: 20,
                    ),
                  ),
                  Text(
                    'Beirut gate',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ColorApp.secondaryColor1,
                    ),
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
                        Icons.favorite_border,
                        color: Color(0xffD39345),
                      ),
                      iconSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CarouselSlider.builder(
                itemCount: reviewRestaurant.length,
                itemBuilder: (context, index, realIndex) {
                  final restaurant = reviewRestaurant[index];
                  return Image.asset(restaurant);
                },
                options: CarouselOptions(
                  initialPage: 1,
                  height: 280.h,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  viewportFraction: .70,
                  // enlargeFactor: .16,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              SizedBox(height: 10.h),
              Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: currentIndex,
                  count: reviewRestaurant.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 6,
                    dotWidth: 6,
                    activeDotColor: ColorApp.secondaryColor2,
                    dotColor: Colors.grey.shade300,
                  ),
                ),
              ),
              SizedBox(height: 17.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.location_on, color: ColorApp.secondaryColor1, size: 30),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Al Heera Beach, Cluster 1 - Venue1 - Al Muntazah St - Al Fisht , Sharjah, United Arab Emirates',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        color: ColorApp.secondaryColor2,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: ColorApp.secondaryColor1, size: 20),
                      SizedBox(width: 4),
                      Text(
                        '4.5',
                        style: GoogleFonts.inter(
                          color: ColorApp.secondaryColor1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text('We are a Lebanese restaurant offering an authentic dining experience that combines the traditional flavors of Lebanese cuisine with modern presentation. The restaurant offers a variety of grilled dishes, appetizers, and oriental pastries in an elegant setting overlooking Sharjah Beach, making it an ideal destination for families and lovers of authentic Lebanese cuisine.'
                ,style: GoogleFonts.inter(fontWeight: FontWeight.w400,
                  color: Color(0xff695A49)
                ),),

              SizedBox(height: 25.h),
              Text('Most requested dishes this week',style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                color: Color(0xff695A49),
                fontSize: 18
              ),),
              SizedBox(height: 25.h),
              SizedBox(
                height: 260.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: mostRequested.length,
                  itemBuilder: (context, index) {
                    final item = mostRequested[index];
                    return MostRequestedCard(
                      imagePath: item['image'],
                      title: item['title'],
                      description: item['description'],
                      duration: '${item['duration']} min',
                      price: '${item['price']} AED',
                    );
                  },
                ),
              ),

              SizedBox(
                height: 25.h,
              ),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150.w, 50.h),
                    backgroundColor: ColorApp.secondaryColor1,
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                  ),
                    onPressed: (){}, child: Text('Book a Table',style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  color: Colors.white

                ),)),
              )


            ],
          ),
        ),
      ),
    );
  }
}
