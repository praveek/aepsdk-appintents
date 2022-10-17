import AppIntents
import AEPCore
import AEPServices

@available(iOS 16, *)
struct AEPClearConfigurationIntent: AppIntent {
    static var title: LocalizedStringResource = "AEP SDK (Core) - Clear Updated Configuration"
    
    static var description =
        IntentDescription("Calls MobileCore.clearUpdatedConfiguration() API")
    
    func perform() async throws -> some IntentResult {
        MobileCore.clearUpdatedConfiguration()
        return .result()
    }
}

