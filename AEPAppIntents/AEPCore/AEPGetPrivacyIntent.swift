import AppIntents
import AEPCore

@available(iOS 16, *)
struct AEPGetPrivacyIntent: AppIntent {
    static var title: LocalizedStringResource = "AEP SDK (Core) - Get Privacy Status"
    
    static var description =
        IntentDescription("Calls MobileCore.getPrivacyStatus() API")
    
    func perform() async throws -> some ReturnsValue<String> {
        let privacyStatus = await getPrivacyStatus()
        return .result(value: privacyStatus.rawValue, dialog: IntentDialog(stringLiteral: "Current privacy status:  \(privacyStatus.rawValue)"))
    }

    func getPrivacyStatus() async -> PrivacyStatus {
        return await withCheckedContinuation { continuation in
            MobileCore.getPrivacyStatus { status in
                continuation.resume(returning: status)
            }
        }
    }
}

