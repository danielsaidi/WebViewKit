//
//  ContentView.swift
//  WebViewKit
//
//  Created by Daniel Saidi on 2022-04-01.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI
import WebViewKit

struct ContentView: View {
    
    // Never force unwrap in real-world apps, kids!
    let url = URL(string: "https://danielsaidi.com")
    
    var body: some View {
        webView
            .ignoresSafeArea()
    }
}

private extension ContentView {
    
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
