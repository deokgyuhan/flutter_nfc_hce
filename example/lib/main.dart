import 'package:flutter/material.dart';
import 'package:flutter_nfc_hce/flutter_nfc_hce.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _flutterNfcHcePlugin = FlutterNfcHce();
  bool _showNFCScanDialog = false;
  var platformVersion;
  var isSupportNfcHceFeature;
  var isSupportSecureNfcSupported;
  var isNfcEnable;

  void _getInfo() async {
    platformVersion = await _flutterNfcHcePlugin.getPlatformVersion();
    isSupportNfcHceFeature = await _flutterNfcHcePlugin.isSupportNfcHceFeature();
    isSupportSecureNfcSupported = await _flutterNfcHcePlugin.isSupportSecureNfcSupported();
    isNfcEnable = await _flutterNfcHcePlugin.isNfcEnable();
  }

  void _onScanButtonPressed() async {
    _getInfo();

    var content = 'flutter_nfc_hce';
    var result = await _flutterNfcHcePlugin.startNfcHce(content);

    print('---------------------------------->' + result!);

    setState(() {
      _showNFCScanDialog = true;
    });
  }

  void _onCloseButtonPressed() {
    setState(() {
      _showNFCScanDialog = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin Nfc Hce example app'),
          ),
          body: Container(
            child: Stack(
              children: [
                // Background widget
                Container(
                  color: Colors.transparent,
                    child:  Center(
                        child: Column(
                          children: [
                            Text('platformVersion: ${platformVersion == null ? "": platformVersion}'),
                            SizedBox(height: 5,),
                            Text('isSupportNfcHceFeature: ${isSupportNfcHceFeature == null ? "" : isSupportNfcHceFeature}'),
                            SizedBox(height: 5,),
                            Text('isSupportSecureNfcSupported: ${isSupportSecureNfcSupported == null ? "" : isSupportSecureNfcSupported}'),
                            SizedBox(height: 5,),
                            Text('isNfcEnagle: ${isNfcEnable == null ? "" : isNfcEnable}'),
                          ],
                        ))
                ),

                // NFC Scan Dialog
                if (_showNFCScanDialog)
                  GestureDetector(
                    onTap: _onCloseButtonPressed,
                    child: Container(
                      color: Colors.black54,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/nfc_tag.png', width: 100, height: 100),
                          SizedBox(height: 16),
                          Text(
                            'Start Nfc Hce',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),),
          floatingActionButton: FloatingActionButton(
            onPressed: _onScanButtonPressed,
            child: Icon(Icons.nfc),
          ),
        )
    );
  }
}
