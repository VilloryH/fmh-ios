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
    
    var taskColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
    var separateLine = UIColor.red
    
    let openTask: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Vector"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.openTask.addTarget(self, action: #selector(openTaskAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(borderColor: CGColor, separateLine: UIColor) {
        let cellView: UIView = {
            let cell = UIView()
            
            cell.frame = CGRect(x: 20, y: 20, width: self.frame.width - 40, height: self.frame.height - 30)
            cell.layer.cornerRadius = 10
            cell.layer.borderWidth = 2
            cell.layer.borderColor =  borderColor
            
            func separateLines(frame: CGRect, colour: UIColor) -> UIView {
                let viewSeparatorLine = UIView(frame: frame)   // разделитель ячеек
                viewSeparatorLine.backgroundColor = colour
                return viewSeparatorLine
            }
            
            self.contentView.addSubview(separateLines(frame: CGRect(x: 30, y: 63, width: self.contentView.frame.size.width - 60, height: 2), colour: separateLine))
            self.contentView.addSubview(separateLines(frame: CGRect(x: 30, y: 99, width: self.contentView.frame.size.width - 60, height: 2), colour: separateLine))
            self.contentView.addSubview(separateLines(frame: CGRect(x: 30, y: 131, width: self.contentView.frame.size.width - 60, height: 2), colour: separateLine))
            self.contentView.addSubview(separateLines(frame: CGRect(x: 30, y: 165, width: self.contentView.frame.size.width - 60, height: 2), colour: separateLine))
            return cell
        }()
        
        let themeStackView = UIStackView(arrangedSubviews: [taskThemeLabel, taskDescription], axis: .horizontal, spacing: 10, distribution: .equalSpacing)
        cellView.addSubview(themeStackView)
        NSLayoutConstraint.activate([
            themeStackView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            themeStackView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            themeStackView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            themeStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        let patientStackView = UIStackView(arrangedSubviews: [patientLabel, patientName], axis: .horizontal, spacing: 10, distribution: .equalSpacing)
        cellView.addSubview(patientStackView)
        NSLayoutConstraint.activate([
            patientStackView.topAnchor.constraint(equalTo: themeStackView.bottomAnchor, constant: 5),
            patientStackView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            patientStackView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            patientStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        let executorStackView = UIStackView(arrangedSubviews: [executorLabel, executorName], axis: .horizontal, spacing: 10, distribution: .equalSpacing)
        cellView.addSubview(executorStackView)
        NSLayoutConstraint.activate([
            executorStackView.topAnchor.constraint(equalTo: patientStackView.bottomAnchor, constant: 5),
            executorStackView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            executorStackView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            executorStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        let planeDateStackView = UIStackView(arrangedSubviews: [taskDateLabel, taskDate, tasklTime], axis: .horizontal, spacing: 10, distribution: .equalSpacing)
        cellView.addSubview(planeDateStackView)
        NSLayoutConstraint.activate([
            planeDateStackView.topAnchor.constraint(equalTo: executorStackView.bottomAnchor, constant: 5),
            planeDateStackView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            planeDateStackView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            planeDateStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        cellView.addSubview(openTask)
        NSLayoutConstraint.activate([
            openTask.topAnchor.constraint(equalTo: planeDateStackView.bottomAnchor, constant: 8),
            openTask.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: self.bounds.width / 2 - 20),
            openTask.widthAnchor.constraint(equalToConstant: 15),
        ])
        
        self.addSubview(cellView)
    }
    
    @objc func openTaskAction() {
           print("open task")
       }
    
}
