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

  private let url = "http://192.168.5.1/"
  private let login = "thepier"
  private let passw = "076381847"

  let webView = WKWebView()
  var killTiming = DispatchWorkItem(block: {})

  override init() {
    super.init()

    dologin2()
  }

  func dologin2() {
    let rq = URLRequest(url: URL(string: url)!,
                        cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                        timeoutInterval: 5)

    webView.navigationDelegate = self
    webView.load(rq)
  }

}

extension Connector: WKNavigationDelegate {

  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    killTiming.cancel()
    killTiming = DispatchWorkItem(block: { exit(0) })
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: killTiming)

    webView.evaluateJavaScript("document.login.username.value=\"\(login)\"; document.login.password.value=\"\(self.passw)\"; doLogin();") { (aaa, err) in
      print(aaa ?? "", err ?? "")
    }
  }

}
