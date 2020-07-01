//
//  PieChartView.swift
//  PieChartExample
//
//  Created by Zafar on 7/1/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit

@IBDesignable class PieChartView: UIView {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Drawing
    override func draw(_ rect: CGRect) {
        drawSegments(segments)
    }
    
    // MARK: - Actions
    private func drawSegments(_ segments: [Segment]) {
        let center = CGPoint(
            x: bounds.width / 2,
            y: bounds.height / 2
        )
        
        let radius = max(
            bounds.width / 2,
            bounds.height / 2
        )
        
        let sortedSegments = segments.sorted(by: >)
        
        var startAngle: CGFloat = (3 * .pi) / 2
        
        for segment in sortedSegments {
            let endAngle = (startAngle + (((segment.ratio * 360) * .pi) / 180))
            
            drawSegment(
                center: center,
                radius: radius,
                startAngle: startAngle,
                endAngle: endAngle,
                color: segment.color
            )
            startAngle = endAngle
        }
        
    }
    
    private func drawSegment(center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, color: UIColor) {
        
        let path = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true
        )
    
        path.addLine(to: center)
        
        color.setFill()
        path.fill()
    }
    
    // MARK: - Segments
    struct Segment: Comparable {
        let ratio: CGFloat
        let color: UIColor
        
        static func < (lhs: PieChartView.Segment, rhs: PieChartView.Segment) -> Bool {
            return lhs.ratio < rhs.ratio
        }
    }
    
    var segments: [Segment] = [
        .init(ratio: 0.25, color: .darkGray),
        .init(ratio: 0.4, color: .systemYellow),
        .init(ratio: 0.35, color: .systemBlue),
    ] {
        didSet {
            self.setNeedsDisplay()
        }
    }
}


