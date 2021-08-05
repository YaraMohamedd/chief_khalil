import 'package:chief_khalil/Controller/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AppLanguage extends GetxController{
  var appLocale='ar';
  @override
  void onInit()async {
    // TODO: implement onInit
    super.onInit();
    LocalStorage localStorage=LocalStorage();
    appLocale= await localStorage.languageSelected==null?'ar': await localStorage.languageSelected;
    Get.updateLocale(Locale(appLocale));
    update();
  }
  void changeLanguage(String type)async{
    LocalStorage localStorage=LocalStorage();
     if(appLocale==type){
      return;
    }
    if(type=='ar'){
      appLocale='ar';
      localStorage.saveLanguageToDisk('ar');
    }else{
      appLocale='en';
      localStorage.saveLanguageToDisk('en');
    }
    update();
  }
}