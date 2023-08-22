import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_nfc_hce_method_channel.dart';

abstract class FlutterNfcHcePlatform extends PlatformInterface {
  /// Constructs a FlutterNfcHcePlatform.
  FlutterNfcHcePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterNfcHcePlatform _instance = MethodChannelFlutterNfcHce();

  /// The default instance of [FlutterNfcHcePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterNfcHce].
  static FlutterNfcHcePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterNfcHcePlatform] when
  /// they register themselves.
  static set instance(FlutterNfcHcePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> startNfcHce(String content) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> isSupportNfcHceFeature() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> isNfcEnable() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
