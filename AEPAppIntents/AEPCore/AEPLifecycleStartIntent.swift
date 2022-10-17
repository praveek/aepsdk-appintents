import AppIntents
import AEPCore
import AEPServices

@available(iOS 16, *)
struct AEPLifecycleStartIntent: AppIntent {
    static var title: LocalizedStringResource = "AEP SDK (Core) - Lifecycle Start"
    
    static var description =
        IntentDescription("Calls MobileCore.lifecycleStart(...) API")
    
    @Parameter(title: "Optional additional context data", description: "Optional additional context data in JSON format", requestValueDialog: IntentDialog("Additional context data?"))
    var additionalContextData: String?
    
    func perform() async throws -> some IntentResult {
        MobileCore.lifecycleStart(additionalContextData: additionalContextData?.parseJSONMap())
        return .result()
    }
}

