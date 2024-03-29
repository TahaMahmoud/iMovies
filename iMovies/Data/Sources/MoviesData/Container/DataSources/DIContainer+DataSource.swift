//
//  DIContainer+DataSource.swift
//
//
//  Created by Taha Mahmoud on 19/01/2024.
//

import ConfigData
import DataPersistence
import MoviesDomain

public extension DIContainer {
    static var remoteMoviesDataSource: RemoteMoviesDataSourceProtocol {
        return RemoteMoviesDataSource(networkingManger: networkConfig.networkManager)
    }

    static var remoteBannerDataSource: RemoteBannerDataSourceProtocol {
        return RemoteBannerDataSource(networkingManger: networkConfig.networkManager)
    }

    static var userDefaultsManager: DataPersistenceToolsProtocol {
        return UserDefaultsManager.shared
    }

    static var dataManager: DataPersistenceManager {
        return DataPersistenceManager.shared
    }

    static var localWishListDataSource: LocalWishListDataSourceProtocol {
        return LocalWishListDataSource(dataManager: dataManager)
    }
}
