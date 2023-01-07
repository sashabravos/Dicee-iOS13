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
    
    private lazy var topView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var logo: UIImageView = {
        let logo = UIImageView.init(image: UIImage(named: "DiceeLogo")!)
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    
    private lazy var middleView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var stackViewForCubes: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing = Constants.spaceBetweenCubes
        return stackView
    }()
    
    private lazy var cubeOne: UIImageView = {
        let cubeOne = UIImageView.init(image: getRandomImage())
        return cubeOne
    }()
    
    private lazy var cubeTwo: UIImageView = {
        let cubeTwo = UIImageView.init(image: getRandomImage())
        return cubeTwo
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        return view
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
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fillEqually
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing   = 4.0
        return stackView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layoutSubviews()
    }
    
    private func layoutSubviews() {
        
        topView.addSubview(self.logo)
        
        let viewsOfMiddleView = [self.cubeOne, self.cubeTwo]
        viewsOfMiddleView.forEach { stackViewForCubes.addArrangedSubview($0) }
        
        middleView.addSubview(stackViewForCubes)
        
        bottomView.addSubview(self.rollButton)
        
        let viewsOfStackView = [self.topView, self.middleView, self.bottomView]
        viewsOfStackView.forEach { stackView.addArrangedSubview($0) }
        
        let subviews = [self.backgroundImage,
                        self.stackView]
        subviews.forEach { view.addSubview($0) }
    
//MARK: - Constraints
        
//        let translatesAutoresizingMaskIntoConstraints = [self.backgroundImage, self.logo, self.cubeOne, self.cubeTwo, self.rollButton, self.topView, self.middleView, self.stackViewForCubes, self.bottomView, self.stackView]
        let translatesAutoresizingMaskIntoConstraints = [self.backgroundImage, self.logo, self.rollButton, self.stackViewForCubes, self.stackView]
        translatesAutoresizingMaskIntoConstraints.forEach { ($0).translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),

            logo.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: topView.centerYAnchor),

            stackViewForCubes.centerXAnchor.constraint(equalTo: middleView.centerXAnchor),
            stackViewForCubes.centerYAnchor.constraint(equalTo: middleView.centerYAnchor),

            rollButton.widthAnchor.constraint(greaterThanOrEqualTo: rollButton.widthAnchor, constant: Constants.rollButtonWidth),
            rollButton.heightAnchor.constraint(equalTo: rollButton.heightAnchor, constant: Constants.rollButtonHeight),
            rollButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            rollButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor)
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
        static let rollButtonWidth: CGFloat = 100
        static let rollButtonHeight: CGFloat = 50
        static let spaceBetweenCubes: CGFloat = 51
    }
}
