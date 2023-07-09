import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'sabpaisa_platform_interface.dart';

/// An implementation of [SabpaisaPlatform] that uses method channels.
class MethodChannelSabpaisa extends SabpaisaPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('sabpaisa');
}
