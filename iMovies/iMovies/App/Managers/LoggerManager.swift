//
//  LoggerManager.swift
//  iMovies
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import Foundation
import Logger
import Core

struct LoggerManager: AppDelegateManagable {
    static var shared: AppDelegateManagable = LoggerManager()

    func setup() {
        LogsManager.shared.initialize(engines: [Logger.systemLogger.engine])
    }
}
