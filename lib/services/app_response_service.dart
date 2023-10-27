import 'package:ektv/main.dart';
import 'package:ektv/services/constant_service.dart';
import 'package:flutter/material.dart';

class AppResponseService{
  
 showSnackBar(String message,String type){
    scaffoldKey.currentState!.showSnackBar(SnackBar(
    backgroundColor: type=="error"?Colors.red:Colors.green,
    duration: Duration(seconds:8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    content:Row(
    children: [
      Icon(type=="error"?Icons.error:Icons.done),
      Expanded(child: Text(message,style: TextStyle(fontWeight: FontWeight.bold),)),
    ],
  )));
 }


  void showLoadingDialog(BuildContext context){
    showDialog(context: context,
    barrierColor: Colors.black87,
     builder: (context){
       return Container(
        width: 50,height:50,
        padding: EdgeInsets.all(0),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
           children:[
             CircularProgressIndicator(color: kWhiteColor,),
             Text("please wait..",style: TextStyle(color: kWhiteColor,fontWeight: FontWeight.bold),)
             ],
         ),
       );
    });
  }
}