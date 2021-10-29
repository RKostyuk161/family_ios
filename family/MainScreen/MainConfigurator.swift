//
//  MainConfigurator.swift
//  family
//
//  Created by Роман on 28.10.2021.
//

import Foundation
import UIKit

class MainConfigurator {
    
    static func configure(view: ViewController) {
        let presenter = MainPresenterImp(view: view)
        view.presenter = presenter
    }
    
}

