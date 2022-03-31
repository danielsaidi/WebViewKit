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
    
    let url = URL(string: "https://danielsaidi.com")
    
    var body: some View {
        WebView(url: url) { webView in
            // Configure the web view if you like
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
