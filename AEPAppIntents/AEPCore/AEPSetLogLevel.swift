import AppIntents
import AEPCore
import AEPServices

@available(iOS 16, *)
enum LogLevelIntentParam: String, AppEnum {
    static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Log Level")
    
    static var caseDisplayRepresentations: [LogLevelIntentParam: DisplayRepresentation] = [
        .error: "Error",
        .warning: "Warning",
        .debug: "Debug",
        .trace: "Trace"
    ]
    
    case error
    case warning
    case debug
    case trace
        
    public var rawLevel: LogLevel {
        switch self {
        case .error:
            return .error
        case .warning:
            return .warning
        case .debug:
            return .debug
        case .trace:
            return .trace
        }
    }
}


@available(iOS 16, *)
struct AEPSetLogLevelIntent: AppIntent {
    static var title: LocalizedStringResource = "AEP SDK (Core) - Set Log Level"
    
    static var description =
        IntentDescription("Calls MobileCore.setLogLevel(...) API")
    
    static var openAppWhenRun: Bool = true
    
    @Parameter(title: "Log Level", description: "Log level to be set for the SDK", requestValueDialog: IntentDialog("Set log level?"))
    var logLevel: LogLevelIntentParam
        
    func perform() async throws -> some IntentResult {
        MobileCore.setLogLevel(logLevel.rawLevel)
        return .result(dialog: IntentDialog(stringLiteral: "Log level set to \(logLevel.rawValue)"))
    }

}

