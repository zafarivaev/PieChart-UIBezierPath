//
//  ViewController.swift
//  PieChartExample
//
//  Created by Zafar on 7/1/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(pieChartView)
        
        NSLayoutConstraint.activate([
            pieChartView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            pieChartView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            pieChartView.widthAnchor.constraint(equalToConstant: 300),
            pieChartView.heightAnchor.constraint(equalTo: pieChartView.widthAnchor),
        ])
    }
    
    lazy var pieChartView: PieChartView = {
        let pieChart = PieChartView()
        pieChart.backgroundColor = .white
        pieChart.segments = [
            .init(ratio: 0.15, color: .darkGray),
            .init(ratio: 0.2, color: .systemYellow),
            .init(ratio: 0.05, color: .systemRed),
            .init(ratio: 0.25, color: .systemTeal),
            .init(ratio: 0.3, color: .systemPurple),
            .init(ratio: 0.2, color: .systemBlue),
        ]
        pieChart.translatesAutoresizingMaskIntoConstraints = false
        return pieChart
    }()


}

