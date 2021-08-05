import 'package:chief_khalil/Widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatefulWidget {
  final String myString;

  const ChangePasswordScreen({Key key, this.myString}) ;
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.myString=='en'?TextDirection.ltr:TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color(0xFF20252B),
          title: Text('Change Password'.tr,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
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
                    margin: EdgeInsets.only(top: 100),
                    child: Text('Change Password'.tr,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Color(0xFFFC834B)),)),
              ),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 60),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Current Password'.tr,
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
                            hintText: 'New Password'.tr,
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
                            hintText: 'Confirm New Password'.tr,
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
                      Container(
                        margin: EdgeInsets.only(top: 20,right: 20,left: 20),
                        width: double.infinity,
                        height: 40,
                        child: RaisedButton(
                          shape: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15)
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
