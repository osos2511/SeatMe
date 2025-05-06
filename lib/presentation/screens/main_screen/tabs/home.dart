import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
          Text('Our restaurants',style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w700),)
        ],
      ),
    );
  }
}
