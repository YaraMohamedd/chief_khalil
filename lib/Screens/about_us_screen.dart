
import 'package:chief_khalil/Responsive/size_helper.dart';
import 'package:chief_khalil/Widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  Locale _appLocale = Locale('ar');
  Locale get appLocal => _appLocale ?? Locale("ar");
  String _selectedLang = 'en';
  SharedPreferences prefs;
  String myString;
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myString = prefs.getString('value');
      print("shared:$myString");
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _loadCounter();
    });
    //  _getPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xFF20252B),
        title: Text(
          'About Us'.tr,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(right: 30, bottom: 10, top: 10, left: 30),
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
        child: Directionality(
          textDirection:
              myString == 'en' ? TextDirection.ltr : TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 30),
                      child: SizeHelper.of(context).helpBuilder(
                          mobileSmall: (width, height) {
                        return Text('About Us'.tr,
                            style: TextStyle(
                                color: Color(0xFF78BF4D),
                                wordSpacing: .3,
                                height: 3,
                                fontWeight: FontWeight.bold,
                                fontSize: 14));
                      }, mobileLarge: (width, height) {
                        return Text('About Us'.tr,
                            style: TextStyle(
                                color: Color(0xFF78BF4D),
                                wordSpacing: .3,
                                height: 6,
                                fontWeight: FontWeight.bold,
                                fontSize: 14));
                      }))),
              Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        'What is Chef Khalil School?'.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ))),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'icons/iconfinder_primitive-dot_298849.svg',
                    width: 10,
                    color: Color(0xFFFC834B),
                  ),
                  title: Text(
                    'We are an enthusiastic team made up of world-class culinary teachers and former executives of culinary schools.'
                        .tr,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'icons/iconfinder_primitive-dot_298849.svg',
                    width: 10,
                    color: Color(0xFFFC834B),
                  ),
                  title: Text(
                    'Together we discover what makes the recipes work, and share what we are learning to help everyone cook with confidence.'
                        .tr,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'icons/iconfinder_primitive-dot_298849.svg',
                    width: 10,
                    color: Color(0xFFFC834B),
                  ),
                  title: Text(
                    'We test cookware and ingredients to find the best quality dishes and recipes for all students.'
                        .tr,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'icons/iconfinder_primitive-dot_298849.svg',
                    width: 10,
                    color: Color(0xFFFC834B),
                  ),
                  title: Text(
                    'We rely on an exceptional group of international employees and chefs.'
                        .tr,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'icons/iconfinder_primitive-dot_298849.svg',
                    width: 10,
                    color: Color(0xFFFC834B),
                  ),
                  title: Text(
                    'We have a group of chefs and staff who bring a wealth of skills, ideas, personal experiences and multicultural perspectives.'
                        .tr,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Text(
                        'About Us'.tr,
                        style: TextStyle(
                            color: Color(0xFFFC834B),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ))),
              Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        'What is Chef Khalil School?'.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ))),
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: ListTile(
                          subtitle: Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                'We are always keen to use the highest international standards and focus on basic techniques while developing course curricula that provide students with complete information to master the correct technique for the recipe in addition to that students receive constant instructions and support from the chef.'
                                    .tr,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              )),
                          title: Text(
                            'Use of the highest cooking standards'.tr,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          trailing: SvgPicture.asset(
                            'icons/iconfinder_trophy_1608962.svg',
                            width: 49,
                            height: 44,
                            color: Color(0xFF78BF4D),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 10),
                        child: ListTile(
                          subtitle: Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                'We are a team made up of world-class chef teachers and former executives of culinary schools dedicated to teaching cooking techniques to our students across the Arab world - completely online. Additionally, we offer traditional or vegetarian content preferences.'
                                    .tr,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              )),
                          title: Text(
                            'Trained by professional chefs'.tr,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          trailing: SvgPicture.asset(
                            'icons/iconfinder_group_1608916.svg',
                            width: 49,
                            height: 44,
                            color: Color(0xFF78BF4D),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: ListTile(
                          subtitle: Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                'Gain confidence in your cooking abilities and become a professional chef, learn how to make different dishes easily for life. Learn to cook in the comfort of your home, participate in the professional cooking course offered by the School of Chef Khalil, enhance your abilities and have more confidence every time you apply a new recipe, learn professional cooking methods and secrets that make you a skilled chef.'
                                    .tr,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              )),
                          title: Text(
                            'Enhance your cooking skills for life'.tr,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          trailing: SvgPicture.asset(
                            'icons/iconfinder_hourglass-half_1608367.svg',
                            width: 49,
                            height: 44,
                            color: Color(0xFF78BF4D),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 12),
                child: Center(
                  child: Text(
                    '© all rights reserved to chef khalil school'.tr,
                    style: TextStyle(fontSize: 18),
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
