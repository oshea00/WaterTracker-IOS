//
//  ViewController.swift
//  Flo
//
//  Created by mike oshea on 12/30/18.
//  Copyright © 2018 Future Trends. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isGraphViewShowing: Bool = false
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var graphView: GraphView!
    @IBOutlet weak var daysView: UIStackView!
    @IBOutlet weak var maxDrunk: UILabel!
    @IBOutlet weak var avgDrunk: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(counterView.counter)
        // Do any additional setup after loading the view, typically from a nib.
    }

    func setupUI() {
        let maxDayIndex = daysView.arrangedSubviews.count - 1
        graphView.graphPoints[graphView.graphPoints.count-1] = counterView.counter
        graphView.setNeedsDisplay()
        maxDrunk.text = "\(graphView.graphPoints.max()!)"
        
        let avg = graphView.graphPoints.reduce(0,+) / graphView.graphPoints.count
        avgDrunk.text = "\(avg)"
        
        let today = Date()
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EEEEE")
        
        for i in 0...maxDayIndex {
            if let date = calendar.date(byAdding: .day, value: -i, to: today),
                let label = daysView.arrangedSubviews[maxDayIndex - i] as? UILabel {
                label.text = formatter.string(from: date)
            }
        }
    }
    
    @IBAction func pushButtonPressed(_ sender: PushButton) {
        if sender.isAddButton {
            counterView.counter += 1
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        counterLabel.text = String(counterView.counter)
        if isGraphViewShowing {
            swapViews()
        }
    }
    
    func swapViews() {
        if isGraphViewShowing {
            UIView.transition(from: graphView, to: counterView, duration: 1.0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        } else {
            UIView.transition(from: counterView, to: graphView, duration: 1.0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
        isGraphViewShowing = !isGraphViewShowing
    }
    
    @IBAction func counterViewTap(_ sender: UITapGestureRecognizer) {
        swapViews()
        setupUI()
    }
    
}

