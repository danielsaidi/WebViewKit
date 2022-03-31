<p align="center">
    <img src ="Resources/Logo.png" alt="WebViewKit" title="WebViewKit Logo" width=500 />
</p>

<p align="center">
    <img src="https://img.shields.io/github/v/release/danielsaidi/WebViewKit?color=%2300550&sort=semver" alt="Version" />
    <img src="https://img.shields.io/badge/platform-SwiftUI-blue.svg" alt="Swift UI" />
    <img src="https://img.shields.io/badge/Swift-5.6-orange.svg" alt="Swift 5.6" />
    <img src="https://img.shields.io/github/license/danielsaidi/WebViewKit" alt="MIT License" />
    <a href="https://twitter.com/danielsaidi">
        <img src="https://img.shields.io/badge/contact-@danielsaidi-blue.svg?style=flat" alt="Twitter: @danielsaidi" />
    </a>
</p>


## About WebViewKit

`WebViewKit` adds a `WebView` view to SwiftUI, that can be used to load local and online web pages.

<p align="center" style="border-radius: 80px; outline: 4px solid white; outline-offset: -4px">
    <img src ="Resources/Demo.gif" width="300" />
</p>

The view can load any url and be configured to fit your needs.


## Supported Platforms

`WebViewKit` supports `iOS 13` and `macOS 11`.


## Installation

WebViewKit can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/WebViewKit.git
```


## Getting started

The library's main view is `WebView`, which can be used to load local and online web pages.

The easiest way to use `WebView` is to just load a static url into it:

```swift
import SwiftUI
import WebView

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

...and that's about it. Enjoy browsing the web in SwiftUI!


## Documentation

The WebViewKit documentation can be viewed [online][Documentation] and can also be built it directly from Xcode, using `Product/Build Documentation`.
  

## Demo Application

This project contains a demo app that lets you explore WebViewKit.

To run the demo app, just open and run the `Demo/Demo.xcodeproj` project. It's a universal app project that works for both iOS and macOS. 


## Support

You can sponsor this project on [GitHub Sponsors][Sponsors] or get in touch for paid support. 


## Contact

Feel free to reach out if you have questions or if you want to contribute in any way:

* E-mail: [daniel.saidi@gmail.com][Email]
* Twitter: [@danielsaidi][Twitter]
* Web site: [danielsaidi.com][Website]


## License

WebViewKit is available under the MIT license. See the [LICENSE][License] file for more info.



[Email]: mailto:daniel.saidi@gmail.com
[Twitter]: http://www.twitter.com/danielsaidi
[Website]: http://www.danielsaidi.com
[Sponsors]: https://github.com/sponsors/danielsaidi

[Documentation]: https://danielsaidi.github.io/WebViewKit/documentation/webviewkit/
[License]: https://github.com/danielsaidi/WebViewKit/blob/master/LICENSE
