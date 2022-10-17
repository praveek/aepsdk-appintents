import AppIntents
import AEPCore
import AEPServices

@available(iOS 16, *)
struct AEPLifecyclePauseIntent: AppIntent {
    static var title: LocalizedStringResource = "AEP SDK (Core) - Lifecycle Pause"
    
    static var description =
        IntentDescription("Calls MobileCore.lifecyclePause() API")
        
    func perform() async throws -> some IntentResult {
        MobileCore.lifecyclePause()
        return .result()
    }
}

