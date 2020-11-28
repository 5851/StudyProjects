//
//  SceneDelegate.swift
//  HomeWork7
//
//  Created by MAC on 18.11.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import SwiftUI
import rick_morty_swift_api
import RealmSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let client = Client()
        let realm = try! Realm()

        let locationsFactory = LocationsFactory(client: client)
        let episodesFactory = EpisodesFactory(client: client)
        let charactersFactory = CharactersFactory(client: client)
        let realmService = RealmService()

        let serviceLocator = ServiceLocator()
        serviceLocator.addService(service: locationsFactory as LocationsProtocol)
        serviceLocator.addService(service: episodesFactory as EpisodesProtocol)
        serviceLocator.addService(service: charactersFactory as CharactersProtocol)
        serviceLocator.addService(service: realmService as RealmServiceProtocol)

        let contentView = StartView()
            .environmentObject(LocationsViewModel(serviceLocator: serviceLocator, realm: realm))
            .environmentObject(CharactersViewModel(serviceLocator: serviceLocator, realm: realm))
            .environmentObject(EpisodesViewModel(serviceLocator: serviceLocator, realm: realm))

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

