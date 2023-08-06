//
//  File.swift
//  testAutolayoutInCode
//
//  Created by Oksenoyt on 05.08.2023.
//

import Foundation
import UIKit

class CircleView: UIView {

    init() {
        super.init(frame: .zero)
        settings()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func settings() {
        sizeToFit()
        backgroundColor = .brown
        }
}
