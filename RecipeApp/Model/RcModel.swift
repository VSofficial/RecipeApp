
import Foundation

// MARK: - RCModelElement
struct RCModelElement: Codable {
    let id: Int
    let appname: String
    let version: Int
    let developer: String
    let appPy, appExe, icon, screenshot: String
    let slug, description, requirement, updateDate: String
    let category: String

    enum CodingKeys: String, CodingKey {
        case id, appname, version, developer
        case appPy = "app_py"
        case appExe = "app_exe"
        case icon, screenshot, slug, description, requirement
        case updateDate = "update_date"
        case category
    }
}

typealias RCModel = [RCModelElement]
