import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_scanner_platform_interface.dart';

/// An implementation of [FlutterScannerPlatform] that uses method channels.
class MethodChannelFlutterScanner extends FlutterScannerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_scanner');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
