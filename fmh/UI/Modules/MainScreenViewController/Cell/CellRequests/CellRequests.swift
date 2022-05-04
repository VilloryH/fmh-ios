//
//  CellRequests.swift
//  fmh
//
//  Created: 30.04.22
//

import UIKit

class CellRequests: UITableViewCell {
    
    let taskThemeLabel = UILabel(text: "тема", font: .avenirNextDemiBold20())
    let taskDescription = UILabel(text: "заменить матрац", font: .avenirNextDemiBold20())
    let patientLabel = UILabel(text: "пациент", font: .avenirNextDemiBold20())
    let patientName = UILabel(text: "А.Н.Акопова", font: .avenirNextDemiBold20())
    let executorLabel = UILabel(text: "исполнитель", font: .avenirNextDemiBold20())
    let executorName = UILabel(text: "М.Л.Павлов", font: .avenirNextDemiBold20())
    let taskDateLabel = UILabel(text: "10.19.22", font: .avenirNextDemiBold20())
    let taskDate = UILabel(text: "10.19.22", font: .avenirNextDemiBold20())
    let tasklTime = UILabel(text: "9:00", font: .avenirNextDemiBold14())
    
    //let taskColor = "77C344"
    
    let openTask: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Vector"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let newsIcon: UIImageView = {
        let image = UIImage(named: "Announcement")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let newLabel = UILabel(text: "Text", font: .avenirNextDemiBold20())
    
    let newDate: UILabel = {
        let label = UILabel(text: "11.11.22", font: .avenirNextDemiBold20())
        label.textColor = #colorLiteral(red: 0.8901960784, green: 0.8901960784, blue: 0.8901960784, alpha: 1)
        return label
    }()
    
    let cellLabel: UILabel = {
        let cell = UILabel()
        return cell
    }()
    
    let openRequestButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Arrow"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.layer.cornerRadius = 15
        self.layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        self.openRequestButton.addTarget(self, action: #selector(openRequest), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func openRequest() {
        print("request")
    }
    
    func setConstraints() {
        
        //self.addSubview(openRequestButton)
//        NSLayoutConstraint.activate([
//            openRequestButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
//            openRequestButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
//            openRequestButton.widthAnchor.constraint(equalToConstant: 12),
//            openRequestButton.heightAnchor.constraint(equalToConstant: 8)
//        ])
        
        let themeStackView = UIStackView(arrangedSubviews: [taskThemeLabel, taskDescription], axis: .horizontal, spacing: 10, distribution: .equalSpacing)
        self.addSubview(themeStackView)
        NSLayoutConstraint.activate([
            themeStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            themeStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            themeStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            themeStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        let patientStackView = UIStackView(arrangedSubviews: [patientLabel, patientName], axis: .horizontal, spacing: 10, distribution: .equalSpacing)
        self.addSubview(patientStackView)
        NSLayoutConstraint.activate([
            patientStackView.topAnchor.constraint(equalTo: themeStackView.bottomAnchor, constant: 5),
            patientStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            patientStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            patientStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let executorStackView = UIStackView(arrangedSubviews: [executorLabel, executorName], axis: .horizontal, spacing: 10, distribution: .equalSpacing)
        self.addSubview(executorStackView)
        NSLayoutConstraint.activate([
            executorStackView.topAnchor.constraint(equalTo: patientStackView.bottomAnchor, constant: 5),
            executorStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            executorStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            executorStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let planeDateStackView = UIStackView(arrangedSubviews: [taskDateLabel, taskDate, tasklTime], axis: .horizontal, spacing: 10, distribution: .equalSpacing)
        self.addSubview(planeDateStackView)
        NSLayoutConstraint.activate([
            planeDateStackView.topAnchor.constraint(equalTo: executorStackView.bottomAnchor, constant: 5),
            planeDateStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            planeDateStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            //planeDateStackView.widthAnchor.constraint(equalToConstant: self.frame.width),
            planeDateStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

