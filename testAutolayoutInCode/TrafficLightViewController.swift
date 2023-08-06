//
//  ViewController.swift
//  testAutolayoutInCode
//
//  Created by Oksenoyt on 04.08.2023.
//

import UIKit

enum TrafficLightColor {
    case red, yellow, green, lightOff
}

class TrafficLightViewController: UIViewController {
    private let circleRed = UIView()
    private let circleYellow = UIView()
    private let circleGreen = UIView()
    private let circleSize = 0.35
    private var isActive = false
    private var currentColor = TrafficLightColor.lightOff

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("START", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupCircle()
        view.addSubview(button)
        setConstraintsForButton()
        buttonAction()
    }

    // MARK: settings for circle
    func setupCircle() {
        view.addSubview(circleRed)
        view.addSubview(circleYellow)
        view.addSubview(circleGreen)
        setConstraintsForCircle()
        settingsCircle(circle: circleRed, color: .red)
        settingsCircle(circle: circleYellow, color: .yellow)
        settingsCircle(circle: circleGreen, color: .green)
    }

    private func settingsCircle(circle: UIView, color: UIColor) {
        circle.backgroundColor = color
        circle.layer.cornerRadius = view.bounds.width * circleSize / 2
        circle.layer.borderWidth = 3
        circle.layer.borderColor = UIColor.white.cgColor
        circle.layer.opacity = 0.3
    }

    // MARK: settings for button
    private func buttonAction() {
        button.addTarget(self, action: #selector(switchCircle), for: .touchUpInside)
        button.setTitle("NEXT", for: .normal)
    }

    @objc private func switchCircle() {
        let lightIsOn: Float = 1
        let lightIsOff: Float = 0.3

        switch currentColor {
        case .lightOff:
            circleRed.layer.opacity = lightIsOn
            currentColor = .red
        case .red:
            circleRed.layer.opacity = lightIsOff
            circleYellow.layer.opacity = lightIsOn
            currentColor = .yellow
        case .yellow:
            circleYellow.layer.opacity = lightIsOff
            circleGreen.layer.opacity =   lightIsOn
            currentColor = .green
        case .green:
            circleGreen.layer.opacity = lightIsOff
            circleRed.layer.opacity = lightIsOn
            currentColor = .red
        }
    }
}

// MARK: layout
private extension TrafficLightViewController {
    func setConstraintsForCircle() {
        circleRed.translatesAutoresizingMaskIntoConstraints = false
        circleRed.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: circleSize).isActive = true
        circleRed.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: circleSize).isActive = true
        circleRed.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        circleRed.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        circleYellow.translatesAutoresizingMaskIntoConstraints = false
        circleYellow.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: circleSize).isActive = true
        circleYellow.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: circleSize).isActive = true
        circleYellow.topAnchor.constraint(equalTo: circleRed.bottomAnchor, constant: 30).isActive = true
        circleYellow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        circleGreen.translatesAutoresizingMaskIntoConstraints = false
        circleGreen.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: circleSize).isActive = true
        circleGreen.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: circleSize).isActive = true
        circleGreen.topAnchor.constraint(equalTo: circleYellow.bottomAnchor, constant: 30).isActive = true
        circleGreen.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    func setConstraintsForButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -26).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
}

