import AppIntents
import AEPCore
import AEPServices

@available(iOS 16, *)
struct AEPTrackIntent: AppIntent {
    static var title: LocalizedStringResource = "AEP SDK (Core) - Generic Track"
    
    static var description =
        IntentDescription("Calls MobileCore.track(...) API")
    
    @Parameter(title: "State to be tracked", description: "String representing the name of the state to be tracked", requestValueDialog: IntentDialog("State?"))
    var state: String?
    
    @Parameter(title: "Action to be tracked", description: "String representing the name of the action to be tracked", requestValueDialog: IntentDialog("Action?"))
    var action: String?
    
    @Parameter(title: "Optional context data", description: "Optional context data in JSON format", requestValueDialog: IntentDialog("Context data?"))
    var contextData: String?
    
    func perform() async throws -> some IntentResult {
        if let state = state {
            MobileCore.track(state: state, data: contextData?.parseJSONMap())
        } else if let action = action {
            MobileCore.track(state: action, data: contextData?.parseJSONMap())
        }
        
        return .result()
    }
}

