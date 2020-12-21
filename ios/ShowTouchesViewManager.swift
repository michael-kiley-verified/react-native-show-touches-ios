//
//  ShowTouchesViewManager.swift
//  ShowTouches
//
//  Created by Michael Kiley on 12/18/20.
//

import Foundation


@objc(ShowTouchesViewManager)
class ShowTouchesViewManager: RCTViewManager {
  override func view() -> UIView! {
    
    let showTouchesView = ShowTouchesView()
    return showTouchesView
    
  }
  
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
