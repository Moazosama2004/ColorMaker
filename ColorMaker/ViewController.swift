//
//  ViewController.swift
//  ColorMaker
//
//  Created by Moaz on 25/08/2026.
//

import UIKit

class ViewController: UIViewController {
    
    var colorView: UIView!
    
    var redControl: UISlider!
    var greenControl: UISlider!
    var blueControl: UISlider!
    
    var redControlLabel: UILabel!
    var greenControlLabel: UILabel!
    var blueControlLabel: UILabel!
    
    var sliderValue : Float = 0.0

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
        
        redControl = UISlider()
        redControl.minimumTrackTintColor = .gray
        redControl.value = sliderValue
        redControl.translatesAutoresizingMaskIntoConstraints = false
        redControl.addTarget(self, action: #selector(changeValue(_:)), for: .valueChanged)
        
        
        greenControl = UISlider()
        greenControl.minimumTrackTintColor = .gray
        greenControl.value = sliderValue
        greenControl.translatesAutoresizingMaskIntoConstraints = false
        greenControl.addTarget(self, action: #selector(changeValue(_:)), for: .valueChanged)
        
        blueControl = UISlider()
        blueControl.minimumTrackTintColor = .gray
        blueControl.value = sliderValue
        blueControl.translatesAutoresizingMaskIntoConstraints = false
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
            
            redControl.widthAnchor.constraint(equalToConstant: 150),
            greenControl.widthAnchor.constraint(equalTo: redControl.widthAnchor),
            blueControl.widthAnchor.constraint(equalTo: redControl.widthAnchor),
         
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
            blueControl.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 82),
        ])
    }
    
    @objc func changeValue(_ sender: UISlider) {
        colorView.backgroundColor = UIColor(cgColor: CGColor(red: CGFloat(redControl.value), green: CGFloat(greenControl.value), blue: CGFloat(blueControl.value), alpha: 1))
    }
}

