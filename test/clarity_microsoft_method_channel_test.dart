import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clarity_microsoft/clarity_microsoft_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelClarityMicrosoft platform = MethodChannelClarityMicrosoft();
  const MethodChannel channel = MethodChannel('clarity_microsoft');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
