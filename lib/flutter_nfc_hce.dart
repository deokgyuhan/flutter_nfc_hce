
import 'flutter_nfc_hce_platform_interface.dart';

class FlutterNfcHce {
  Future<String?> getPlatformVersion() {
    return FlutterNfcHcePlatform.instance.getPlatformVersion();
  }
  Future<String?> startNfcHce(String content) {
    return FlutterNfcHcePlatform.instance.startNfcHce(content);
  }
}
