import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'sabpaisa_method_channel.dart';

abstract class SabpaisaPlatform extends PlatformInterface {
  /// Constructs a SabpaisaPlatform.
  SabpaisaPlatform() : super(token: _token);

  static final Object _token = Object();

  static SabpaisaPlatform _instance = MethodChannelSabpaisa();

  /// The default instance of [SabpaisaPlatform] to use.
  ///
  /// Defaults to [MethodChannelSabpaisa].
  static SabpaisaPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SabpaisaPlatform] when
  /// they register themselves.
  static set instance(SabpaisaPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
