//
//  WebView.swift
//  WebViewKit
//
//  Created by Daniel Saidi on 2022-03-24.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(visionOS)
typealias WebViewRepresentable = UIViewRepresentable
#elseif os(macOS)
typealias WebViewRepresentable = NSViewRepresentable
#endif

#if os(iOS) || os(macOS) || os(visionOS)
import SwiftUI
import WebKit

/// This view wraps a `WKWebView` and can load any URLs that
/// you provide it with, both local and online ones.
///
/// When you create an instance of the view, you can provide
/// it with a `WKWebViewConfiguration` that is injected into
/// the web view initializer, as well as an a
///
/// When you create an instance of the view, you can provide
/// it with a `url`, a `WKWebViewConfiguration` that will be
/// injected into the initializer, plus an `WKWebView`-based
/// configuration block to configure the created instance.
public struct WebView: WebViewRepresentable {
    
    /// Create a web view.
    ///
    /// - Parameters:
    ///   - url: The url to load into the web view, if any.
    ///   - configuration: The configuration to apply, if any.
    ///   - viewConfig: The view configuration to apply, if any.
    public init(
        url: URL? = nil,
        configuration: WKWebViewConfiguration? = nil,
        viewConfig: @escaping (WKWebView) -> Void = { _ in }
    ) {
        self.url = url
        self.htmlString = nil
        self.htmlBaseUrl = nil
        self.configuration = configuration
        self.viewConfig = viewConfig
    }
    
    /// Create a web view.
    ///
    /// - Parameters:
    ///   - urlString: The url to load into the web view, if any.
    ///   - configuration: The configuration to apply, if any.
    ///   - viewConfig: The view configuration to apply, if any.
    public init(
        urlString: String,
        configuration: WKWebViewConfiguration? = nil,
        viewConfig: @escaping (WKWebView) -> Void = { _ in }
    ) {
        self.url = URL(string: urlString)
        self.htmlString = nil
        self.htmlBaseUrl = nil
        self.configuration = configuration
        self.viewConfig = viewConfig
    }
    
    /// Create a web view that loads a custom HTML string.
    ///
    /// - Parameters:
    ///   - htmlString: The HTML to load into the web view.
    ///   - htmlBaseUrl: The HTML base URL to apply, if any.
    ///   - configuration: The web view configuration to apply, if any.
    ///   - viewConfig: The view configuration to apply, if any.
    public init(
        htmlString: String,
        htmlBaseUrl: URL? = nil,
        configuration: WKWebViewConfiguration? = nil,
        viewConfig: @escaping (WKWebView) -> Void = { _ in }
    ) {
        self.url = nil
        self.htmlString = htmlString
        self.htmlBaseUrl = htmlBaseUrl
        self.configuration = configuration
        self.viewConfig = viewConfig
    }
    
    
    private let url: URL?
    private let htmlString: String?
    private let htmlBaseUrl: URL?
    private let configuration: WKWebViewConfiguration?
    private let viewConfig: (WKWebView) -> Void
    
    
    #if os(iOS) || os(visionOS)
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

@MainActor
private extension WebView {

    func makeWebView() -> WKWebView {
        guard let configuration = configuration else { return WKWebView() }
        return WKWebView(frame: .zero, configuration: configuration)
    }
    
    func makeView() -> WKWebView {
        let view = makeWebView()
        viewConfig(view)
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

#Preview {
    
    VStack {
        WebView(url: URL(string: "https://danielsaidi.com"))
        WebView(htmlString: "<html><body><h1>Hello, world!</h1><p>Does this work?</p></body></html>")
    }
}
#endif
