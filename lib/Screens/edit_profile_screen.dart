import 'package:chief_khalil/Widgets/my_drawer.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class EditProfileScreen extends StatefulWidget {
  final String myString;

  const EditProfileScreen({Key key, this.myString});
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.myString=='en'?TextDirection.ltr:TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color(0xFF20252B),
          title: Text('Edit Profile'.tr,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30, bottom: 10, top: 10,left: 30),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/khalil.jpg',
                  )),
            )
          ],
        ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Edit Profile Details'.tr,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Color(0xFFFC834B)),),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset('icons/iconfinder_pencil-writing-write-edit-pen_3643749.svg',width:21,color: Color(0xFFFC834B),),
                        ),
                      ],
                    )),
              ),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Hossam',

                            hintStyle: TextStyle(fontSize: 14,),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),

                            )
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Essam ',

                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),

                            )
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'male'.tr,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(13.0),

                            ),
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),

                            )
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'hossamessam@gmail.com',
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(15.0),

                            ),
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),

                            )
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: '0100 200 3004',
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(15.0),

                            ),
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),

                            )
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Egypt'.tr,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(13.0),

                            ),
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),

                            )
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Password'.tr,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(15.0),

                            ),
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),

                            )
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 20,right: 20,left: 20),
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFFFC834B),

                          ),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: RaisedButton(
                          color: Colors.white,
                          shape: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          onPressed: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                          },

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Profile Image'.tr,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset('icons/iconfinder_upload_2561491.svg',width:30,color: Color(0xFFFC834B),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 10),
                        width: double.infinity,
                        height: 40,
                        child: RaisedButton(
                          shape: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                          ),
                          onPressed: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                          },
                          color: Color(0xFFFC834B),
                          child: Text('Save Changes'.tr,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        ),
                      ),



                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
