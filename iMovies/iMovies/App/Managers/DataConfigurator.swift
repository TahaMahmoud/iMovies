//
//  DataConfigurator.swift
//  iMovies
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import ConfigData
import Core
import Foundation

class DataConfigurator: AppDelegateManagable {
    static var shared: AppDelegateManagable = DataConfigurator()

    func setup() {
        ConfigData.setup(apiConfig: APIConfig.self)
        ConfigData.setup(networkingConfig: Container.self)
    }
}
