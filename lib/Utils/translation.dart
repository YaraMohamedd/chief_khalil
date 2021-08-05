
import 'package:chief_khalil/Utils/langs/ar.dart';
import 'package:chief_khalil/Utils/langs/en.dart';
import 'package:get/get.dart';

class Translation extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en':en,
    'ar':ar
  };
}