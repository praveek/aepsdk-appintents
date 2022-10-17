import AppIntents
import AEPCore

@available(iOS 16, *)
enum PrivacyStatusIntentParam: String, AppEnum {
    static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Privacy Status")
    
    static var caseDisplayRepresentations: [PrivacyStatusIntentParam: DisplayRepresentation] = [
        .optedIn: DisplayRepresentation(stringLiteral: PrivacyStatus.optedIn.rawValue),
        .optedOut: DisplayRepresentation(stringLiteral: PrivacyStatus.optedOut.rawValue),
        .unknown: DisplayRepresentation(stringLiteral: PrivacyStatus.unknown.rawValue),
    ]
    
    case optedIn
    case optedOut
    case unknown
        
    public var rawStatus: PrivacyStatus {
        switch self {
        case .optedIn:
            return .optedIn
        case .optedOut:
            return .optedOut
        case .unknown:
            return .unknown
        }
    }
}

@available(iOS 16, *)
struct AEPSetPrivacyIntent: AppIntent {
    static var title: LocalizedStringResource = "AEP SDK (Core) - Set Privacy Status"
    
    static var description =
        IntentDescription("Calls MobileCore.setPrivacyStatus(...) API")
    
    static var openAppWhenRun: Bool = true
    
    @Parameter(title: "Privacy Status", description: "Privacy status to be set for the SDK", requestValueDialog: IntentDialog("Set privacy status?"))
    var privacyStatus: PrivacyStatusIntentParam
        
    func perform() async throws -> some IntentResult {
        MobileCore.setPrivacyStatus(privacyStatus.rawStatus)
        return .result(dialog: IntentDialog(stringLiteral: "Privacy set to \(privacyStatus.rawValue)"))
    }

}

