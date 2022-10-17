import AppIntents
import AEPCore
import AEPServices

@available(iOS 16, *)
struct AEPFetchConfigurationIntent: AppIntent {
    static var title: LocalizedStringResource = "AEP SDK (Core) - Fetch Configuration"
    
    static var description =
        IntentDescription("Fetches current configuration")
    
    func perform() async throws -> some ReturnsValue<String> {
        let config = await fetchConfiguration()
        return .result(value: config, dialog: "Current AEP SDK configuration: \(config)")
    }
    
    func fetchConfiguration() async -> String {
        return await withCheckedContinuation { continuation in
            let event = Event(name: "FetchConfiguration", type: EventType.configuration, source: EventSource.requestContent, data: ["config.getData": true])

            MobileCore.dispatch(event: event, timeout: TimeInterval(1)) { responseEvent in
                continuation.resume(returning: PrettyDictionary.prettify(responseEvent?.data))
            }
        }
    }
    
    
}

