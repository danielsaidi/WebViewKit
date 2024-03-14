//
//  SafariWebView.swift
//  WebViewKit
//
//  Created by Daniel Saidi on 2020-12-29.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(visionOS)
import SwiftUI
import SafariServices

/**
 This view wraps a `SFSafariViewController` that can request
 any url you provide it with.
 
 Unlike ``WebView``, this view adds a navigation bar topmost
 and a toolbar bottommost. These bars can be used to dismiss
 the view, change size, navigate, share etc.
 
 When you create this view, you can provide it with a url, a
 Safari config and an optional controller configuration that
 can be used to configure the created controller instance.
 */

public struct SafariWebView: UIViewControllerRepresentable {
    
    /// Create a Safari web view.
    ///
    /// - Parameters:
    ///   - url: The URL to load into the web view.
    ///   - configuration: The configuration to apply, if any.
    ///   - viewConfig: The configuration to apply, if any.
    public init(
        url: URL,
        configuration: SFSafariViewController.Configuration = .init(),
        viewConfig: @escaping (SFSafariViewController) -> Void = { _ in }
    ) {
        self.url = url
        self.configuration = configuration
        self.viewConfig = viewConfig
    }
    
    private let url: URL
    private let configuration: SFSafariViewController.Configuration
    private let viewConfig: (SFSafariViewController) -> Void

    public func makeUIViewController(
        context: Context
    ) -> SFSafariViewController {
        let controller = SFSafariViewController(
            url: url,
            configuration: configuration
        )
        viewConfig(controller)
        return controller
    }

    public func updateUIViewController(
        _ safariViewController: SFSafariViewController,
        context: Context
    ) {}
}

#Preview {
    
    SafariWebView(url: URL(string: "https://danielsaidi.com")!)
        .ignoresSafeArea()
}
#endif
