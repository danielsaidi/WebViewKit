//
//  WebView.swift
//  WebViewKit
//
//  Created by Daniel Saidi on 2022-03-24.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(iOS)
typealias WebViewRepresentable = UIViewRepresentable
#elseif os(macOS)
typealias WebViewRepresentable = NSViewRepresentable
#endif

#if os(iOS) || os(macOS)
import SwiftUI
import WebKit

/**
 This view wraps a `WKWebView` and can be used to load local
 and online web pages.
 
 When you create this view, you can either provide it with a
 url, or an optional url and a view configuration block that
 can be used to configure the created `WKWebView`.

 You can also provide a custom `WKWebViewConfiguration` that
 can be used when initializing the `WKWebView` instance.

 To conclude, setting up a `WebView` can be as easy as this:

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
 */
public struct WebView: WebViewRepresentable {
    
    
    // MARK: - Initializers
    
    /**
     Create a web view that loads the provided url after the
     provided configuration has been applied.
     
     If the `url` parameter is `nil`, you must manually load
     a url in the configuration block. If you don't, the web
     view will not present any content.
     
     - Parameters:
       - url: The url of the page to load into the web view, if any.
       - webConfiguration: The WKWebViewConfiguration to apply to the web view, if any.
       - webView: The custom configuration block to apply to the web view, if any.
     */
    public init(
        url: URL? = nil,
        webConfiguration: WKWebViewConfiguration? = nil,
        viewConfiguration: @escaping (WKWebView) -> Void = { _ in }) {
        self.url = url
        self.webConfiguration = webConfiguration
        self.viewConfiguration = viewConfiguration
    }
    
    
    // MARK: - Properties
    
    private let url: URL?
    private let webConfiguration: WKWebViewConfiguration?
    private let viewConfiguration: (WKWebView) -> Void
    
    
    // MARK: - Functions
    
    #if os(iOS)
    public func makeUIView(context: Context) -> WKWebView {
        makeView()
    }
    
    public func updateUIView(_ uiView: WKWebView, context: Context) {}
    #endif
    
    #if os(macOS)
    public func makeNSView(context: Context) -> WKWebView {
        makeView()
    }
    
    public func updateNSView(_ view: WKWebView, context: Context) {}
    #endif
}

private extension WebView {

    func makeWebView() -> WKWebView {
        guard let configuration = webConfiguration else { return WKWebView() }
        return WKWebView(frame: .zero, configuration: configuration)
    }
    
    func makeView() -> WKWebView {
        let view = makeWebView()
        viewConfiguration(view)
        tryLoad(url, into: view)
        return view
    }
    
    func tryLoad(_ url: URL?, into view: WKWebView) {
        guard let url = url else { return }
        view.load(URLRequest(url: url))
    }
}

struct Previews_WebView_Previews: PreviewProvider {
    
    static var previews: some View {
        if let url = URL(string: "https://danielsaidi.com") {
            WebView(url: url)
        } else {
            Color.orange
        }
    }
}
#endif
