import Flutter
import UIKit
import Clarity

public class ClarityMicrosoftPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "clarity_microsoft", binaryMessenger: registrar.messenger())
        let instance = ClarityMicrosoftPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
            case "getPlatformVersion":
                result("iOS " + UIDevice.current.systemVersion)

            case "initClarity":
                guard let args = call.arguments as? [String: Any],
                      let projectId = args["projectId"] as? String else {
                    result(FlutterError(code: "INVALID_ARG", message: "Missing projectId", details: nil))
                    return
                }

                let logLevel: LogLevel = .none
                let applicationFramework: ApplicationFramework = .flutter

                if let userId = args["userId"] as? String {
                    let clarityConfig = ClarityConfig(projectId: projectId, userId: userId, logLevel: logLevel, applicationFramework: applicationFramework)
                    ClaritySDK.initialize(config: clarityConfig)
                    print("Clarity initialized with projectId: \(projectId) and userId: \(userId)")
                } else {
                    let clarityConfig = ClarityConfig(projectId: projectId, logLevel: logLevel, applicationFramework: applicationFramework)
                    ClaritySDK.initialize(config: clarityConfig)
                    print("Clarity initialized with projectId: \(projectId) (no userId provided)")
                }

                result(nil)

            default:
                result(FlutterMethodNotImplemented)
        }
    }
}