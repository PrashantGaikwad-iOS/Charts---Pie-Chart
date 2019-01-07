//
//  ViewController.swift
//  Charts - Pie Chart
//
//  Created by Prashant G on 1/7/19.
//  Copyright © 2019 Prashant G. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var pieChart: PieChartView!
    @IBOutlet var macOSStepper: UIStepper!
    @IBOutlet var iOSStepper: UIStepper!
    
    //MARK: - Global Properties
    var iosDataEntry = PieChartDataEntry(value: 0)
    var macDataEntry = PieChartDataEntry(value: 0)
    
    var pieChartDataEnteries = [PieChartDataEntry]()
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieChart.chartDescription?.text = "Pie Chart Description"
        
        iosDataEntry.value = iOSStepper.value
        iosDataEntry.label = "iOS"
        
        macDataEntry.value = macOSStepper.value
        macDataEntry.label = "macOS"
        
        pieChartDataEnteries = [iosDataEntry, macDataEntry]
    
        updatePieChartData()
        
    }
    
    
    //MARK: - IBActions
    @IBAction func changeIOS(_ sender: UIStepper) {
        iosDataEntry.value = sender.value
        updatePieChartData()
    }
    
    @IBAction func changeMacOS(_ sender: UIStepper) {
        macDataEntry.value = sender.value
        updatePieChartData()
    }

    //MARK: - Custom Actions
    func updatePieChartData() {
        
        let pieChartDataSet = PieChartDataSet(values: pieChartDataEnteries, label: nil)
        let chartData = PieChartData(dataSet: pieChartDataSet)
        
        let colors = [UIColor(named: "iosColor"), UIColor(named: "macColor")]
        pieChartDataSet.colors = colors as! [NSUIColor]
        
        pieChart.data = chartData
    }

}

