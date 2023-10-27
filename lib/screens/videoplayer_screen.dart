import 'package:ektv/services/common_action_service.dart';
import 'package:ektv/services/constant_service.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
 bool _isFetching=true;
 List<String> _videoTitle=[];
 YoutubePlayerController _playerController=YoutubePlayerController(
    initialVideoId:"5RRmepp7i5g",
    flags:const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
    ),
   );

  void _fetchMoreData(){
    if(_isFetching==false){
        setState(() {
          _isFetching=true;
        });
    }
    Future.delayed(Duration(seconds: 3),(){
       setState(() {
         _isFetching=false;
       });
    });
  }

  // void _initVideoController(String videoId){
  //   _playerController = YoutubePlayerController(
  //   initialVideoId: videoId,
  //   flags: YoutubePlayerFlags(
  //       autoPlay: true,
  //       mute: false,
  //   ),
  //  );
  // }

  @override
  void initState() {
    // TODO: implement initState
    for(int i=0;i<15;i++){
      _videoTitle.add("Tesla motors 2023 event in los angelos with the CEO Elon musk");   
    }
    _fetchMoreData();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: ()async{
        return true;
      },
      child: Scaffold(
        backgroundColor: kBlackColor,
        body: SafeArea(
          child: Container(
            color: kWhiteColor,
            child: YoutubePlayerBuilder(
             player: YoutubePlayer(
             controller: _playerController,
              ),
             builder: (context, player){
            return Column(
                children: [
                  player,
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(_videoTitle[0]),
                  ),
                  Expanded(child: Center(
              child: _isFetching?CircularProgressIndicator():ListView.builder(
                itemCount: _videoTitle.length,
                itemBuilder: (context,index){
                var item=_videoTitle[index];
                return GestureDetector(
                onTap: (){
                  setState((){
                    _fetchMoreData();
                  });
                },
                child: AbsorbPointer(
                  child: Container(
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 16/9,
                          child: Image.asset("assets/images/elontesla.jpg",fit: BoxFit.cover,)),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              CircleAvatar(radius: 20,backgroundColor: kLtBlueolor, child: Icon(Icons.person_outline_rounded,size: 20,)),
                              SizedBox(width: 5,),Expanded(child: Column(
                                children:[
                                  Text(item.toUpperCase(),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        child: Text("Ek tv online",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                                        )),SizedBox(width:10),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        child: Text("3k Views",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                                        )),Spacer(),
                                        Container(
                                        padding: EdgeInsets.all(5),
                                        child: Text("3 weeks",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                                        ))
                                    ],
                                  )
                                ],
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
              }),
            ),)
                ],
              );
             }
            ),
          ),
        ),
      ),
    );
  }
}