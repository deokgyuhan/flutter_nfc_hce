import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_nfc_hce/flutter_nfc_hce.dart';
import 'package:flutter_nfc_hce/flutter_nfc_hce_platform_interface.dart';
import 'package:flutter_nfc_hce/flutter_nfc_hce_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterNfcHcePlatform
    with MockPlatformInterfaceMixin
    implements FlutterNfcHcePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> isNfcEnable() {
    // TODO: implement isNfcEnable
    throw UnimplementedError();
  }

  @override
  Future<String?> isSupportNfcHceFeature() {
    // TODO: implement isSupportNfcHceFeature
    throw UnimplementedError();
  }

  @override
  Future<String?> startNfcHce(String content) {
    // TODO: implement startNfcHce
    throw UnimplementedError();
  }

  @override
  Future<String?> isSupportSecureNfcSupported() {
    // TODO: implement isSupportSecureNfcSupported
    throw UnimplementedError();
  }
}

void main() {
  final FlutterNfcHcePlatform initialPlatform = FlutterNfcHcePlatform.instance;

  test('$MethodChannelFlutterNfcHce is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterNfcHce>());
  });

  test('getPlatformVersion', () async {
    FlutterNfcHce flutterNfcHcePlugin = FlutterNfcHce();
    MockFlutterNfcHcePlatform fakePlatform = MockFlutterNfcHcePlatform();
    FlutterNfcHcePlatform.instance = fakePlatform;

    expect(await flutterNfcHcePlugin.getPlatformVersion(), '42');
  });
}
