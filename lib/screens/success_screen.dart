import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning/components/custom_button.dart';
import 'package:learning/helper/style.dart';
import 'package:learning/screens/login_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: StyleColor.primary
                ),
                child: Icon(Icons.check,size: 50,color: Colors.white,),
              ),
            ),
            SizedBox(height: 30,),

            Text("Success!",
              style: GoogleFonts.aBeeZee(
                textStyle: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Text(
                  "Your Account has been create successfully.",
                  style: GoogleFonts.aBeeZee(
                    textStyle: TextStyle(
                      color: Colors.grey.withAlpha(700),
                        fontSize: 18
                    )
                  ),
                  textAlign: TextAlign.center,
                ),
            ),
            Spacer(),
            // Continue Button
            CustomButton(
                onPress: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                },
                label: "Continue"
            ),
          ],
        ),
      ),
    );
  }
}
