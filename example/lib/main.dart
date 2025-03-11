import 'package:flutter/material.dart';
import 'package:clarity_microsoft/clarity_microsoft.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _clarityMicrosoftPlugin = ClarityMicrosoft();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    try {
      final platformVersion = await _clarityMicrosoftPlugin.getPlatformVersion() ?? 'Unknown';
      await _clarityMicrosoftPlugin.initClarity(projectId: 'qkm3a48jzp');

      if (mounted) {
        setState(() {
          _platformVersion = platformVersion;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _platformVersion = 'Error: $e';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Clarity Plugin Example')),
        body: Center(
          child: Text('Running on: $_platformVersion'),
        ),
      ),
    );
  }
}
