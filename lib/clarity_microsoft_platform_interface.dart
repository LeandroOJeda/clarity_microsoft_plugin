import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'clarity_microsoft_method_channel.dart';

abstract class ClarityMicrosoftPlatform extends PlatformInterface {
  /// Constructs a ClarityMicrosoftPlatform.
  ClarityMicrosoftPlatform() : super(token: _token);

  static final Object _token = Object();

  static ClarityMicrosoftPlatform _instance = MethodChannelClarityMicrosoft();

  /// The default instance of [ClarityMicrosoftPlatform] to use.
  ///
  /// Defaults to [MethodChannelClarityMicrosoft].
  static ClarityMicrosoftPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ClarityMicrosoftPlatform] when
  /// they register themselves.
  static set instance(ClarityMicrosoftPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> initClarity(String projectId, String? userId) {
    throw UnimplementedError('initClarity() has not been implemented.');
  }
}
