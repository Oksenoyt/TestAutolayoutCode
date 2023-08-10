//
//  File.swift
//  testAutolayoutInCode
//
//  Created by Oksenoyt on 10.08.2023.
//

import UIKit

enum Tabs: Int {
    case trafficLights
    case second
    case third
}

final class TabBArController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        configurate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configurate() {
        tabBar.tintColor = .brown // активный tab
        tabBar.barTintColor = .gray // не активный bar
        tabBar.backgroundColor = .white //цвет tabBar

        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true

        let trafficLightController = TrafficLightViewController()
        let secondController = SecondViewController()
        let thirdController = ThirdViewController()

        let secondNavigation = UINavigationController(rootViewController: secondController)

        trafficLightController.tabBarItem = UITabBarItem(title: "traffic", image: UIImage(systemName: "circle"), tag: Tabs.trafficLights.rawValue)
        secondNavigation.tabBarItem = UITabBarItem(title: "second", image: UIImage(systemName: "person"), tag: Tabs.second.rawValue)
        thirdController .tabBarItem = UITabBarItem(title: "third", image: UIImage(systemName: "circle"), tag: Tabs.third.rawValue)

        setViewControllers([trafficLightController, secondNavigation, thirdController], animated: false)
    }
}
