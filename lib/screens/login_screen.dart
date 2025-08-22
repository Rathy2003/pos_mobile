import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning/components/custom_button.dart';
import 'package:learning/components/custom_textfield.dart';
import 'package:learning/components/social_button.dart';
import 'package:learning/helper/custom_textfield_validation_rule.dart';
import 'package:learning/helper/session.dart';
import 'package:learning/helper/style.dart';
import 'package:learning/helper/user.dart';
import 'package:learning/screens/main_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:learning/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isDisabled = true; // disable button
  bool isObscure = true;
  String? errorEmailText;
  String? errorPasswordText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialization();
  }

    void initialization() async {
    FlutterNativeSplash.remove();
  }

  void processLogin(){
    User? user = UserSession().currentUser;
    if(user!=null){
      if(_emailController.text == user.email && _passwordController.text == user.password){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen(),));
      }else{
        errorEmailText = "Incorrect Email or Password";
        errorPasswordText = "";
      }
    }else{
      errorEmailText = "Incorrect Email or Password";
      errorPasswordText = "";
    }
    setState(() {
    });
  }

  @override

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Form(
        key: formKey,
        onChanged: (){
          if(formKey.currentState!.validate()){
            isDisabled = false;
          }else{
            isDisabled = true;
          }
          setState(() {
          });
        },
        child: Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              SizedBox(height: 95,),
              Text("Sign In",
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
                errorText: errorEmailText,
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
              SizedBox(height: 20,),
              // Password Field
              CustomTextField(
                errorText: errorPasswordText,
                controller: _passwordController,
                isObscureTextField: isObscure,
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
                    isObscure = !isObscure;
                    setState(() {});
                  },
                  icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility, color: Colors.grey,),
                ),
              ), // password
        
              SizedBox(height: 15,),
              // Forgot Password
              Text("Forgot Password?",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey
                ),
              ),
        
              SizedBox(height: 35,),
        
              // Login Button

              CustomButton(
                  isDisabled: isDisabled,
                  label: "Sign In",
                  onPress: () => processLogin(),
              ),
              SizedBox(height: 15,),
        
              // Don't Have account
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16
                        ),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),)),
                        text: " Sign Up",
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

