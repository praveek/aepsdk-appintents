import AppIntents
import AEPCore
import AEPServices

@available(iOS 16, *)
struct AEPUpdateConfigurationIntent: AppIntent {
    static var title: LocalizedStringResource = "AEP SDK (Core) - Update Configuration"
    
    static var description =
        IntentDescription("Calls MobileCore.updateConfiguration() API")
    
    @Parameter(title: "Configuration", description: "Configuration in JSON format", requestValueDialog: IntentDialog("Configuration?"))
    var configuration: String
        
    func perform() async throws -> some IntentResult {
        if let configDict = configuration.parseJSONMap() {
            MobileCore.updateConfigurationWith(configDict: configDict)                
        }
        return .result()
    }
}

