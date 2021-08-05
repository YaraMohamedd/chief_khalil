import 'package:chief_khalil/Screens/test_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationPageView extends StatelessWidget {
  final double height;
VerificationPageView({Key key, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
return Scaffold(
  backgroundColor:Color(0xffffffff),
  body: Column(
    children: <Widget>[
      Stack(
        children: [
          ClipPath(
              clipper: RoundedClipper(400),
              child: Container(
                color: Color(0xffF2AE2F),
                height: 300,
                width: double.infinity,
              )
          ),
    Transform.translate(
      offset: Offset(120,110),
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
              'ارسل الى (01068938890) ',
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

      Padding(
        padding: const EdgeInsets.all(30.0),
        child: PinCodeTextField(
          appContext: context,
          cursorColor:Color(0xffF2AE2F),
          showCursor: false,
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
          length: 6,
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
            Text(
              'برجاء الانتظار',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 14,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
      CircularProgressIndicator(
        backgroundColor: Colors.orange,
      ),// wait text
      SizedBox(
        width: 177.0,
        height: 30.0,
      ),
    ],
  ),
);
  }
}

// return Scaffold(
//   backgroundColor: const Color(0xffffffff),
//   body: Stack(
//     children: <Widget>[
//       ClipPath(
//           clipper: RoundedClipper(),
//           child: Container(
//             color: Colors.orange,
//             height: 300,
//             width: double.infinity,
//           )
//       ),
//       Transform.translate(
//         offset: Offset(94.0, 319.0),
//         child: Container(
//           height: 50,
//           width: 49,
//           decoration: BoxDecoration(
//             border: Border.all(color: Color(0xff9EA2AD).withOpacity(0.3)),
//             color: Colors.white,
//             borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
//                 topRight: Radius.circular(10),
//                 bottomLeft: Radius.circular(10),
//                 bottomRight: Radius.circular(10)),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 2,
//                 blurRadius: 6,
//                 offset: Offset(0, 3), // changes position of shadow
//               ),
//             ],
//           ),
//           child: Center(
//             child: Text(
//               '1',
//               style: TextStyle(
//                 fontFamily: 'Cairo',
//                 fontSize: 16,
//                 color: const Color(0xff707070),
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ), //Number 1 box
//       Transform.translate(
//         offset: Offset(153.0, 319.0),
//         child: Container(
//           height: 50,
//           width: 49,
//           decoration: BoxDecoration(
//             border: Border.all(color: Color(0xff9EA2AD).withOpacity(0.3)),
//             color: Colors.white,
//             borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
//                 topRight: Radius.circular(10),
//                 bottomLeft: Radius.circular(10),
//                 bottomRight: Radius.circular(10)),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 2,
//                 blurRadius: 6,
//                 offset: Offset(0, 3), // changes position of shadow
//               ),
//             ],
//           ),
//           child: Center(
//             child: Text(
//               '2',
//               style: TextStyle(
//                 fontFamily: 'Cairo',
//                 fontSize: 16,
//                 color: const Color(0xff707070),
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ), //Number 2 box
//       Transform.translate(
//         offset: Offset(212.0, 319.0),
//         child: Container(
//           height: 50,
//           width: 49,
//           decoration: BoxDecoration(
//             border: Border.all(color: Color(0xff9EA2AD).withOpacity(0.3)),
//             color: Colors.white,
//             borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
//                 topRight: Radius.circular(10),
//                 bottomLeft: Radius.circular(10),
//                 bottomRight: Radius.circular(10)),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 2,
//                 blurRadius: 6,
//                 offset: Offset(0, 3), // changes position of shadow
//               ),
//             ],
//           ),
//           child: Center(
//             child: Text(
//               '3',
//               style: TextStyle(
//                 fontFamily: 'Cairo',
//                 fontSize: 16,
//                 color: const Color(0xff707070),
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ), //Number 3 box
//       Transform.translate(
//         offset: Offset(271.0, 319.0),
//         child: Container(
//           height: 50,
//           width: 49,
//           decoration: BoxDecoration(
//             border: Border.all(color: Color(0xff9EA2AD).withOpacity(0.3)),
//             color: Colors.white,
//             borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
//                 topRight: Radius.circular(10),
//                 bottomLeft: Radius.circular(10),
//                 bottomRight: Radius.circular(10)),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 2,
//                 blurRadius: 6,
//                 offset: Offset(0, 3), // changes position of shadow
//               ),
//             ],
//           ),
//           child: Center(
//             child: Text(
//               '4',
//               style: TextStyle(
//                 fontFamily: 'Cairo',
//                 fontSize: 16,
//                 color: const Color(0xff707070),
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ), //Number 4 box
//       Transform.translate( // Circular Indicator
//         offset: Offset(190.0, 450.0),
//         child: SizedBox(
//           width: 50.0,
//           height: 50.0,
//           child: Stack( // Circular Indicator
//             children: <Widget>[
//               Theme(
//                   data: Theme.of(context).copyWith(accentColor: Color(0xffF2AE2F)),
//                   child: CircularProgressIndicator(backgroundColor: Color(0xffE4E4E4))),
//             ],
//           ),
//         ),
//       ), //Circular indicator
//       Transform.translate(
//         offset: Offset(0,-450),
//         child: Container(
//           width:MediaQuery.of(context).size.width,
//           decoration: new BoxDecoration(
//             color: Color(0xffF2AE2F),
//             borderRadius:
//             BorderRadius.all(Radius.elliptical(300,170)),
//           ),
//         ),
//       ), // Orange Circle
//       Transform.translate(
//         offset: Offset(100,130),
//         child: Column(
//           children: [
//             Text(
//               'كود التحقق',
//               style: TextStyle(
//                 fontFamily: 'Cairo',
//                 fontSize: 21,
//                 fontWeight: FontWeight.w600,
//                 color: const Color(0xffffffff),
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'ارسلنا لك كود التحقق على هاتفك',
//               style: TextStyle(
//                 fontFamily: 'Cairo',
//                 fontSize: 16,
//                 color: const Color(0xffffffff),
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'ارسل الى (01068938890) ',
//               style: TextStyle(
//                 fontFamily: 'Cairo',
//                 fontSize: 16,
//                 color: const Color(0xff000000),
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ), // Orange Circle Text
//       Transform.translate(
//         offset: Offset(175,520),
//         child: Text(
//           'برجاء الانتظار',
//           style: TextStyle(
//             fontFamily: 'Cairo',
//             fontSize: 14,
//             color: const Color(0xff000000),
//           ),
//           textAlign: TextAlign.left,
//         ),
//       ), // wait text
//       Transform.translate(
//         offset: Offset(99.0, 199.0),
//         child: SizedBox(
//           width: 177.0,
//           height: 30.0,
//         ),
//       ),
//     ],
//   ),
// );