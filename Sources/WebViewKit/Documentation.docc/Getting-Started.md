# Getting Started

This article describes how you get started with WebViewKit.


## Installation

WebViewKit can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/WebViewKit.git
``` 


## WebView

The library's main view is ``WebView``, which can be used to load local and online web pages.

The easiest way to use the view is to just load a static url into it:

```swift
import SwiftUI
import WebViewKit

struct MyView {

    var body: some View {
        if let url = URL(string: "https://danielsaidi.com") {
            WebView(url: url)
        } else {
            Text("Invalid url")
        }
    }
}
```

You can also provide it with a configuration block that configures the wrapped WKWebView:

```swift
WebView(url: url) { view in
    // Configure the view in any way you like
}
```

That's about it. Enjoy browsing the web in SwiftUI!
