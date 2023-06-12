# Getting Started

This article describes how you get started with WebViewKit.


## Installation

WebViewKit can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/WebViewKit.git
``` 


## WebView

The library's main view is ``WebView``, which can be used to display any web page based on a URL.

The easiest way to use the view is to just load a url into it:

```swift
import SwiftUI
import WebViewKit

struct MyView {

    let url = URL(string: "https://danielsaidi.com")

    var body: some View {
        WebView(url: url)
    }
}
```

The URL can point to any regular web site URLs, as above, but also to local web pages in your app bundle:

```swift
let localUrl = Bundle.main.url(forResource: "about", withExtension: "html")
``` 

You can also provide it with a configuration block that can be used to configure the `WKWebView`:

```swift
WebView(url: url) { view in
    // Configure the view in any way you like
}
```

The url, if any, will be loaded after the configuration has been applied. 

All in all, setting up a `WebView` can be as easy as this:

```swift
struct ContentView: View {

    private let url = URL(string: "https://apple.com")

    var body: some View {
        WebView(url: url)
    }
}
```

And as complex as this:

```swift
struct ContentView: View {

    private let url = URL(string: "https://apple.com")

    var body: some View {
        WebView(url: url, configuration: configuration) { webView in
            webView.customUserAgent = "foo bar"
        }
    }

    // Example of WKWebViewConfiguration
    var configuration: WKWebViewConfiguration {
        let disableSelectionScriptString = "document.documentElement.style.webkitUserSelect='none';"
        let disableSelectionScript = WKUserScript(
            source: disableSelectionScriptString,
            injectionTime: .atDocumentEnd,
            forMainFrameOnly: true)
        let disableCalloutScriptString = "document.documentElement.style.webkitTouchCallout='none';"
        let disableCalloutScript = WKUserScript(
            source: disableCalloutScriptString,
            injectionTime: .atDocumentEnd,
            forMainFrameOnly: true)

        let userContentController = WKUserContentController()
        userContentController.addUserScript(disableSelectionScript)
        userContentController.addUserScript(disableCalloutScript)

        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        configuration.ignoresViewportScaleLimits = false

        return configuration
    }
}
```

You can also perform any url loading in the configuration block.


## SafariWebView

The library also contains an iOS only ``SafariWebView``, which can load the same kind of content as the ``WebView``.

Unlike ``WebView``, ``SafariWebView`` is pretty basic, but adds a topmost navigation bar and a bottommost toolbar with buttons for additional convenience.

The easiest way to use the view is to just load a static url into it:

```swift
import SwiftUI
import WebViewKit

struct MyView {

    var body: some View {
        if let url = URL(string: "https://danielsaidi.com") {
            SafariWebView(url: url)
        } else {
            Text("Invalid url")
        }
    }
}
```

You can also provide it with an optional url, a `configuration` and a `controllerConfiguration`:

```swift
SafariWebView(
    url: url,
    configuration: safariConfiguration
) { controller in
    // Controller configuration
}
```

The `configuration` parameter will be used when creating the `SFSafariController` and `controllerConfiguration` to configure the created controller instance.    


## Conclusion

That's about it. Enjoy browsing the web in SwiftUI!
