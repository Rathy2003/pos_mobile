import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    this.onPress,
    this.isDisabled=false
  });
  final String label;
  final VoidCallback? onPress;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,

      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.all(18)),
          backgroundColor: WidgetStateProperty.resolveWith((state) => isDisabled! ? StyleColor.primary.withAlpha(70) : StyleColor.primary),
          elevation: WidgetStateProperty.all(0),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
        ),
        onPressed: () => isDisabled ? null : onPress!(),
        child: Text(label,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            )
        ),
      ),
    );
  }
}
