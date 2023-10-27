import 'package:ektv/screens/video_search_screen.dart';
import 'package:ektv/screens/videoplayer_screen.dart';
import 'package:ektv/services/common_action_service.dart';
import 'package:ektv/services/constant_service.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  Animation<double>? _animatedScale;
  AnimationController? _animController;
  bool _isFetching=true;
  int _currentIndex=0;
  late Size screenSize;
  double _drawerWidth=120;
  List<Map<String,dynamic>> _navIcons=[
    {
      "icon":Icons.all_out,
      "text":"All"
    },
    {
      "icon":Icons.sports_football_outlined,
      "text":"Sports"
    },
    {
      "icon":Icons.money,
      "text":"Business"
    },
    {
      "icon":Icons.newspaper_outlined,
      "text":"News"
    }
  ];
  List<String> _videoTitle=[];
  
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<15;i++){
      _videoTitle.add("Tesla motors 2023 event in los angelos with the CEO Elon musk");   
    }   
    _fetchMoreData();    
    _animController=AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _animatedScale=Tween<double>(begin: 0,end: 1).animate(_animController!);
  }

  @override
  Widget build(BuildContext context) {
    screenSize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("EK-TV Online"),Icon(Icons.circle,color: kRedColor,size:10,),Text(_navIcons[_currentIndex]['text'],style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: kLtBlueolor),)
          ],
        ),
        actions: [
          IconButton(onPressed: ()async{
          String result=await  Navigator.push(context,MaterialPageRoute(builder: (context)=>VideoSearchScreen()));
          if(result.isNotEmpty){
               _fetchMoreData();
          }
          }, icon:Icon(Icons.search_outlined))
        ],
      ),
      drawer: _getNavDrawer(),
      body:Center(
        child: _isFetching?CircularProgressIndicator():ListView.builder(
          itemCount: _videoTitle.length,
          itemBuilder: (context,index){
          var item=_videoTitle[index];
          return GestureDetector(
            onTap: (){
              CommonActions().navigateScreen(context,VideoPlayerScreen());
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
                            children: [
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
      ),
    );
  }
  
  _getNavDrawer() {
    return AnimatedContainer(
        curve: Curves.decelerate,
      duration: Duration(milliseconds: 300),
        width: _drawerWidth,
        child: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20))
          ),
          backgroundColor:kAppColor,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 10,left: 3,right: 3),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              CircleAvatar(radius: 30,backgroundColor: kLtBlueolor, child: Icon(Icons.person_outline_rounded,size: 50,)),
              Padding(
                padding: const EdgeInsets.only(bottom:5.0),
                child: Text("Mfugale",maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: kWhiteColor,fontWeight: FontWeight.bold),),
              ),
              FittedBox(
                child: Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: kBlackColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(blurRadius: 2,color: kWhiteColor)]
                  ),
                  child: Text("Subscribe",style:TextStyle(fontWeight: FontWeight.bold,color:kWhiteColor))),
              ),
              Expanded(child: Stack(
                children: [
                  Container(
                    width: screenSize.width,
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20))
                    ),
                    child: Column(children: [
                   SizedBox(height:15),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:List.generate(_navIcons.length, (index){
                        return GestureDetector(
                          onTap: (){
                             setState(() {
                               _currentIndex=index;
                               _fetchMoreData();
                               Navigator.pop(context);
                             });
                          },
                          child: AbsorbPointer(
                            child: Container(
                              margin:index==0?EdgeInsets.only(bottom: 7):EdgeInsets.symmetric(vertical: 7),
                              padding: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(),
                                color:_currentIndex==index?kBlueGreyColor:kWhiteColor                      ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                 Icon(_navIcons[index]['icon']),
                                 Text(key: ValueKey(2)," "+_navIcons[index]['text'])
                                ],
                              ),),
                          ),
                        );
                      }),
                    )),
                    ],),
                  ),
                  Align(alignment: Alignment.bottomCenter, child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.home_outlined),
                  ))
                ],
              ))
              ],),
            ),
          ),
        ),
      );
  }
}