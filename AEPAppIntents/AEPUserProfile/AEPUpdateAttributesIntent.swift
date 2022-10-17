import AppIntents
import AEPServices
import AEPUserProfile

@available(iOS 16, *)
struct AEPUpdateAttributesIntent: AppIntent {
    static var title: LocalizedStringResource = "AEP SDK (UserProfile) - Update Attributes"
    
    static var description =
        IntentDescription("Calls UserProfile.updateAttributes(...) API")
    
    @Parameter(title: "Profile attributes", description: "Attributes dictonary in JSON format", requestValueDialog: IntentDialog("Profile attributes?"))
    var attributes: String?
    
    func perform() async throws -> some IntentResult {
        if let attributesDict = attributes?.parseJSONMap() {
            UserProfile.updateUserAttributes(attributeDict: attributesDict)
        }
                                            
        return .result()
    }
}

