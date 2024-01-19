//
//  HeartRateView.swift
//  HeartRateUI
//
//  Created by iPHTech 28 on 19/01/24.
//

import Foundation
import UIKit

class HeartRateView: UIView {
    let heartRateData = [60, 70, 80, 90, 100, 110, 120]
    let daysOfWeek = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]
    let recentReadings = ["Today (14:00)", "Today (13:00)"]
    let recentValues = [125, 110]
    let avgHeartRate = 57
    let bpmRange = "40-189 bpm"
    let dateRange = "10 - 17 Sep 2022"
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        let width = rect.width
        let height = rect.height
        let margin: CGFloat = 20
        let graphHeight = height * 0.7
        let graphWidth = width  - margin * 2

        let barWidth = graphWidth / CGFloat(heartRateData.count)
        let barMargin: CGFloat = 2
        let barHeight = graphHeight - margin * 2
        let barMaxHeight = barHeight - margin * 2
        let barMinHeight = barHeight * 0.2
        let barX = margin
        let barY = height - graphHeight - margin
        
        for i in 0..<heartRateData.count - 1 {
            let x = barX + CGFloat(i + 1) * barWidth
            let linePath = UIBezierPath()
            linePath.move(to: CGPoint(x: x, y: barY))
            linePath.addLine(to: CGPoint(x: x, y: barY + barMaxHeight))
            linePath.lineWidth = 1
            UIColor.black.setStroke()
            linePath.stroke()
        }
        
        // Draw title
        let title = "Heart Rate"
        let titleFont = UIFont.systemFont(ofSize: 24, weight: .bold)
        let titleAttributes = [NSAttributedString.Key.font: titleFont]
        let titleSize = title.size(withAttributes: titleAttributes)
        let titleX = (width - titleSize.width) / 2
        let titleY = margin
        title.draw(at: CGPoint(x: titleX, y: titleY), withAttributes: titleAttributes)
        
        // Draw full stats
        let fullStats = "Full stats"
        let fullStatsFont = UIFont.systemFont(ofSize: 16, weight: .regular)
        let fullStatsAttributes = [NSAttributedString.Key.font: fullStatsFont]
        let fullStatsSize = fullStats.size(withAttributes: fullStatsAttributes)
        let fullStatsX = width - margin - fullStatsSize.width
        let fullStatsY = margin
        fullStats.draw(at: CGPoint(x: fullStatsX, y: fullStatsY), withAttributes: fullStatsAttributes)
        
        // Draw range
        let range = "\(bpmRange)\n\(dateRange)"
        let rangeFont = UIFont.systemFont(ofSize: 16, weight: .regular)
        let rangeAttributes = [NSAttributedString.Key.font: rangeFont]
        let rangeSize = range.size(withAttributes: rangeAttributes)
        let rangeX = margin
        let rangeY = titleY + titleSize.height + margin
        range.draw(at: CGPoint(x: rangeX, y: rangeY), withAttributes: rangeAttributes)
        
        
        // Draw graph
        let maxHeartRate = heartRateData.max()!
        let minHeartRate = heartRateData.min()!
        let avgY = barY + barMaxHeight - CGFloat(avgHeartRate - minHeartRate) / CGFloat(maxHeartRate - minHeartRate) * barMaxHeight
        let avgLine = UIBezierPath()
        avgLine.move(to: CGPoint(x: barX, y: avgY))
        avgLine.addLine(to: CGPoint(x: barX + graphWidth, y: avgY))
        avgLine.lineWidth = 1
        UIColor.black.setStroke()
        avgLine.stroke()
        
        
        
        for i in 0..<heartRateData.count {
            let x = barX + CGFloat(i) * barWidth
            let y = barY + barMaxHeight - CGFloat(heartRateData[i] - minHeartRate) / CGFloat(maxHeartRate - minHeartRate) * barMaxHeight

            // Draw rounded rectangle bar
            let bar = UIBezierPath(roundedRect: CGRect(x: x + barMargin, y: y, width: barWidth - barMargin * 2, height: barMaxHeight - y + barY), cornerRadius: 12.0)
            UIColor.red.setFill()
            bar.fill()

            // Draw dot with rounded corners
//            let dotRadius: CGFloat = 1.0
//            let dot = UIBezierPath(roundedRect: CGRect(x: x + barWidth / 2 - dotRadius, y: y - dotRadius, width: dotRadius * 2, height: dotRadius * 2), cornerRadius: dotRadius)
            UIColor.black.setFill()
      //      dot.fill()

            // Draw day of the week label
            let dayOfWeek = daysOfWeek[i]
            let dayOfWeekFont = UIFont.systemFont(ofSize: 12, weight: .regular)
            let dayOfWeekAttributes = [NSAttributedString.Key.font: dayOfWeekFont]
            let dayOfWeekSize = dayOfWeek.size(withAttributes: dayOfWeekAttributes)
            let dayOfWeekX = x + (barWidth - dayOfWeekSize.width) / 2
            let dayOfWeekY = barY + barMaxHeight
        }

    }
    
}
