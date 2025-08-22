import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning/components/custom_button.dart';
import 'package:learning/helper/session.dart';
import 'package:learning/helper/user.dart';
import 'package:learning/screens/success_screen.dart';

import '../components/custom_textfield.dart';
import '../components/social_button.dart';
import '../helper/custom_textfield_validation_rule.dart';
import '../helper/style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final  _emailController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final  _confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var errorsMessage = {
    "email": '',
    "password": ''
  };
  bool isDisabled = true; // disable button
  bool isObscurePassword = true;
  bool isObscureCfPassword = true;
  bool isAgree = false;

  void processCreateAccount(){
    String email = _emailController.text;
    String phoneNumber = _phonenumberController.text;
    String password = _passwordController.text;
    User newUser = User(email: email, password: password, phone_number: phoneNumber);
    UserSession().currentUser = newUser;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  SuccessScreen(),));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Form(
        onChanged: (){
          if(formKey.currentState!.validate() && isAgree){
            isDisabled = false;

          }else{
            isDisabled = true;
          }
          setState(() {
          });
        },
        key: formKey,
        child: Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              SizedBox(height: 95,),
              Text("Sign Up",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: StyleColor.primary
                    )
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15,),
              Text("It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum.",
                style: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 35,),
              // Facebook or Google button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SocialButton(
                    title: "Facebook",
                    image:"assets/images/facebook_icon.png",
                    width: MediaQuery.of(context).size.width / 2 - 25,
                  ),
                  SocialButton(
                    title: "Google",
                    image:"assets/images/google_icon.png",
                    width: MediaQuery.of(context).size.width / 2 - 25,
                  )
                ],
              ),
              SizedBox(height: 25,),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                    child: Text("Or"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 25,),
              // Email Field
              CustomTextField(
                rule: CustomtextFieldValidationRule.email,
                controller: _emailController,
                placeholder: "Email Address",
                validator: (p0) {
                  if(p0 == null || p0.isEmpty){
                    return "Email is required";
                  }

                  RegExp regex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                  if(!regex.hasMatch(p0)){
                    return "Invalid Email Format";
                  }
                  return null;
                },
              ),


              SizedBox(height: 25,),

              // Phone Number
              CustomTextField(
                controller: _phonenumberController,
                rule: CustomtextFieldValidationRule.digitNumber,
                placeholder: "Phone Number",
                validator: (p0) {
                  if(p0 == null || p0.isEmpty) {
                    return "Phone number is required";
                  }

                  var phoneNumberRegex = RegExp(r"^\d+$");
                  if(!phoneNumberRegex.hasMatch(p0)){
                    return "Phone number must be digit.";
                  }

                  if(p0.length < 8){
                    return "Phone number at least 8 digits.";
                  }

                  return null;
                },
              ),

              SizedBox(height: 20,),

              // Password Field
              CustomTextField(
                controller: _passwordController,
                isObscureTextField: isObscurePassword,
                placeholder: "Password",
                rule: CustomtextFieldValidationRule.password,
                validator: (p0){
                  if(p0 == null || p0.isEmpty){
                    return "Password is required";
                  }
                  if(p0.length < 6){
                    return "Password minimum is 6 character.";
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: (){
                    isObscurePassword = !isObscurePassword;
                    setState(() {});
                  },
                  icon: Icon(isObscurePassword ? Icons.visibility_off : Icons.visibility, color: Colors.grey,),
                ),
              ),

              SizedBox(height: 20,),

              // Confirm Password Field
              CustomTextField(
                controller: _confirmPasswordController,
                isObscureTextField: isObscureCfPassword,
                placeholder: "Confirm Password",
                rule: CustomtextFieldValidationRule.password,
                validator: (p0){
                  if(p0 == null || p0.isEmpty){
                    return "Confirm Password is required";
                  }
                  if(p0 != _passwordController.text){
                    return "Password and Confirm Password doesn't match.";
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: (){
                    isObscureCfPassword = !isObscureCfPassword;
                    setState(() {});
                  },
                  icon: Icon(isObscureCfPassword ? Icons.visibility_off : Icons.visibility, color: Colors.grey,),
                ),
              ), // password

              SizedBox(height: 35,),
              // Checkbox
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                      activeColor: StyleColor.primary,
                      value: isAgree,
                      onChanged: (status) => {
                        isAgree = status!,
                        if(isAgree){
                          isDisabled = false
                        }else{
                          isDisabled = true
                        },
                        setState(() {})
                      }
                  ),
                  Expanded(
                    child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            height: 2
                          ),
                          children: [
                            TextSpan(
                              style: TextStyle(
                                color: Colors.black
                              ),
                              text: "I'm agree to The "
                            ),
                            TextSpan(
                                style: TextStyle(
                                    color: StyleColor.primary
                                ),
                                text: "Terms of Service"
                            ),
                            TextSpan(
                                style: TextStyle(
                                    color: Colors.black
                                ),
                                text: " and "
                            ),
                            TextSpan(
                                style: TextStyle(
                                    color: StyleColor.primary
                                ),
                                text: "Privacy Policy"
                            )
                          ]
                    )),
                  )
                ],
              ),
              SizedBox(height: 35,),

              // Create Account Button
              CustomButton(
                  isDisabled: isDisabled,
                  onPress: (){
                    if(formKey.currentState!.validate()){
                      processCreateAccount();
                    }
                  },
                  label: "Create Account"
              ),

              SizedBox(height: 15,),

              // Do you have account
              Center(
                child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Do you have account?",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () => Navigator.pop(context),
                            text: " Sign In",
                            style: TextStyle(
                                color: StyleColor.primary,
                                fontSize: 16
                            ),
                          )
                        ]
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
