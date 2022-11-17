//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Function
    
    @objc func buttonAction(sender: UIButton!) {

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //MARK: - Objects
        
        let backgroundImage = UIImageView.init(image: UIImage(named: "GreenBackground")!)
        backgroundImage.contentMode = .scaleToFill
        
        let logo = UIImageView.init(image: UIImage(named: "DiceeLogo")!)
        logo.contentMode = .scaleAspectFit
        
        let diceOne = UIImageView.init(image: UIImage(named: "DiceOne")!)
        diceOne.frame = CGRect(x: Int(backgroundImage.frame.midX / 3),
                               y: Int(backgroundImage.frame.size.height),
                               width: 120, height: 120)
        
        let diceTwo = UIImageView.init(image: UIImage(named: "DiceTwo")!)
        diceTwo.frame = CGRect(x: Int(backgroundImage.frame.midX) ,
                               y: Int(backgroundImage.frame.size.height),
                               width: 120, height: 120)
        
        let button = UIButton()
        button.setTitle("Roll", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "buttonColor")
        button.center = view.center
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)

    // MARK: - Lifecycle
        
        view.addSubview(backgroundImage)
        view.addSubview(logo)
        view.addSubview(diceOne)
        view.addSubview(diceTwo)
        view.addSubview(button)

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
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 120),
            button.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor, constant: 250),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -170)
        ])

        


        
        
        
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
}


                
        





