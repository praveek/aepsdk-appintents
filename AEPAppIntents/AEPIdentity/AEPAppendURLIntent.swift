import AppIntents
import AEPServices
import AEPIdentity

@available(iOS 16, *)
struct AEPAppendURLIntent: AppIntent {
    static var title: LocalizedStringResource = "AEP SDK (Identity) - Append URL"
    
    static var description =
        IntentDescription("Calls Identity.appendURL(...) API")
    
    @Parameter(title: "URL", description: "URL to append AEP query params", requestValueDialog: IntentDialog("URL?"))
    var url: URL
    
    func perform() async throws -> some ReturnsValue<URL> {
        let appendedURL = await appendURLParams(url: url) ?? url
        return .result(value: appendedURL, dialog: IntentDialog(stringLiteral: appendedURL.absoluteString))
    }
    
    func appendURLParams(url: URL) async -> URL? {
        return await withCheckedContinuation { continuation in
            Identity.appendTo(url: url) { url, error in
                continuation.resume(returning: url)
            }
        }
    }
}

