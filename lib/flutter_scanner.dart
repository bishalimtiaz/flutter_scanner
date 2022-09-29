
import 'flutter_scanner_platform_interface.dart';

class FlutterScanner {
  Future<String?> getPlatformVersion() {
    return FlutterScannerPlatform.instance.getPlatformVersion();
  }
}
