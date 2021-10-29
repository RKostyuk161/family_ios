//
//  MainScreenStates.swift
//  family
//
//  Created by Роман on 28.10.2021.
//

import Foundation
import UIKit

enum MainScreenStates {
    
    case logo1
    case logo2
    case logo3
    case logo4
    case logo5
    case logo6
    case logo7
    case logo8
    case logo9
    case logo10
    case logo11
    case logo12
    case logo13
    case noone
    
    init(rawValue: Int) {
        switch rawValue {
        case 1:
            self = .logo1
        case 2:
            self = .logo2
        case 3:
            self = .logo3
        case 4:
            self = .logo4
        case 5:
            self = .logo5
        case 6:
            self = .logo6
        case 7:
            self = .logo7
        case 8:
            self = .logo8
        case 9:
            self = .logo9
        case 10:
            self = .logo10
        case 11:
            self = .logo11
        case 12:
            self = .logo12
        case 13:
            self = .logo13
        default:
            self = .noone
        }
    }
    
    var screenImage: UIImage? {
        switch self {
        case .logo1:
            guard let image = UIImage(named: "1") else { return nil }
            return image
        case .logo2:
            guard let image = UIImage(named: "2") else { return nil }
            return image
        case .logo3:
            guard let image = UIImage(named: "3") else { return nil }
            return image
        case .logo4:
            guard let image = UIImage(named: "4") else { return nil }
            return image
        case .logo5:
            guard let image = UIImage(named: "5") else { return nil }
            return image
        case .logo6:
            guard let image = UIImage(named: "6") else { return nil }
            return image
        case .logo7:
            guard let image = UIImage(named: "7") else { return nil }
            return image
        case .logo8:
            guard let image = UIImage(named: "8") else { return nil }
            return image
        case .logo9:
            guard let image = UIImage(named: "9") else { return nil }
            return image
        case .logo10:
            guard let image = UIImage(named: "10") else { return nil }
            return image
        case .logo11:
            guard let image = UIImage(named: "11") else { return nil }
            return image
        case .logo12:
            guard let image = UIImage(named: "12") else { return nil }
            return image
        case .logo13:
            guard let image = UIImage(named: "13") else { return nil }
            return image
        case .noone:
            return nil
        }
    }
}
