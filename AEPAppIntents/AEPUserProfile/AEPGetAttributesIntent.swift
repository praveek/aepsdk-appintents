import AppIntents
import AEPServices
import AEPUserProfile

@available(iOS 16, *)
struct AEPGetAttributesIntent: AppIntent {
    static var title: LocalizedStringResource = "AEP SDK (UserProfile) - Get Attributes"
    
    static var description =
        IntentDescription("Calls UserProfile.getUserAttributes(...) API")
    
    @Parameter(title: "Profile attributes", description: "Attribute names in JSON array format", requestValueDialog: IntentDialog("Attribute names?"))
    var attributes: String
    
    func perform() async throws -> some ReturnsValue<String> {
        let profileAttrs = await getProfileArributes(attributes: attributes.parseJSONArray()) ?? ""
        return .result(value: profileAttrs, dialog: IntentDialog(stringLiteral: profileAttrs))
    }
    
    func getProfileArributes(attributes: [String]?) async -> String? {
        guard let attributes = attributes else { return nil }
        return await withCheckedContinuation { continuation in
            UserProfile.getUserAttributes(attributeNames: attributes) { profileMap, error in
                continuation.resume(returning: PrettyDictionary.prettify(profileMap))
            }
        }
    }
}

