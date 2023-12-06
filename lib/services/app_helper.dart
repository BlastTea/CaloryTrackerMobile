part of 'services.dart';

class AppHelper {
  static Future<int> getDatabaseVersion() async {
    // ignore: unused_local_variable
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return 1;

    // if (int.tryParse(packageInfo.buildNumber)! <= 9) {
    //   return 1;
    // } else if (int.tryParse(packageInfo.buildNumber)! <= 14) {
    //   return 2;
    // } else if (int.tryParse(packageInfo.buildNumber)! <= 15) {
    //   return 3;
    // }

    // return 4;
  }
}
