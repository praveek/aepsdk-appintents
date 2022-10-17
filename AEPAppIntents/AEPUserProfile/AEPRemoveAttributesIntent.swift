import AppIntents
import AEPServices
import AEPUserProfile

@available(iOS 16, *)
struct AEPRemoveAttributesIntent: AppIntent {
    static var title: LocalizedStringResource = "AEP SDK (UserProfile) - Remove Attributes"
    
    static var description =
        IntentDescription("Calls UserProfile.removeAttributes(...) API")
    
    @Parameter(title: "Profile attributes", description: "Attribute names in JSON array format", requestValueDialog: IntentDialog("Attribute names?"))
    var attributes: String
    
    func perform() async throws -> some IntentResult {
        if let attributeNames = attributes.parseJSONArray() {
            UserProfile.removeUserAttributes(attributeNames: attributeNames)
        }
                                            
        return .result()
    }
}

