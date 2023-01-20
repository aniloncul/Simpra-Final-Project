//
//  MainTabBarController.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 17.01.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViewController()
       
    }
    
    
    func createNavigationController(for rootViewController: UIViewController,
                                    title: String,
                                    image: UIImage) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.image = image
        navigationController.tabBarItem.title = title
        rootViewController.navigationItem.title = title
        return navigationController
    }
    
    
    
    func setupViewController() {
        let firstViewModel = FirstViewModel()
        
        viewControllers = [
            createNavigationController(for: FirstViewController(viewModel: firstViewModel), title: NSLocalizedString("Homepage", comment: ""), image: UIImage(systemName: "house")!),
            createNavigationController(for: SecondViewController(), title: NSLocalizedString("Second", comment: ""), image: UIImage(systemName: "house")!),
            createNavigationController(for: ThirdViewController(), title: NSLocalizedString("Third", comment: ""), image: UIImage(systemName: "house")!)
        ]
        UITabBar.appearance().tintColor = .red
        UITabBar.appearance().backgroundColor = .white
    }


}
