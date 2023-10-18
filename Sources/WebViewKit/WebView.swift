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
 This view wraps a `WKWebView` and can be used to load a URL
 that refers to both remote or local web pages.
 
 When you create this view, you can either provide it with a
 url, or an optional url and a view configuration block that
 can be used to configure the created `WKWebView`.

 You can also provide a custom `WKWebViewConfiguration` that
 can be used when initializing the `WKWebView` instance.
 */
public struct WebView: WebViewRepresentable {
    
    
    // MARK: - Initializers
    
    @available(*, deprecated, renamed: "init(url:configuration:viewConfiguration:)")
    public init(
        url: URL? = nil,
        webConfiguration: WKWebViewConfiguration,
        viewConfiguration: @escaping (WKWebView) -> Void = { _ in }
    ) {
        self.init(
            url: url,
            configuration: webConfiguration,
            viewConfiguration: viewConfiguration
        )
    }
    
    /**
     Create a web view that loads the provided url after the
     provided `configuration` has been applied.
     
     If the `url` parameter is `nil`, you must manually load
     a url in the configuration block.
     
     - Parameters:
       - url: The url of the page to load into the web view, if any.
       - configuration: The web view configuration to apply, if any.
       - viewConfiguration: A custom configuration block to apply to the web view, if any.
     */
    public init(
        url: URL? = nil,
        configuration: WKWebViewConfiguration? = nil,
        viewConfiguration: @escaping (WKWebView) -> Void = { _ in }
    ) {
        self.url = url
        self.htmlString = nil
        self.htmlBaseUrl = nil
        self.configuration = configuration
        self.viewConfiguration = viewConfiguration
    }
    
    /**
     Create a web view that loads the provided url after the
     provided `configuration` has been applied.
     
     - Parameters:
       - url: The url of the page to load into the web view.
       - configuration: The web view configuration to apply, if any.
       - viewConfiguration: A custom configuration block to apply to the web view, if any.
     */
    public init(
        urlString: String,
        configuration: WKWebViewConfiguration? = nil,
        viewConfiguration: @escaping (WKWebView) -> Void = { _ in }
    ) {
        self.url = URL(string: urlString)
        self.htmlString = nil
        self.htmlBaseUrl = nil
        self.configuration = configuration
        self.viewConfiguration = viewConfiguration
    }
    
    /**
     Create a web view that loads a custom HTML string after
     provided `configuration` has been applied.
     
     - Parameters:
       - htmlString: The HTML load into the web view.
       - htmlBaseUrl: The HTML base URL to apply, if any.
       - configuration: The web view configuration to apply, if any.
       - viewConfiguration: A custom configuration block to apply to the web view, if any.
     */
    public init(
        htmlString: String,
        htmlBaseUrl: URL? = nil,
        configuration: WKWebViewConfiguration? = nil,
        viewConfiguration: @escaping (WKWebView) -> Void = { _ in }
    ) {
        self.url = nil
        self.htmlString = htmlString
        self.htmlBaseUrl = htmlBaseUrl
        self.configuration = configuration
        self.viewConfiguration = viewConfiguration
    }
    
    
    // MARK: - Properties
    
    private let url: URL?
    private let htmlString: String?
    private let htmlBaseUrl: URL?
    private let configuration: WKWebViewConfiguration?
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
        guard let configuration = configuration else { return WKWebView() }
        return WKWebView(frame: .zero, configuration: configuration)
    }
    
    func makeView() -> WKWebView {
        let view = makeWebView()
        viewConfiguration(view)
        tryLoadUrl(into: view)
        tryLoadHtml(into: view)
        return view
    }
    
    func tryLoadUrl(into view: WKWebView) {
        guard let url else { return }
        view.load(URLRequest(url: url))
    }
    
    func tryLoadHtml(into view: WKWebView) {
        guard let html = htmlString else { return }
        view.loadHTMLString(html, baseURL: htmlBaseUrl)
    }
}

struct Previews_WebView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            WebView(url: URL(string: "https://danielsaidi.com"))
            WebView(htmlString: "<html><body><h1>Hello, world!</h1><p>Does this work?</p></body></html>")
        }
    }
}
#endif
