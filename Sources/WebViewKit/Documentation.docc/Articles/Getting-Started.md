# Getting Started

This article describes how you get started with WebViewKit.


## Installation

WebViewKit can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/WebViewKit.git
``` 


## WebView

The library's main view is ``WebView``, which can be used to load local and online web pages.

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

You can also provide it with a configuration block that can be used to configure the created `WKWebView`:

```swift
WebView(url: url) { view in
    // Configure the view in any way you like
}
```

The url, if any, will be loaded after the configuration has been applied. You can also perform any url loading in the configuration block.


## SafariWebView

The library also contains an iOS only ``SafariWebView``, which can be used to load local and online web pages.

Unlike ``WebView``, ``SafariWebView`` is pretty basic, but it can add a topmost navigation bar and a bottommost toolbar with buttons for additional convenience.

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
    configuration: customConfiguration) { controller in
    // Configure the controller in any way you like
}
```

The `configuration` will be used when creating the controller and the `controllerConfiguration` to configure the created `SFSafariController`.    


## Conclusion

That's about it. Enjoy browsing the web in SwiftUI!
