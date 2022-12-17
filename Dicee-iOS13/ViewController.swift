//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allCubesImageNames = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    
    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView.init(image: UIImage(named: "GreenBackground") ?? UIImage())
        backgroundImage.contentMode = .scaleToFill
        return backgroundImage
    }()
    
    private lazy var logo: UIImageView = {
        let logo = UIImageView.init(image: UIImage(named: "DiceeLogo")!)
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    
    private lazy var cubeOne: UIImageView = {
        let cubeOne = UIImageView.init(image: getRandomImage())
        return cubeOne
    }()
    
    private lazy var cubeTwo: UIImageView = {
        let cubeTwo = UIImageView.init(image: getRandomImage())
        return cubeTwo
    }()
    
    private lazy var rollButton: UIButton = {
        let button = UIButton()
        button.setTitle("Roll", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "buttonColor")
        button.layer.cornerRadius = Constants.rollButtonCornerRadius
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: Constants.titleLabelFontSize)
        button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layoutSubviews()
    }
    
    private func layoutSubviews() {
        let subviews = [self.backgroundImage, self.logo, self.cubeOne, self.cubeTwo, self.rollButton]
        subviews.forEach { view.addSubview($0) }
        
//MARK: - Constraints
        
        let translatesAutoresizingMaskIntoConstraints = [self.backgroundImage, self.logo, self.cubeOne, self.cubeTwo, self.rollButton]
        translatesAutoresizingMaskIntoConstraints.forEach { ($0).translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.topAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: view.topAnchor, multiplier: 7),

            cubeOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            cubeOne.topAnchor.constraint(lessThanOrEqualTo: logo.bottomAnchor, constant: 120),
            cubeOne.widthAnchor.constraint(equalToConstant: 120),
            cubeOne.heightAnchor.constraint(equalTo: cubeOne.widthAnchor),

            cubeTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 60),
            cubeTwo.topAnchor.constraint(equalTo: cubeOne.topAnchor),
            cubeTwo.heightAnchor.constraint(equalTo: cubeOne.heightAnchor),
            cubeTwo.widthAnchor.constraint(equalTo: cubeOne.widthAnchor),

            rollButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            rollButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -170),
            rollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 250)
        ])
    }

//MARK: - Function
    
    @objc func buttonAction(sender: UIButton!) {
        self.cubeOne.image = getRandomImage()
        self.cubeTwo.image = getRandomImage()
    }
    
    private func getRandomImage() -> UIImage? {
        UIImage(named: self.allCubesImageNames.randomElement() ?? "")
    }
    
    private enum Constants {
        static let rollButtonCornerRadius: CGFloat = 15
        static let titleLabelFontSize: CGFloat = 30
    }
}
