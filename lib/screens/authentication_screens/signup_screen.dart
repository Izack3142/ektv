import 'package:ektv/screens/authentication_screens/authentication_common_screen.dart';
import 'package:ektv/screens/home_screen.dart';
import 'package:ektv/services/app_response_service.dart';
import 'package:ektv/services/common_action_service.dart';
import 'package:ektv/services/constant_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _lNameTxtController=TextEditingController();
  final _fNameTxtController=TextEditingController();
  final _emailTxtController=TextEditingController();
  final _passwordTxtController=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return  Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 10)],
                    borderRadius: BorderRadius.circular(20),
                  color:kWhiteColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  child: Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                      Text("Sign up",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      SizedBox(
                        height: 43,
                        child: TextFormField(
                          controller: _fNameTxtController,
                          decoration: InputDecoration(
                            label: Text("FirstName"),
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                            )
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      SizedBox(
                        height: 43,
                        child: TextFormField(
                          controller: _lNameTxtController,
                          decoration: InputDecoration(
                            label: Text("Last name"),
                            prefixIcon: Icon(Icons.person_add),
                            border: OutlineInputBorder(
                            )
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      SizedBox(
                        height: 43,
                        child: TextFormField(
                          controller: _emailTxtController,
                          decoration: InputDecoration(
                            label: Text("Email address"),
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                            )
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      SizedBox(
                        height: 43,
                        child: TextFormField(
                          controller: _passwordTxtController,
                          obscureText: true,
                          decoration: InputDecoration(
                            label: Text("Password"),
                            prefixIcon: Icon(Icons.password_outlined),
                            border: OutlineInputBorder(
                            )
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      ElevatedButton(onPressed: (){
                        String email=_emailTxtController.text.trim();
                        String password=_emailTxtController.text.trim();
                        if(email.isNotEmpty && password.isNotEmpty){
                        AppResponseService().showLoadingDialog(context);
                          Future.delayed(Duration(seconds:4),(){
                            Navigator.pop(context);
                            CommonActions().navigateScreen(context,HomeScreen(),replace: true);
                          });
                        }else{
                          Fluttertoast.showToast(msg: "All fields are required!!");
                        }
                      }, child: Text("Sign up")),  
                      SizedBox(height: 5,),
                      GestureDetector(
                        onTap: (){
                          CommonActions().animatePageView(2);
                        },
                        child: AbsorbPointer(child: Text("Forgot password?",style: TextStyle(fontWeight: FontWeight.bold,color: kAppColor),))),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          CommonActions().animatePageView(0);
                        },
                        child: AbsorbPointer(child: Text("Have an account?",style: TextStyle(fontWeight: FontWeight.bold,color: kAppColor),))),
                      ],
                    ),
                  ),
                ),
              ),
            );
  }
}
