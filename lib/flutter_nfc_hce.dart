
import 'flutter_nfc_hce_platform_interface.dart';

class FlutterNfcHce {
  Future<String?> getPlatformVersion() {
    return FlutterNfcHcePlatform.instance.getPlatformVersion();
  }
}
