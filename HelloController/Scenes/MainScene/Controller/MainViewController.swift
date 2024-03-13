//
//  MainViewController.swift
//  HelloController
//
//  Created by Andrei Shpartou on 13/03/2024.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func performAlertHandler(with string: String)
}

class MainViewController: UIViewController {
    var delegate: MainViewControllerDelegate?

    override func loadView() {
        let mainView = MainView()
        mainView.delegate = self
        view = mainView
        delegate = mainView
    }
}

extension MainViewController: MainViewDelegate {
    func performAlertHandler(with string: String) {
        var flexibleString = string
        let handledString = StringPerform.performStringHandle(with: &flexibleString)
        delegate?.updateInfo(with: handledString)
    }
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
