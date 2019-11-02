//
//  Connector.swift
//  wifi192
//
//  Created by Marat Saytakov on 01.11.2019.
//  Copyright © 2019 saytakov. All rights reserved.
//

import Foundation
import WebKit

class Connector: NSObject {

  let webView = WKWebView()

  private let routerURL = "http://192.168.5.1/"
  private let login = "thepier"
  private let password = "076381847"
  private let timeout: TimeInterval = 5
  private var exiter = DispatchWorkItem(block: {})

  override init() {
    super.init()

    if let routerURL = URL(string: routerURL) {
      loadCaptivePortalRouterPage(url: routerURL, webView: webView)
    }
  }

  func loadCaptivePortalRouterPage(url: URL, webView: WKWebView) {
    let request = URLRequest(url: url,
                             cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                             timeoutInterval: timeout)

    webView.navigationDelegate = self
    webView.load(request)
  }

  func destruction(timeout: TimeInterval) {
    exiter.cancel()
    exiter = DispatchWorkItem(block: { exit(0) })
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(timeout)), execute: exiter)
  }

}

extension Connector: WKNavigationDelegate {

  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    self.destruction(timeout: timeout)

    webView.evaluateJavaScript("document.login.username.value='\(login)'; document.login.password.value='\(password)'; doLogin();",
      completionHandler: nil)
  }

}
