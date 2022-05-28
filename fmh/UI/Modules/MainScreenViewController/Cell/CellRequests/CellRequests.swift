//
//  CellRequests.swift
//  fmh
//
//  Created: 30.04.22
//

import UIKit

class CellRequests: UITableViewCell {
    
    private let taskThemeLabel = UILabel(text: "тема", font: .avenirNextDemiBold20())
    private let taskDescription = UILabel(text: "заменить матрац", font: .avenirNextDemiBold20())
    private let patientLabel = UILabel(text: "пациент", font: .avenirNextDemiBold20())
    private let patientName = UILabel(text: "А.Н.Акопова", font: .avenirNextDemiBold20())
    private let executorLabel = UILabel(text: "исполнитель", font: .avenirNextDemiBold20())
    private let executorName = UILabel(text: "М.Л.Павлов", font: .avenirNextDemiBold20())
    private let taskDateLabel = UILabel(text: "10.19.22", font: .avenirNextDemiBold20())
    private let taskDate = UILabel(text: "10.19.22", font: .avenirNextDemiBold20())
    private let tasklTime = UILabel(text: "9:00", font: .avenirNextDemiBold14())
    
    private var taskColor = CGColor(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    private var separateLineColor = UIColor.red
    let lineFirst = UIView()
    let lineSecond = UIView()
    let linethird = UIView()
    let lineFourth = UIView()
    
    private let openTask = UIButton()
    
    private let cellView = UIView()
    private let resultView = UIView()
    
    let cellView = UIView()
    let resultView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.openTask.addTarget(self, action: #selector(openTaskAction), for: .touchUpInside)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
<<<<<<< HEAD
    func configureCell() {
        let separateLine = UIColor.red
    
        self.backgroundColor = UIColor(white: 0, alpha: 0)
        
       
        cellView.layer.cornerRadius = 10
        cellView.layer.borderWidth = 2
        cellView.layer.borderColor =  taskColor
        
        self.addSubview(resultView)
        resultView.backgroundColor = .white
        
        
        func separateLines(frame: CGRect, colour: UIColor) -> UIView {
            let viewSeparatorLine = UIView(frame: frame)   // разделитель ячеек
            viewSeparatorLine.backgroundColor = colour
            return viewSeparatorLine
        }
        self.contentView.addSubview(separateLines(frame: CGRect(x: 50, y: 55, width: self.contentView.bounds.width - 50, height: 1), colour: separateLine))
        self.contentView.addSubview(separateLines(frame: CGRect(x: 50, y: 90, width: self.contentView.frame.size.width - 50, height: 1), colour: separateLine))
        self.contentView.addSubview(separateLines(frame: CGRect(x: 50, y: 125, width: self.contentView.frame.size.width - 50, height: 1), colour: separateLine))
        self.contentView.addSubview(separateLines(frame: CGRect(x: 50, y: 160, width: self.contentView.frame.size.width - 50, height: 1), colour: separateLine))
        
        
        //let sepcell = UIView()
        
        self.cellView.addSubview(separateLines(frame: CGRect(x: 0, y: 0, width: self.cellView.bounds.width, height: self.cellView.bounds.height), colour: separateLine))
        
        self.resultView.addSubview(cellView)
        cellView.layer.cornerRadius = 10
        cellView.layer.borderWidth = 2
        cellView.layer.borderColor =  CGColor(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        cellView.backgroundColor = .white
=======
    private func configureCell() {
        self.backgroundColor = UIColor(white: 0, alpha: 0)
        
        self.addSubview(self.resultView)
        self.resultView.backgroundColor = .white

        self.resultView.addSubview(self.cellView)
        self.cellView.layer.cornerRadius = 10
        self.cellView.layer.borderWidth = 2
        self.cellView.layer.borderColor =  taskColor
        self.cellView.backgroundColor = .white
        
        self.openTask.setBackgroundImage(UIImage(named: "Vector"), for: .normal)
>>>>>>> mainScreen
        
        let themeStackView = UIStackView(arrangedSubviews: [self.taskThemeLabel, self.taskDescription], axis: .horizontal, spacing: 10, distribution: .equalSpacing)
        self.cellView.addSubview(themeStackView)
        NSLayoutConstraint.activate([
<<<<<<< HEAD
            themeStackView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 5),
            themeStackView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            themeStackView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
=======
            themeStackView.topAnchor.constraint(equalTo: self.cellView.topAnchor, constant: 5),
            themeStackView.leadingAnchor.constraint(equalTo: self.cellView.leadingAnchor, constant: 10),
            themeStackView.trailingAnchor.constraint(equalTo: self.cellView.trailingAnchor, constant: -10),
>>>>>>> mainScreen
            themeStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        let patientStackView = UIStackView(arrangedSubviews: [self.patientLabel, self.patientName], axis: .horizontal, spacing: 10, distribution: .equalSpacing)
        self.cellView.addSubview(patientStackView)
        NSLayoutConstraint.activate([
            patientStackView.topAnchor.constraint(equalTo: themeStackView.bottomAnchor, constant: 5),
            patientStackView.leadingAnchor.constraint(equalTo: self.cellView.leadingAnchor, constant: 10),
            patientStackView.trailingAnchor.constraint(equalTo: self.cellView.trailingAnchor, constant: -10),
            patientStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        let executorStackView = UIStackView(arrangedSubviews: [self.executorLabel, self.executorName], axis: .horizontal, spacing: 10, distribution: .equalSpacing)
        self.cellView.addSubview(executorStackView)
        NSLayoutConstraint.activate([
            executorStackView.topAnchor.constraint(equalTo: patientStackView.bottomAnchor, constant: 5),
            executorStackView.leadingAnchor.constraint(equalTo: self.cellView.leadingAnchor, constant: 10),
            executorStackView.trailingAnchor.constraint(equalTo: self.cellView.trailingAnchor, constant: -10),
            executorStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        let planeDateStackView = UIStackView(arrangedSubviews: [self.taskDateLabel, self.taskDate, self.tasklTime], axis: .horizontal, spacing: 10, distribution: .equalSpacing)
        self.cellView.addSubview(planeDateStackView)
        NSLayoutConstraint.activate([
            planeDateStackView.topAnchor.constraint(equalTo: executorStackView.bottomAnchor, constant: 5),
            planeDateStackView.leadingAnchor.constraint(equalTo: self.cellView.leadingAnchor, constant: 10),
            planeDateStackView.trailingAnchor.constraint(equalTo: self.cellView.trailingAnchor, constant: -10),
            planeDateStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        self.cellView.addSubview(self.openTask)
        self.openTask.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
<<<<<<< HEAD
            openTask.topAnchor.constraint(equalTo: planeDateStackView.bottomAnchor, constant: 5),
            openTask.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: self.bounds.width / 2 - 20),
            openTask.widthAnchor.constraint(equalToConstant: 15),
        ])
            
=======
            self.openTask.topAnchor.constraint(equalTo: planeDateStackView.bottomAnchor, constant: 5),
            self.openTask.centerXAnchor.constraint(equalTo: self.cellView.centerXAnchor),
            self.openTask.widthAnchor.constraint(equalToConstant: 15),
        ])
        
        let separateLines = [lineFirst, lineSecond, linethird, lineFourth]
        for line in separateLines {
        self.cellView.addSubview(line)
        line.backgroundColor = separateLineColor
        }
                                 
>>>>>>> mainScreen
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.resultView.frame = CGRect(x: 20, y: 0, width: self.bounds.width - 40, height: self.bounds.height)
        self.cellView.frame = CGRect(x: 20, y: 20, width: self.resultView.bounds.width - 40, height: self.resultView.bounds.height - 40)
<<<<<<< HEAD
    }
    
    @objc func openTaskAction() {
        print("open task")
        
=======
        self.lineFirst.frame = setSepatateLines(y: 37)
        self.lineSecond.frame = setSepatateLines(y: 75)
        self.linethird.frame = setSepatateLines(y: 105)
        self.lineFourth.frame = setSepatateLines(y: 140)
    }
    
    private func setSepatateLines(y: Double) -> CGRect {
    return CGRect(x: self.cellView.bounds.minX + 10, y: y , width: self.cellView.bounds.width - 20, height: 1)
    }
    
    @objc private  func openTaskAction() {
        print("open task")
>>>>>>> mainScreen
    }
}

