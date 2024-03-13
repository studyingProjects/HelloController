//
//  MainViewController.swift
//  HelloController
//
//  Created by Andrei Shpartou on 13/03/2024.
//

import UIKit

class MainViewController: UIViewController {
}

import SwiftUI
struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        Group {
            // change to your vc
            MainViewController().preview()
        }
    }
}
