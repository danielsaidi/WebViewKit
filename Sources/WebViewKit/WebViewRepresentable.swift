//
//  WebViewRepresentable.swift
//  WebViewKit
//
//  Created by Daniel Saidi on 2022-03-24.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

#if os(iOS)

/**
 This typealias is used to bridge UIKit and AppKit wrappers.
 */
typealias WebViewRepresentable = UIViewRepresentable

#elseif os(macOS)

/**
 This typealias is used to bridge UIKit and AppKit wrappers.
 */
typealias WebViewRepresentable = NSViewRepresentable

#endif
