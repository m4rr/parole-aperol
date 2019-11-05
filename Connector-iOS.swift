//
//  WrapViewController.swift
//  wifi192-ios
//
//  Created by Marat Saytakov on 05.11.2019.
//  Copyright © 2019 saytakov. All rights reserved.
//

import UIKit

class ConnectorViewController: UIViewController {

  private let cnt = Connector()

  override func loadView() {
    view = cnt.webView
  }

  init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) { fatalError() }

}
