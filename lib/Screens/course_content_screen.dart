
import 'package:chief_khalil/Screens/contact_us_screen.dart';
import 'package:chief_khalil/Widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class CourseContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xFF20252B),
        title: Text('Course Content ',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 30),
            child: Image.asset('assets/logo.png',height: 20,width: 50,),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 40,left: 20,right: 20,),
              child: Stack(
                children: [
                  Image.asset('assets/meat.jpg',fit: BoxFit.cover,),
                  Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Container(
                           margin: EdgeInsets.only(left: 20),
                           child: Row(
                             children: [
                               SvgPicture.asset('icons/iconfinder_icon-play_211876.svg',width: 15,color: Colors.white,),
                               Text('0:00 / 3:09',style: TextStyle(color: Colors.white,fontSize: 9),)
                             ],
                           ),
                         ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('icons/iconfinder_volume-sound-speaker-lound_2203528.svg',width: 12,color: Colors.white,),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                                child: SvgPicture.asset('icons/iconfinder_fullscreen_expand_maximize_full_screen_3994367.svg',width: 12,color: Colors.white,)),
                            Container(
                                margin: EdgeInsets.only(left: 20),
                                child: SvgPicture.asset('icons/iconfinder_-_Dot-More-Vertical-Menu_3844442.svg',width: 15,color: Colors.white,)),

                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.27,left: 10,right: 10),
                    child: Divider(
                      color: Color(0xFFFFF6F6),
                      thickness: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 44,
              color: Color(0xFF202020),
              margin: EdgeInsets.only(left: 20,right: 20,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Meat - Level 1 Course Playlist',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('icons/iconfinder_icon-ios7-arrow-down_211687.svg',width: 20,color: Colors.white,),
                  )

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,),

              color: Color(0xFF2F2F2F),
              width: double.infinity,
              height: MediaQuery.of(context).size.height*.25,
              child: Column(
                children: [
              ListTile(
                leading: Image.asset('assets/valeriy.jpg',width: 52,),
                title: Text('Meat Level 1 - Lesson 1, How to Cut the meat',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
              ),
                  ListTile(
                    leading: Image.asset('assets/sam.jpg',width: 52,),
                    title: Text('Meat Level 1 - Lesson 2, How to do the ....',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                  ),
                  ListTile(
                    leading: Image.asset('assets/meat.jpg',width: 52,),
                    title: Text('Meat Level 1 - Lesson 3, starting to get craz....',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
            Container(

              height: MediaQuery.of(context).size.height*.2,
              margin: EdgeInsets.only(top: 20,left: 20,right: 20,),
              child: Card(
                elevation: 3,
                color: Color(0xFFFAFAFA),
                child: Column(
                  children: [
                   Text('Meat Level 1 - Lesson 1 How to Cut the Meat',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
                    Padding(
                      padding: const EdgeInsets.only(top: 8,left: 10,right: 10),
                      child: Divider(
                        color: Color(0xFF9A9A9A),
                        thickness:1,
                      ),
                    ),
                    ListTile(
                      title: Text('Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sequi itaque dolore delectus ipsa nostrum expedita beatae dicta tempore quo minima temporibus alias architecto ratione at, voluptate repellat minus incidunt sapiente!',style: TextStyle(fontSize: 14),),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20,right: 20,left: 20),
              width: double.infinity,
              height: 37,
              child: RaisedButton(
                shape: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15)
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactUsScreen()));
                },
                color: Color(0xFFFC834B),
                child: Text('Download Certificate',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*.86,
              width: double.infinity,
              margin: EdgeInsets.only(top: 20,left: 20,right: 20),
              child: Card(
                elevation: 4,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                      child: Row(
                        children: [
                          Text('5 Comments in this Topic:',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/wonderlane.jpg',),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            // height: double.infinity,
                            // width: double.infinity,
                            child: Column(
                              children: [
                                Text('Etta Francis',style: TextStyle(color: Color(0xFF484848),fontSize: 12),),
                                Text('19 Jan. 18',style: TextStyle(color: Color(0xFF78BF4D),fontSize: 11),),

                              ],
                            ),
                          ),
                        ],
                      ),

                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 50,),
                          child: ListTile(
                            title: Text('Etiam pharetra massa auctor, accumsan arcu ut, placerat ipsum. Nunc vitae tincidunt lorem. Fusce condimentum.',style: TextStyle(fontSize: 12,color: Colors.black),),

                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 80,),
                            child: SvgPicture.asset('icons/iconfinder_icons_Message_1564513.svg',width: 20,color: Color(0xFFFC834B),))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/wonderlane.jpg',),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            // height: double.infinity,
                            // width: double.infinity,
                            child: Column(
                              children: [
                                Text('Etta Francis',style: TextStyle(color: Color(0xFF484848),fontSize: 12),),
                                Text('19 Jan. 18',style: TextStyle(color: Color(0xFF78BF4D),fontSize: 11),),

                              ],
                            ),
                          ),
                        ],
                      ),

                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 50,),
                          child: ListTile(
                            title: Text('Etiam pharetra massa auctor, accumsan arcu ut, placerat ipsum. Nunc vitae tincidunt lorem. Fusce condimentum.',style: TextStyle(fontSize: 12,color: Colors.black),),

                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 80,),
                            child: SvgPicture.asset('icons/iconfinder_icons_Message_1564513.svg',width: 20,color: Color(0xFFFC834B),))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/wonderlane.jpg',),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            // height: double.infinity,
                            // width: double.infinity,
                            child: Column(
                              children: [
                                Text('Etta Francis',style: TextStyle(color: Color(0xFF484848),fontSize: 12),),
                                Text('19 Jan. 18',style: TextStyle(color: Color(0xFF78BF4D),fontSize: 11),),

                              ],
                            ),
                          ),
                        ],
                      ),

                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 50,),
                          child: ListTile(
                            title: Text('Etiam pharetra massa auctor, accumsan arcu ut, placerat ipsum. Nunc vitae tincidunt lorem. Fusce condimentum.',style: TextStyle(fontSize: 12,color: Colors.black),),

                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 80,),
                            child: SvgPicture.asset('icons/iconfinder_icons_Message_1564513.svg',width: 20,color: Color(0xFFFC834B),))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/wonderlane.jpg',),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            // height: double.infinity,
                            // width: double.infinity,
                            child: Column(
                              children: [
                                Text('Etta Francis',style: TextStyle(color: Color(0xFF484848),fontSize: 12),),
                                Text('19 Jan. 18',style: TextStyle(color: Color(0xFF78BF4D),fontSize: 11),),

                              ],
                            ),
                          ),
                        ],
                      ),

                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 50,),
                          child: ListTile(
                            title: Text('Etiam pharetra massa auctor, accumsan arcu ut, placerat ipsum. Nunc vitae tincidunt lorem. Fusce condimentum.',style: TextStyle(fontSize: 12,color: Colors.black),),

                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 80,),
                            child: SvgPicture.asset('icons/iconfinder_icons_Message_1564513.svg',width: 20,color: Color(0xFFFC834B),))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20,left: 30,right: 20),
              child: Row(
                children: [
                  Text('Write Feedback Now:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.withOpacity(.3)
                )
              ),
              margin: EdgeInsets.only(top: 20,left: 20,right: 20),
              child: TextFormField(
               decoration: InputDecoration(
                 hintText: 'Your Comment......',
                 hintStyle: TextStyle(color: Color(0xFF7C7C7C),fontSize: 12),
                 border: OutlineInputBorder(
                   borderSide: BorderSide.none
                 )
               ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40,bottom: 12),
              child: Text('© all rights reserved to Chef khalil-school | Developed by WE Group',style: TextStyle(fontSize: 12),),
            )
          ],
        ),
      ),
    );
  }
}
