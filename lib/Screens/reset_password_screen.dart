import 'dart:async';
import 'dart:convert';
import 'package:chief_khalil/Clippers/wave_clipper_path.dart';
import 'package:chief_khalil/Screens/sign_in_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart'as http;
import 'package:chief_khalil/Clippers/rounded_clipper.dart';
import 'package:chief_khalil/Services/api_links.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class ResetPasswordScreen extends StatefulWidget {
  final UserEmail args;
  ResetPasswordScreen({this.args}) ;
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String _email,_password,_passwordconfirm;
  TextEditingController passController = TextEditingController();
  TextEditingController passConfController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType> errorController;
  Future resetPass()  async{
    var APIURL = Uri.parse(AppUrl.resetPassword);
    Map mapData ={
      "email":widget.args.email,
      "code":codeController.text,
      "new_password":passController.text,
    };
    http.Response response = await http.post(APIURL,body:mapData);
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
      print(data);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor:Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                ClipPath(
                    clipper: BottomWaveClipper(),
                    child: Container(
                      color: Color(0xFFFC834B),
                      height: 300,
                      width: double.infinity,
                    )
                ),
                Transform.translate(
                  offset: Offset(60,60),
                  child: Column(
                    children: [
                      Text(
                        'كود التحقق',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffffffff),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'ارسلنا لك كود التحقق على هاتفك',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 16,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${widget.args.email}أرسل إلي ',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 16,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: PinCodeTextField(
                      controller: codeController,
                      appContext: context,
                      cursorColor:Color(0xffF2AE2F),
                      showCursor: true,
                      animationDuration: Duration(milliseconds: 300),
                      autoDismissKeyboard: true,
                      errorAnimationController: errorController,
                      keyboardType: TextInputType.number,
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      boxShadows: [
                        BoxShadow(

                          // offset: Offset(2,4),
                          // color: Colors.white54,
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        )
                      ],
                      length: 5,
                      onChanged: (value) {
                        print(value);
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,

                        inactiveColor:  Color(0xffF2AE2F),
                        activeColor:  Color(0xffF2AE2F),
                        selectedColor:  Color(0xffF2AE2F),

                      ),
                      // onCompleted: (value){
                      //   if(value == requiredNumber){
                      //     print('valid pin');
                      //   } else {
                      //     print('invalid pin');
                      //   }
                      // },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                      color: Colors.grey.withOpacity(.3),
                    ),
                    child: TextFormField(
                      controller: passController,
                      onSaved: (value){
                        _password=value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return '*Required';
                        }
                        return null ;
                      },
                      decoration: InputDecoration(
                          hintText: 'new password',
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SvgPicture.asset('icons/iconfinder_mail_115714.svg',width:3,color: Color(0xFF8A8A8A),),
                          ),
                          hintStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
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
                        if(_formKey.currentState.validate()){
                         resetPass();
                        }
                      },

                      color: Color(0xFFFC834B),
                      child: Text('Log In',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'لم يصلك الكود بعد ؟',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 14,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  GestureDetector(
                    onTap: (){
                      scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text("تم إعاده إرسال كود التحقيق إلي حسابك"),
                        duration: Duration(seconds: 2),
                      ));
                    },
                    child: Text(
                      'أضغط هنا لإعاده الإرسال',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 14,
                          color: const Color(0xff000000),
                          decoration: TextDecoration.underline
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            // Theme(
            //   data: Theme.of(context).copyWith(accentColor: Colors.white),
            //   child: CircularProgressIndicator(
            //     backgroundColor: Color(0xffF2AE2F),
            //   ),
            // ),// wait text
          ],
        ),
      ),
    );
  }
}
class UserEmail {
  final String email ;
  UserEmail(this.email);
}