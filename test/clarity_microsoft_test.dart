import 'package:flutter_test/flutter_test.dart';
import 'package:clarity_microsoft/clarity_microsoft.dart';
import 'package:clarity_microsoft/clarity_microsoft_platform_interface.dart';
import 'package:clarity_microsoft/clarity_microsoft_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockClarityMicrosoftPlatform
    with MockPlatformInterfaceMixin
    implements ClarityMicrosoftPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
  
  @override
  Future<void> initClarity(String projectId, String? userId) {
    // TODO: implement initClarity
    throw UnimplementedError();
  }
}

void main() {
  final ClarityMicrosoftPlatform initialPlatform = ClarityMicrosoftPlatform.instance;

  test('$MethodChannelClarityMicrosoft is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelClarityMicrosoft>());
  });

  test('getPlatformVersion', () async {
    ClarityMicrosoft clarityMicrosoftPlugin = ClarityMicrosoft();
    MockClarityMicrosoftPlatform fakePlatform = MockClarityMicrosoftPlatform();
    ClarityMicrosoftPlatform.instance = fakePlatform;

    expect(await clarityMicrosoftPlugin.getPlatformVersion(), '42');
  });
}
