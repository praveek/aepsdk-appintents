import AppIntents
import AEPCore
import AEPServices

@available(iOS 16, *)
struct AEPResetSDKIdentitiesIntent: AppIntent {
    static var title: LocalizedStringResource = "AEP SDK (Core) - Reset SDK Identites"
    
    static var description =
        IntentDescription("Calls MobileCore.resetIdentities() API")
    
    func perform() async throws -> some IntentResult {
        MobileCore.resetIdentities()
        return .result()
    }
}

