//
//  iMoviesApp.swift
//  iMovies
//
//  Created by Taha Mahmoud on 18/01/2024.
//

import SwiftUI
import Logger
import CoreDomain

@main
struct IMoviesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    static var shared: AppDelegate!

    var appConfig: AppConfig = {
        guard let appConfig = AppConfig() else {
            let errorMessage = "Invalid app config"
            LogsManager.shared.critical(message: errorMessage, error: nil)
            fatalError(errorMessage)
        }

        return appConfig
    }()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [
            UIApplication.LaunchOptionsKey: Any
        ]? = nil) -> Bool {
            Self.shared = self
            setup()
        return true
    }

    func setup() {
        _ = [
            DataConfigurator.shared,
            LoggerManager.shared,
            DesignSystemConfigurator.shared
        ].map { $0.setup() }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func listenForUpdates() {
    }
}
