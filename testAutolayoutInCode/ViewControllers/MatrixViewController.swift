//
//  ThitdViewController.swift
//  testAutolayoutInCode
//
//  Created by Oksenoyt on 10.08.2023.
//

import UIKit

final class MatrixViewController: UIViewController {

    private lazy var button: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .large
        config.title = "Выбрать таблетку"
        config.baseBackgroundColor = .black
        config.cornerStyle = .capsule
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
          var outgoing = incoming
            outgoing.font = UIFont.preferredFont(forTextStyle: .title2)
          return outgoing
        }
        return UIButton(configuration: config, primaryAction: UIAction { [weak self] _ in
            let newVC = PillSelectionViewController()
            self?.present(newVC, animated: true)
            newVC.completion = { [weak self] text, image in
                guard let self = self else { return }
                self.image.image = image
                //self.label.text = text
            }
        })
    }()

    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "matrix")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(button)
        setConstraintsForButton()

        view.addSubview(image)
        setConstraintsForImage()
    }

}

// MARK: layout
private extension MatrixViewController {
    func setConstraintsForButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -26).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }

    func setConstraintsForImage() {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -26).isActive = true
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        image.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65).isActive = true
    }
}
