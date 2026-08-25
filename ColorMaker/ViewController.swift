//
//  ViewController.swift
//  ColorMaker
//
//  Created by Moaz on 25/08/2026.
//

import UIKit

class ViewController: UIViewController {
    
    var colorView: UIView!
    
    var redControl: UISwitch!
    var greenControl: UISwitch!
    var blueControl: UISwitch!
    
    var redControlLabel: UILabel!
    var greenControlLabel: UILabel!
    var blueControlLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .black
        
        colorView = UIView()
        colorView.backgroundColor = .clear
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.layer.borderWidth = 5
        colorView.layer.borderColor = UIColor.white.cgColor
        
        redControl = UISwitch()
        
        redControlLabel = UILabel()
        redControlLabel.text = "Red"
        redControlLabel.textColor = .red
        redControlLabel.translatesAutoresizingMaskIntoConstraints = false

        
        greenControlLabel = UILabel()
        greenControlLabel.text = "Green"
        greenControlLabel.textColor = .green
        greenControlLabel.translatesAutoresizingMaskIntoConstraints = false

        
        blueControlLabel = UILabel()
        blueControlLabel.text = "Blue"
        blueControlLabel.textColor = .blue
        blueControlLabel.translatesAutoresizingMaskIntoConstraints = false
        
        redControl = UISwitch()
        redControl.translatesAutoresizingMaskIntoConstraints = false
        redControl.tag = 0
        redControl.addTarget(self, action: #selector(changeValue(_:)), for: .valueChanged)
        
        
        greenControl = UISwitch()
        greenControl.translatesAutoresizingMaskIntoConstraints = false
        greenControl.tag = 1
        greenControl.addTarget(self, action: #selector(changeValue(_:)), for: .valueChanged)
        
        blueControl = UISwitch()
        blueControl.translatesAutoresizingMaskIntoConstraints = false
        blueControl.tag = 2
        blueControl.addTarget(self, action: #selector(changeValue(_:)), for: .valueChanged)

        view.addSubview(colorView)
        view.addSubview(redControlLabel)
        view.addSubview(greenControlLabel)
        view.addSubview(blueControlLabel)
        view.addSubview(redControl)
        view.addSubview(greenControl)
        view.addSubview(blueControl)
        
        NSLayoutConstraint.activate([
            colorView.widthAnchor.constraint(equalToConstant: 200),
            colorView.heightAnchor.constraint(equalToConstant: 200),
            colorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
         
            redControlLabel.bottomAnchor.constraint(equalTo: greenControlLabel.topAnchor, constant: -16),
            redControlLabel.leadingAnchor.constraint(equalTo: greenControlLabel.leadingAnchor),
            
            greenControlLabel.bottomAnchor.constraint(equalTo: blueControlLabel.topAnchor, constant: -16),
            greenControlLabel.leadingAnchor.constraint(equalTo: blueControlLabel.leadingAnchor),
            
            blueControlLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -32),
            blueControlLabel.bottomAnchor.constraint(equalTo: colorView.topAnchor, constant: -32),
            
            redControl.topAnchor.constraint(equalTo: redControlLabel.topAnchor),
            redControl.leadingAnchor.constraint(equalTo: greenControl.leadingAnchor),
            
            greenControl.topAnchor.constraint(equalTo: greenControlLabel.topAnchor),
            greenControl.leadingAnchor.constraint(equalTo: blueControl.leadingAnchor),
            
            blueControl.topAnchor.constraint(equalTo: blueControlLabel.topAnchor),
            blueControl.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 32),
        ])
    }
    
    @objc func changeValue(_ sender: UISwitch) {
        switch sender.tag {
        case 0: colorView.backgroundColor = redControl.isOn ? .red : .clear
        case 1: colorView.backgroundColor = greenControl.isOn ? .green : .clear
        case 2: colorView.backgroundColor = blueControl.isOn ? .blue : .clear
        default: break
        }
    }
}

