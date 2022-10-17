import AppIntents
import AEPIdentity

@available(iOS 16, *)
struct AEPGetExperienceCloudIdIntent: AppIntent {
    static var title: LocalizedStringResource = "AEP SDK (Identity) - Get Experience Cloud ID"
    
    static var description =
        IntentDescription("Calls AEPIdentity.getExperienceCloudId() API")
    
    func perform() async throws -> some ReturnsValue<String> {
        let ecid = await getExperienceCloudId() ?? ""
        return .result(value: ecid, dialog: IntentDialog(stringLiteral: "ECID: \(ecid)"))
    }

    func getExperienceCloudId() async -> String? {
        return try? await withCheckedThrowingContinuation { continuation in
            Identity.getExperienceCloudId { status, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: status)
                }
            }
        }
    }
}

