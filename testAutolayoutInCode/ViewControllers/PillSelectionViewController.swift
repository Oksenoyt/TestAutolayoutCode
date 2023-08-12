//
//  PillSelectionScreen.swift
//  testAutolayoutInCode
//
//  Created by Oksenoyt on 10.08.2023.
//

import UIKit

final class PillSelectionViewController: UIViewController {
    private let trueText = "Вы узнали правду"
    private let falseText = "Вы блуждаете во лжи"
    private let neoImage = UIImage(named: "neo")
    private let smitImage = UIImage(named: "smit")

    private lazy var blueButton: UIButton = {
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.baseBackgroundColor = .blue
        buttonConfig.cornerStyle = .capsule
        return UIButton(configuration: buttonConfig, primaryAction: UIAction { [weak self] _ in
            guard let self = self else { return }
            completion?(falseText, smitImage)
            dismiss(animated: true)
        })
    }()

    private lazy var redButton: UIButton = {
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.baseBackgroundColor = .red
        buttonConfig.cornerStyle = .capsule
        return UIButton(configuration: buttonConfig, primaryAction: UIAction { [weak self] _ in
            guard let self = self else { return }
            completion?(trueText, neoImage)
            dismiss(animated: true)
        })
    }()

    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.spacing = 50
        stack.distribution = .fillEqually
        stack.addArrangedSubview(blueButton)
        stack.addArrangedSubview(redButton)
        return stack
    }()

    var completion: ((String, UIImage?) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(stack)
        setConstraints()
    }

}

// MARK: layout
private extension PillSelectionViewController {
    func setConstraints() {
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        stack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    }
}
