//
//  Delegates.swift
//  EduHelper
//
//  Created by Disaur on 4/7/2022.
//

import UIKit

final class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    configurationForConnecting connectingSceneSession: UISceneSession,
    options: UIScene.ConnectionOptions
  ) -> UISceneConfiguration {
    let configuration = UISceneConfiguration(
      name: "Main Scene",
      sessionRole: connectingSceneSession.role
    )
    configuration.delegateClass = MainSceneDelegate.self
    return configuration
  }
}
