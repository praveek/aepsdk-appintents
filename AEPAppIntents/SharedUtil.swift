import Foundation
import AEPServices

internal extension String {
    func parseJSONMap()-> [String: Any]? {
        guard let data = self.data(using: .utf8) else { return nil }
        let decoded = try? JSONDecoder().decode([String: AnyCodable].self, from: data)
        return AnyCodable.toAnyDictionary(dictionary: decoded)        
    }
    
    func parseJSONArray()-> [String]? {
        guard let data = self.data(using: .utf8) else { return nil }
        let decoded = try? JSONDecoder().decode([String].self, from: data)
        return decoded
    }
}
