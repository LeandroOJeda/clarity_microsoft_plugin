import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'clarity_microsoft_platform_interface.dart';

/// An implementation of [ClarityMicrosoftPlatform] that uses method channels.
class MethodChannelClarityMicrosoft extends ClarityMicrosoftPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('clarity_microsoft');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> initClarity(String projectId, String? userId) async {
    await methodChannel.invokeMethod<void>('initClarity', {'projectId': projectId, 'userId': userId});
  }
}
