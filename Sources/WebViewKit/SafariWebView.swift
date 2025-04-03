//
//  SafariWebView.swift
//  WebViewKit
//
//  Created by Daniel Saidi on 2020-12-29.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(visionOS)
import SwiftUI
import SafariServices

/// This view wraps an `SFSafariViewController` and can load
/// any url you provide it with.
///
/// Unlike a ``WebView``, which just renders the web content,
/// this view has a topmost navigation bar plus a bottommost
/// toolbar with additional controls.
///
/// When you create an instance of the view, you can provide
/// it with a `url`, a `SFSafariViewController.Configuration`
/// that's injected into the initializer, plus an additional
/// `SFSafariViewController`-based configuration block, that
/// can be used to configure the created instance.
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
