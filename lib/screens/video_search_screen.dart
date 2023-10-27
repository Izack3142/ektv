import 'package:ektv/services/common_action_service.dart';
import 'package:flutter/material.dart';

class VideoSearchScreen extends StatefulWidget {
  const VideoSearchScreen({super.key});

  @override
  State<VideoSearchScreen> createState() => _VideoSearchScreenState();
}

class _VideoSearchScreenState extends State<VideoSearchScreen> {
  final _searchTextController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
            Container(
              height: 45,
              child: TextFormField(
                onFieldSubmitted: (text){
                   if(text.trim().isNotEmpty){
                     Navigator.pop(context,text);
                   }else{
                      CommonActions().showToast("Type something..");
                   }
                },
                textInputAction: TextInputAction.search,
                controller: _searchTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  
                  )
                ),
              ),
            )
          ],),
        ),
      ),
    );
  }
}

