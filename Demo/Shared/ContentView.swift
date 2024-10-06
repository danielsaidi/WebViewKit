//
//  ContentView.swift
//  WebViewKit
//
//  Created by Daniel Saidi on 2022-04-01.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI
import WebViewKit

struct ContentView: View {

    let url = URL(string: "https://apple.com")

    enum BrowserType {
        case regular, safari
    }

    @State
    var browserType = BrowserType.regular

    var body: some View {
        #if os(iOS)
        NavigationView {
            browser
                .ignoresSafeArea(edges: .bottom)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        picker
                    }
                }
        }
        #else
        webView
        #endif
    }
}

private extension ContentView {

    @ViewBuilder
    var browser: some View {
        switch browserType {
        case .regular: webView
        case .safari: safariWebView
        }
    }

    var picker: some View {
        Picker("Select browser", selection: $browserType) {
            Text("WebView").tag(BrowserType.regular)
            Text("Safari").tag(BrowserType.safari)
        }
        .padding(.horizontal)
        .pickerStyle(.segmented)
    }

    #if os(iOS)
    @ViewBuilder
    var safariWebView: some View {
        if let url = url {
            SafariWebView(url: url) { controller in
                // Configure the controller in any way you like
            }
        } else {
            Text("URL is nil")
        }
    }
    #endif
    
    var webView: some View {
        WebView(url: url) { webView in
            // Configure the web view in any way you like
            // For instance, let's set a custom user agent.
            webView.customUserAgent = "foo bar"
        }
    }
}

#Preview {
    
    ContentView()
}
