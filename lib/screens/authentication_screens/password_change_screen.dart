import 'package:ektv/screens/authentication_screens/authentication_common_screen.dart';
import 'package:ektv/screens/home_screen.dart';
import 'package:ektv/services/app_response_service.dart';
import 'package:ektv/services/common_action_service.dart';
import 'package:ektv/services/constant_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PasswordChangeScreen extends StatefulWidget {
  const PasswordChangeScreen({super.key});

  @override
  State<PasswordChangeScreen> createState() => _PasswordChangeScreenState();
}

class _PasswordChangeScreenState extends State<PasswordChangeScreen> {
  final _emailTxtController=TextEditingController();
  
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
                      Text("Reset password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Text("Password reset link will be sent to your email.."),
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
                      ElevatedButton(onPressed: (){
                        String email=_emailTxtController.text.trim();
                        String password=_emailTxtController.text.trim();
                        if(email.isNotEmpty){
                         AppResponseService().showLoadingDialog(context);
                          Future.delayed(Duration(seconds:4),(){
                            Navigator.pop(context);
                            AppResponseService().showSnackBar("Open your gmail account to procees..","info");
                          });
                        }else{
                          Fluttertoast.showToast(msg: "All fields are required!!");
                        }
                      }, child: Text("Get link")),  
                      SizedBox(height: 5,),
                      GestureDetector(
                        onTap: (){
                          CommonActions().animatePageView(0);
                        },
                        child: AbsorbPointer(child: Text("Accidentally?",style: TextStyle(fontWeight: FontWeight.bold,color: kAppColor),))),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          CommonActions().animatePageView(1);
                        },
                        child: AbsorbPointer(child: Text("Don't have an account?",style: TextStyle(fontWeight: FontWeight.bold,color: kAppColor),))),
                      ],
                    ),
                  ),
                ),
              ),
            );
  }
}
