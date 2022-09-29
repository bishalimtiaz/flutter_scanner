import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_scanner_method_channel.dart';

abstract class FlutterScannerPlatform extends PlatformInterface {
  /// Constructs a FlutterScannerPlatform.
  FlutterScannerPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterScannerPlatform _instance = MethodChannelFlutterScanner();

  /// The default instance of [FlutterScannerPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterScanner].
  static FlutterScannerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterScannerPlatform] when
  /// they register themselves.
  static set instance(FlutterScannerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
