//
//  SceneDelegate.swift
//  HomeWork3
//
//  Created by MAC on 01.10.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import SwiftUI
import rick_morty_swift_api

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let client = Client()

        let locationsFactory = LocationsFactory(client: client)
        let episodesFactory = EpisodesFactory(client: client)
        let charactersFactory = CharactersFactory(client: client)

        let serviceLocator = ServiceLocator()
        serviceLocator.addService(service: locationsFactory as LocationsProtocol)
        serviceLocator.addService(service: episodesFactory as EpisodesProtocol)
        serviceLocator.addService(service: charactersFactory as CharactersProtocol)

        let contentView = MainView()
            .environmentObject(LocationsViewModel(serviceLocator: serviceLocator))
            .environmentObject(CharactersViewModel(serviceLocator: serviceLocator))
            .environmentObject(EpisodesViewModel(serviceLocator: serviceLocator))

        // Use a UIHostingController as window root view controller.
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

