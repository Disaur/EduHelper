//
//  MainSceneDelegate.swift
//  EduHelper
//
//  Created by Disaur on 4/7/2022.
//

import SwiftUI
import UIKit

final class MainSceneDelegate: UIResponder, UIWindowSceneDelegate {
  @Environment(\.openURL) private var openURL: OpenURLAction
  
  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let shortcutItem = connectionOptions.shortcutItem else {
      return
    }
    
    handleShortcutItem(shortcutItem)
  }
  
  func windowScene(
    _ windowScene: UIWindowScene,
    performActionFor shortcutItem: UIApplicationShortcutItem,
    completionHandler: @escaping (Bool) -> Void
  ) {
    handleShortcutItem(shortcutItem, completionHandler: completionHandler)
  }
  
  private func handleShortcutItem(
    _ shortcutItem: UIApplicationShortcutItem,
    completionHandler: ((Bool) -> Void)? = nil
  ) {
      switch shortcutItem.type {
      case "ipad":
          openURL(URL(string: "eduhelper://actions/iPad")!)
      case "mac":
          openURL(URL(string: "eduhelper://actions/mac")!)
      case "acc":
          openURL(URL(string: "eduhelper://actions/acc")!)
      default:
              completionHandler?(false)
              break
    }}
}
