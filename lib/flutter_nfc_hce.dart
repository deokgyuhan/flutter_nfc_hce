
import 'flutter_nfc_hce_platform_interface.dart';

class FlutterNfcHce {
  Future<String?> getPlatformVersion() {
    return FlutterNfcHcePlatform.instance.getPlatformVersion();
  }

  Future<String?> startNfcHce(String content) {
    return FlutterNfcHcePlatform.instance.startNfcHce(content);
  }

  Future<String?> isSupportNfcHceFeature() {
    return FlutterNfcHcePlatform.instance.isSupportNfcHceFeature();
  }

  Future<String?> isSupportSecureNfcSupported() {
    return FlutterNfcHcePlatform.instance.isSupportSecureNfcSupported();
  }

  Future<String?> isNfcEnable() {
    return FlutterNfcHcePlatform.instance.isNfcEnable();
  }
}
