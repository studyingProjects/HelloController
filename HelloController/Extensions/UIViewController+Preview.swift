//
//  UIViewController+Preview.swift
//  HelloController
//
//  Created by Andrei Shpartou on 13/03/2024.
//
import SwiftUI

extension UIViewController {
    struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
    }

    func preview() -> some View {
        Preview(viewController: self).edgesIgnoringSafeArea(.all)
    }
}
