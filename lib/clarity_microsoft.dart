import 'clarity_microsoft_platform_interface.dart';

/// A class for integrating Microsoft Clarity analytics into your Flutter application.
class ClarityMicrosoft {
  /// Retrieves the platform version.
  ///
  /// Returns a [Future] that completes with a [String] representing the current platform version.
  Future<String?> getPlatformVersion() {
    return ClarityMicrosoftPlatform.instance.getPlatformVersion();
  }

  /// Initializes Microsoft Clarity.
  ///
  /// This method sets up the Clarity SDK with the specified project and user identifiers.
  ///
  /// **Parameters:**
  /// - [projectId]: A [String] representing the Microsoft Clarity project ID.  
  ///   This ID links your app to the corresponding Clarity project.
  /// - [userId]: A [String] representing the user identifier.  
  ///   This value is used to track user activity.  
  ///   If no user ID is available, you can pass an empty string or a default value.
  Future<void> initClarity({required String projectId, String? userId}) {
    return ClarityMicrosoftPlatform.instance.initClarity(projectId, userId);
  }
}
