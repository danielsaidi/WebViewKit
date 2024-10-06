<p align="center">
    <img src ="Resources/Logo_Rounded.png" alt="WebViewKit Logo" title="WebViewKit" />
</p>

<p align="center">
    <img src="https://img.shields.io/github/v/release/danielsaidi/WebViewKit?color=%2300550&sort=semver" alt="Version" />
    <img src="https://img.shields.io/badge/Swift-6.0-orange.svg" alt="Swift 6.0" title="Version" />
    <img src="https://img.shields.io/badge/platform-SwiftUI-blue.svg" alt="Swift UI" title="Swift UI" />
    <img src="https://img.shields.io/github/license/danielsaidi/WebViewKit" alt="MIT License" title="MIT License" />
        <a href="https://twitter.com/danielsaidi">
        <img src="https://img.shields.io/twitter/url?label=Twitter&style=social&url=https%3A%2F%2Ftwitter.com%2Fdanielsaidi" alt="Twitter: @danielsaidi" title="Twitter: @danielsaidi" />
    </a>
    <a href="https://mastodon.social/@danielsaidi">
        <img src="https://img.shields.io/mastodon/follow/000253346?label=mastodon&style=social" alt="Mastodon: @danielsaidi@mastodon.social" title="Mastodon: @danielsaidi@mastodon.social" />
    </a>
</p>



## About WebViewKit

WebViewKit is a SwiftUI SDK that adds a `WebView` and a `SafariWebView` to `SwiftUI`, that can be used to embed web content and present web sites in your apps:

<p align="center" style="border-radius: 80px; outline: 4px solid white; outline-offset: -4px">
    <img src ="Resources/Demo.gif" width="300" />
</p>

The ``WebView`` component supports iOS, macOS, & visionOS, and can be configured to fit your needs, while the iOS exclusive ``SafariWebView`` can be used for more basic needs and a more browser-like experience.



## Installation

WebViewKit can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/WebViewKit.git
```



## Getting started

The library's main view is ``WebView``, which can be used to display any URL:

```swift
import SwiftUI
import WebViewKit

struct MyView {

    var body: some View {
        WebView(urlString: "https://danielsaidi.com")
    }
}
```

See the online [getting started guide][Getting-Started] for more information.



## Documentation

The online [documentation][Documentation] has more information, articles, code examples, etc.



## Demo Application

The `Demo` folder has an app that lets you explore the library.



## Support my work 

You can [sponsor me][Sponsors] on GitHub Sponsors or [reach out][Email] for paid support, to help support my [open-source projects][OpenSource].

Your support makes it possible for me to put more work into these projects and make them the best they can be.



## Contact

Feel free to reach out if you have questions or if you want to contribute in any way:

* Website: [danielsaidi.com][Website]
* Mastodon: [@danielsaidi@mastodon.social][Mastodon]
* Twitter: [@danielsaidi][Twitter]
* E-mail: [daniel.saidi@gmail.com][Email]



## License

WebViewKit is available under the MIT license. See the [LICENSE][License] file for more info.



[Email]: mailto:daniel.saidi@gmail.com

[Website]: https://danielsaidi.com
[GitHub]: https://github.com/danielsaidi
[Twitter]: https://twitter.com/danielsaidi
[Mastodon]: https://mastodon.social/@danielsaidi
[OpenSource]: https://danielsaidi.com/opensource
[Sponsors]: https://github.com/sponsors/danielsaidi

[Documentation]: https://danielsaidi.github.io/WebViewKit
[Getting-Started]: https://danielsaidi.github.io/WebViewKit/documentation/webviewkit/getting-started

[License]: https://github.com/danielsaidi/WebViewKit/blob/master/LICENSE
