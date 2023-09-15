import 'flutter_nfc_hce_platform_interface.dart';

class FlutterNfcHce {
  Future<String?> getPlatformVersion() {
    return FlutterNfcHcePlatform.instance.getPlatformVersion();
  }

  Future<String?> startNfcHce(
      String content, {
        String mimeType = 'text/plain',
      }) {
    return FlutterNfcHcePlatform.instance.startNfcHce(content, mimeType);
  }

  Future<void> stopNfcHce() async {
    await FlutterNfcHcePlatform.instance.stopNfcHce();
  }

  Future<bool> isNfcHceSupported() async {
    return await FlutterNfcHcePlatform.instance.isNfcHceSupported() == 'true';
  }

  /// Below sdk 29 (Android 10) it always returns false
  Future<bool> isSecureNfcEnabled() async {
    return await FlutterNfcHcePlatform.instance.isSecureNfcEnabled() == 'true';
  }

  Future<bool> isNfcEnabled() async {
    return await FlutterNfcHcePlatform.instance.isNfcEnabled() == 'true';
  }
}
