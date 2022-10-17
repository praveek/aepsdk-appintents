import AppIntents
import AEPCore
import AEPServices

@available(iOS 16, *)
struct AEPGetSDKIdentitiesIntent: AppIntent {
    static var title: LocalizedStringResource = "AEP SDK (Core) - Get SDK Identites"
    
    static var description =
        IntentDescription("Calls MobileCore.getSdkIdentities(...) API")
    
    func perform() async throws -> some ReturnsValue<String> {
        let identities = await getIdentities()
        return .result(value: identities, dialog: IntentDialog(stringLiteral: identities))
    }
    
    func getIdentities() async -> String {
        return await withCheckedContinuation { continuation in
            MobileCore.getSdkIdentities{ identites, error in
                continuation.resume(returning: identites ?? "")
            }
        }
    }
}

