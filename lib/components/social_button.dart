import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning/helper/style.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.title,
    required this.image,
    this.width = 200
  });

  final String title;
  final String image;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: StyleColor.filledBackground,
        boxShadow: [
          BoxShadow(
            color: StyleColor.shadow,
            blurRadius: 3,
            offset: const Offset(0, 1)
          )
        ]
      ),
      width: width,
      
      child: Row(
      children: [
        Image.asset(
          image,
          height: 30,
        ),
        SizedBox(width: 8,),
        Text(
          title,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.grey
            ),
          )
        )
      ],
    ),
    );
  }
}