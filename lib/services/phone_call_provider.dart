import 'package:url_launcher/url_launcher.dart';

class PhoneCallProvider {
  static void phoneCall(String phoneNumber) async {
    if (await canLaunch('tel:' + phoneNumber)) {
      await launch('tel:' + phoneNumber);
    } else
      throw 'could not launch call via phone';
  }
}
