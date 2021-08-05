import 'package:chief_khalil/Models/live_stream_model.dart';
import 'package:flutter/material.dart';
import 'package:chief_khalil/Widgets/my_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';
class LiveScreen extends StatefulWidget {
  @override
  _LiveScreenState createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  YoutubePlayerController _controller;
   TextEditingController _idController;
 TextEditingController _seekToController;

   PlayerState _playerState;
 YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;



  @override
  void initState() {
    super.initState();
    // _controller = YoutubePlayerController(
    //   initialVideoId: 'gQDByCdjUXw', // id youtube video
    //   flags: YoutubePlayerFlags(
    //     isLive: true,
    //         forceHD: false,
    //         loop: false,
    //     autoPlay: false,
    //     mute: false,
    //         enableCaption: true,
    //   ),
    //
    // );
    // _controller = YoutubePlayerController(
    //   initialVideoId: _ids.first,
    //   flags: const YoutubePlayerFlags(
    //     mute: false,
    //     autoPlay: true,
    //     disableDragSeek: false,
    //     loop: false,
    //     isLive: true,
    //     forceHD: false,
    //     enableCaption: true,
    //
    //   ),
    // )..addListener(listener);
    // _idController = TextEditingController();
    // _seekToController = TextEditingController();
    // _videoMetaData = const YoutubeMetaData();
    // _playerState = PlayerState.unknown;
  }

  // void listener() {
  //   if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
  //     setState(() {
  //       _playerState = _controller.value.playerState;
  //       _videoMetaData = _controller.metadata;
  //     });
  //   }
  // }
  Future getToplives() async {
    var Api = Uri.parse(
        "https://chefkhalil.com/api/streams");
    final response = await http.get(Api);
    if (response.statusCode == 200) {
      final liveModel = liveFromJson(response.body);
      return liveModel;
    } else {
      throw Exception('Error');
    }
  }
  String myString;

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myString = prefs.getString('value');
      print("shared:$myString");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: myString=='en'?TextDirection.ltr:TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Today'.tr,
                ),
                Tab(
                  text: 'Coming'.tr,
                ),
                Tab(
                  text: 'Finished'.tr,
                ),
              ],
            ),
            toolbarHeight: 100,
            backgroundColor: Color(0xFF20252B),
            title: Text(
              'All Live Stream'.tr,
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 30, bottom: 10, top: 10, left: 30),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/khalil.jpg',
                    )),
              )
            ],
          ),
          drawer: MyDrawer(),
          body: TabBarView(
            children: [
              FutureBuilder(
                future: getToplives(),
                  builder: (context,snapshot){
                  if(snapshot.hasData){
           LiveStream livestream     =  snapshot.data;
            return SizedBox(
              height: MediaQuery.of(context).size.height*1.5,
              child: ListView.builder(
                itemCount: livestream.data.streams.finishedStreams.length,
                  itemBuilder: (context,index){

                 return Column(
                   children: [
                     Card(
                       elevation: 3,
                       child: Column(
                         children: [
                                 YoutubePlayer(
                                   liveUIColor: Colors.red,
                                   controller: YoutubePlayerController(
                                     initialVideoId:YoutubePlayer.convertUrlToId('${livestream.data.streams.finishedStreams[index].url}') , // id youtube video
                                     flags: YoutubePlayerFlags(
                                       isLive: true,
                                       forceHD: false,
                                       loop: false,
                                       autoPlay: false,
                                       mute: false,
                                       enableCaption: true,
                                     ),
                                   ),
                                   //showVideoProgressIndicator: true,
                                   progressIndicatorColor: Colors.red,
                                   bottomActions: [
                                     CurrentPosition(),
                                     ProgressBar(isExpanded: true),
                                    // TotalDuration(),
                                   ], // liveUIColor: Colors.amber,
                                 ),
                           myString=='en'? Text('${livestream.data.streams.finishedStreams[index].titleEn}'):Text('${livestream.data.streams.finishedStreams[index].titleAr}'),
                           myString=='en'? Text('${livestream.data.streams.finishedStreams[index].categoryNameEn}'):Text('${livestream.data.streams.finishedStreams[index].categoryNameAr}'),
                           myString=='en'? Text('${livestream.data.streams.finishedStreams[index].descriptionEn}'):Text('${livestream.data.streams.finishedStreams[index].descriptionAr}'),
                         ],
                       ),
                     ),
                     Divider()
                   ],
                 );
              }),
            );
                  }else{
                    return Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: CircularProgressIndicator(
                          backgroundColor: Color(0xFFFC834B),
                        color: Colors.white,
                      ),
                    );
                  }
              }),
              FutureBuilder(
                  future: getToplives(),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      LiveStream livestream     =  snapshot.data;
                      return SizedBox(
                        height: MediaQuery.of(context).size.height*1.5,
                        child: ListView.builder(
                            itemCount: livestream.data.streams.comingStreams.length,
                            itemBuilder: (context,index){

                              return Column(
                                children: [
                                  Card(
                                    elevation: 3,
                                    child: Column(
                                      children: [
                                        YoutubePlayer(
                                          liveUIColor: Colors.red,
                                          controller: YoutubePlayerController(
                                            initialVideoId:YoutubePlayer.convertUrlToId('${livestream.data.streams.comingStreams[index].url}') , // id youtube video
                                            flags: YoutubePlayerFlags(
                                              isLive: true,
                                              forceHD: false,
                                              loop: false,
                                              autoPlay: false,
                                              mute: false,
                                              enableCaption: true,
                                            ),
                                          ),
                                          //showVideoProgressIndicator: true,
                                          progressIndicatorColor: Colors.red,
                                          bottomActions: [
                                            CurrentPosition(),
                                            ProgressBar(isExpanded: true),
                                            // TotalDuration(),
                                          ], // liveUIColor: Colors.amber,
                                        ),
                                        myString=='en'? Text('${livestream.data.streams.comingStreams[index].titleEn}'):Text('${livestream.data.streams.comingStreams[index].titleAr}'),
                                        myString=='en'? Text('${livestream.data.streams.comingStreams[index].categoryNameEn}'):Text('${livestream.data.streams.comingStreams[index].categoryNameAr}'),
                                        myString=='en'? Text('${livestream.data.streams.comingStreams[index].descriptionEn}'):Text('${livestream.data.streams.comingStreams[index].descriptionAr}'),
                                      ],
                                    ),
                                  ),
                                  Divider()
                                ],
                              );
                            }),
                      );
                    }else{
                      return CircularProgressIndicator(
                          backgroundColor: Color(0xFFFC834B),
                        color: Colors.white,
                      );
                    }
                  }),
              FutureBuilder(
                  future: getToplives(),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      LiveStream livestream     =  snapshot.data;
                      return SizedBox(
                        height: MediaQuery.of(context).size.height*1.5,
                        child: ListView.builder(
                            itemCount: livestream.data.streams.todayStreams.length,
                            itemBuilder: (context,index){
                              return Column(
                                children: [
                                  Card(
                                    elevation: 3,
                                    child: Column(
                                      children: [
                                        YoutubePlayer(
                                          liveUIColor: Colors.red,
                                          controller: YoutubePlayerController(
                                            initialVideoId:YoutubePlayer.convertUrlToId('${livestream.data.streams.todayStreams[index].url}') , // id youtube video
                                            flags: YoutubePlayerFlags(
                                              isLive: true,
                                              forceHD: false,
                                              loop: false,
                                              autoPlay: false,
                                              mute: false,
                                              enableCaption: true,
                                            ),
                                          ),
                                          //showVideoProgressIndicator: true,
                                          progressIndicatorColor: Colors.red,
                                          bottomActions: [
                                            CurrentPosition(),
                                            ProgressBar(isExpanded: true),
                                            // TotalDuration(),
                                          ], // liveUIColor: Colors.amber,
                                        ),
                                        myString=='en'? Text('${livestream.data.streams.todayStreams[index].titleEn}'):Text('${livestream.data.streams.todayStreams[index].titleAr}'),
                                        myString=='en'? Text('${livestream.data.streams.todayStreams[index].categoryNameEn}'):Text('${livestream.data.streams.todayStreams[index].categoryNameAr}'),
                                        myString=='en'? Text('${livestream.data.streams.todayStreams[index].descriptionEn}'):Text('${livestream.data.streams.todayStreams[index].descriptionAr}'),
                                      ],
                                    ),
                                  ),
                                  Divider()
                                ],
                              );
                            }),
                      );
                    }else{
                      return Padding(
                        padding: const EdgeInsets.all(200.0),
                        child: CircularProgressIndicator(
                            backgroundColor: Color(0xFFFC834B),
                          color: Colors.white,
                        ),
                      );
                    }
                  }),
              // Icon(Icons.directions_car, size: 350),
            ],
          ),
        ),
      ),
    );
    //   body: FutureBuilder(
    //     future: getToplives(),
    //     builder: (context,snapshot){
    //       if(snapshot.hasData){
    // LiveStream liveStream= snapshot.data;
    // return SizedBox(
    //   height: MediaQuery.of(context).size.height*1.5,
    //   width: double.infinity,
    //   child: ListView.builder(
    //     itemCount: liveStream.data.streams.,
    //     itemBuilder: (context,index){
    //
    //     },
    //   ),
    // );
    //       }else{
    //         return Center(child: CircularProgressIndicator());
    //       }
    //     },
    //   ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       YoutubePlayer(
      //         liveUIColor: Colors.amber,
      //         controller: _controller,
      //                //showVideoProgressIndicator: true,
      //         progressIndicatorColor: Colors.red,
      //         bottomActions: [
      //           CurrentPosition(),
      //           ProgressBar(isExpanded: true),
      //          // TotalDuration(),
      //         ], // liveUIColor: Colors.amber,
      //       ),
      //     ],
      //   ),
      // ),


  }
}
