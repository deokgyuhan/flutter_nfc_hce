import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_nfc_hce_platform_interface.dart';

/// An implementation of [FlutterNfcHcePlatform] that uses method channels.
class MethodChannelFlutterNfcHce extends FlutterNfcHcePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_nfc_hce');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}