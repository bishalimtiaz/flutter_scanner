import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_scanner/flutter_scanner.dart';
import 'package:flutter_scanner/flutter_scanner_platform_interface.dart';
import 'package:flutter_scanner/flutter_scanner_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterScannerPlatform
    with MockPlatformInterfaceMixin
    implements FlutterScannerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterScannerPlatform initialPlatform = FlutterScannerPlatform.instance;

  test('$MethodChannelFlutterScanner is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterScanner>());
  });

  test('getPlatformVersion', () async {
    FlutterScanner flutterScannerPlugin = FlutterScanner();
    MockFlutterScannerPlatform fakePlatform = MockFlutterScannerPlatform();
    FlutterScannerPlatform.instance = fakePlatform;

    expect(await flutterScannerPlugin.getPlatformVersion(), '42');
  });
}
