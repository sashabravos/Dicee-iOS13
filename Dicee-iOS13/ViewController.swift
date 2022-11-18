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
        let backgroundImage = UIImageView.init(image: UIImage(named: "GreenBackground")!)
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
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layoutSubviews()
    }
    
    private func layoutSubviews() {
        view.addSubview(self.backgroundImage)
        view.addSubview(self.logo)
        view.addSubview(self.cubeOne)
        view.addSubview(self.cubeTwo)
        view.addSubview(self.rollButton)
        
        //MARK: - Constraints
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            logo.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 100)
        ])
        
        cubeOne.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cubeOne.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: backgroundImage.frame.midX / 3),
            cubeOne.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: backgroundImage.frame.size.height),
            cubeOne.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -363),
            cubeOne.rightAnchor.constraint(equalTo: backgroundImage.rightAnchor, constant: -223),
        ])
        
        cubeTwo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        cubeTwo.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: backgroundImage.frame.midX),
        cubeTwo.topAnchor.constraint(equalTo: cubeOne.topAnchor),
        cubeTwo.bottomAnchor.constraint(equalTo: cubeOne.bottomAnchor),
        cubeTwo.heightAnchor.constraint(equalTo: cubeOne.heightAnchor),
        cubeTwo.widthAnchor.constraint(equalTo: cubeOne.widthAnchor)
    ])
        
    
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rollButton.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 120),
            rollButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -170),
            rollButton.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            rollButton.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor, constant: 250)
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
}
