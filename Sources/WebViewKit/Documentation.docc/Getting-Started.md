# Getting Started

This article describes how to get started with WebViewKit.

@Metadata {

    @PageImage(
        purpose: card,
        source: "Page",
        alt: "Page icon"
    )

    @PageColor(blue)
} 


## WebView

The library's main view is ``WebView``, which can be used to render any web page URL:

```swift
import SwiftUI
import WebViewKit

struct MyView {

    var body: some View {
        WebView(urlString: "https://danielsaidi.com")
    }
}
```

The URL can point to any regular web site, but also to local web pages in your app bundle:

```swift
let localUrl = Bundle.main.url(forResource: "about", withExtension: "html")
``` 

You can also provide a custom `WKWebViewConfiguration` and a view configuration function that can configure the `WKWebView`:

```swift
WebView(
    url: url,
    config: ... // Pass in a WKWebViewConfiguration here
) { webView in
    // Configure the view here
}
```

All in all, setting up a ``WebView`` can be as easy as this:

```swift
struct ContentView: View {

    var body: some View {
        WebView(urlString: "https://apple.com")
    }
}
```

and as complex as this:

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

If you provide a nil initializer `url`, you must load a url into the `WKWebView` in the view configuration, for the view to load a web page.

If you grab hold of the `WKWebView`, you can use it to evaluate JavaScscript, for instance:

```swift
webView.evaluateJavaScript("document.getElementById('someElement').innerText") { (result, error) in
    if error == nil {
        print(result)
    }
}
```

This means that you can parse and manipulate the DOM, inject scripts, etc.


## SafariWebView

WebViewKit also has a ``SafariWebView``, which can load the same content as ``WebView``:

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

You can provide a custom `SFSafariViewController.Configuration` and a view configuration function that can configure the `SFSafariViewController`:

```swift
SafariWebView(
    url: url,
    configuration: safariConfiguration
) { controller in
    // Controller configuration
}
```

``SafariWebView`` is less configurable than ``WebView``, but adds a top and bottom toolbar that can dismiss the view, resize it, navigate back and forward, share the current URL, etc.
