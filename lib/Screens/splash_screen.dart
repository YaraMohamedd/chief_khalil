import 'package:chief_khalil/Screens/home_page_screen.dart';
import 'package:chief_khalil/Screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flare_flutter/flare_actor.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}
class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenWidget(),
    );
  }
}
class SplashScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 10,
          backgroundColor: Color(0xFFe1ad01),
          navigateAfterSeconds: SignInScreen(),
          loaderColor: Colors.transparent,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Center(
            //   child: Container(
            //     height: 150,
            //     width: 150,
            //     decoration: BoxDecoration(
            //         image: DecorationImage(
            //             image: AssetImage("assets/khalil.jpg"),
            //             fit: BoxFit.contain
            //         )
            //     ),
            //   ),
            // ),
            Center(
              child: Lottie.network(
                'https://assets2.lottiefiles.com/private_files/lf30_mnqdhisx.json',
                height: 200.0,
                repeat: true,
                reverse: true,
                animate: true,
              ),
            ),
            // Center(
            //   child: Container(
            //     width: 200,
            //     height: 200,
            //     child: FlareActor(
            //       "assets/loading.flr",
            //       animation: "loading",
            //       fit: BoxFit.contain,
            //     ),
            //   ),
            // )
          ],
        ),
      ],
    );
  }
}
