import Foundation
import SafariServices
import Topee

class SafariExtensionHandler: TopeeSafariExtensionHandler {
    private func loadIcon(_ name: String) -> NSImage {
        guard let iconUrl = Bundle.main.url(forResource: name, withExtension: "") else {
            fatalError("Couldn't find \(name) icon.")
        }

        return NSImage(byReferencing: iconUrl)
    }

    override open func setupBridge() {
        self.bridge.setup(
            // Make sure you don't put sensitive data into URL because it's being sent as referrer
            // when background script does HTTP requests.
            webViewURL: URL(string: "http://localhost:27275/#comm=a4XQHwDUApdxl05DwMDKyOdxW5K5icu8sOXVAyGTJEynEPxGMuz7veKVYyyU")!,
            manifest: TopeeExtensionManifest(
                name: "Topee Extension",
                version: "0.0.12345678",
                bundleId: "com.github.topee"
            ),
            logger: Logger()
        )
    }
}

struct Logger: TopeeLogger {
    func debug(_ msg: String) {
        NSLog("%@", msg)
    }

    func info(_ msg: String) {
        NSLog("%@", msg)
    }

    func warning(_ msg: String) {
        NSLog("%@", msg)
    }

    func error(_ msg: String) {
        NSLog("%@", msg)
    }
}
