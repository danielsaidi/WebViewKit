//
//  SafariWebView.swift
//  WebViewKit
//
//  Created by Daniel Saidi on 2020-12-29.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(iOS)
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
    
    /**
     Create a web view that loads the provided url.
     
     - Parameters:
       - url: The url of the page to load into the web view.
       - configuration: The configuration to apply when creating the view.
       - controllerConfiguration: The configuration to apply to the created view.
     */
    public init(
        url: URL,
        configuration: SFSafariViewController.Configuration = .init(),
        controllerConfiguration: @escaping (SFSafariViewController) -> Void = { _ in }) {
        self.url = url
        self.configuration = configuration
        self.controllerConfiguration = controllerConfiguration
    }
    
    private let url: URL
    private let configuration: SFSafariViewController.Configuration
    private let controllerConfiguration: (SFSafariViewController) -> Void

    public func makeUIViewController(context: Context) -> SFSafariViewController {
        let controller = SFSafariViewController(url: url, configuration: configuration)
        controllerConfiguration(controller)
        return controller
    }

    public func updateUIViewController(_ safariViewController: SFSafariViewController, context: Context) {}
}

struct SafariWebView_Previews: PreviewProvider {
    
    static var previews: some View {
        SafariWebView(url: URL(string: "https://danielsaidi.com")!)
    }
}
#endif
