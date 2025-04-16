import 'dart:io';

class AdHelper{
  static String get bannerAdUnitId{
    if(Platform.isAndroid){
      return "ca-app-pub-4271371601730805/2695896192";
    }
    else if(Platform.isIOS){
      return "ca-app-pub-4271371601730805/3817406173";
    }
    else{
      throw UnsupportedError('Unsupported Platform');
    }
  }

   static String get rewardAdUnit {
    if (Platform.isAndroid) {
      return "ca-app-pub-4271371601730805/5199842430";
    } else if (Platform.isIOS) {
      return "ca-app-pub-4271371601730805/4606909511";
    } else {
      throw UnsupportedError('Unsupported Platform');
    }
  }
}