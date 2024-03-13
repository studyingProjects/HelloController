//
//  MainView.swift
//  HelloController
//
//  Created by Andrei Shpartou on 13/03/2024.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func updateInfo(with string: String)
}

class MainView: UIView {
    var delegate: MainViewDelegate?

    private lazy var button: UIButton = getMainButton()
    private lazy var label: UILabel = getResultLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.backgroundColor = .systemGray4
        addSubview(button)
        addSubview(label)
    }

    private func getMainButton() -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.white, for: .highlighted)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = CommonSizes.cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false

        button.addTarget(self, action: #selector(startPressed), for: .touchUpInside)

        return button
    }

    private func getResultLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: LabelSize.Large.fontSize, weight: LabelSize.Large.fontWeight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    // MARK: - Action
    @objc
    func startPressed() {

        let alert = UIAlertController(
            title: "Type in the word",
            message: "Type the word 'leohi'",
            preferredStyle: .alert
        )
        alert.addTextField {
            $0.placeholder = "leohi"
        }
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            guard let typedWord = alert.textFields?.first?.text else {
                return
            }

            self.delegate?.performAlertHandler(with: typedWord)
        }

        alert.addAction(action)
        self.window?.rootViewController?.present(alert, animated: true)
    }
}

extension MainView: MainViewControllerDelegate {
    func updateInfo(with string: String) {
        label.text = string
    }
}

// MARK: - Constraints
private extension MainView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: ButtonSize.Large.width),
            button.heightAnchor.constraint(equalToConstant: ButtonSize.Large.height),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: CommonSizes.Padding.large),

            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: CommonSizes.Padding.medium),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CommonSizes.Padding.small),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: CommonSizes.Padding.small)
        ])
    }
}
