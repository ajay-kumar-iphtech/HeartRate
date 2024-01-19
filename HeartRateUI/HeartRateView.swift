//
//  HeartRateView.swift
//  HeartRateUI
//
//  Created by iPHTech 28 on 19/01/24.
//

import Foundation
import UIKit

class HeartRateView: UIView {
    let heartRateData = [50, 60, 80, 90, 100, 90, 80]
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
        
        // vertical line
        for i in 0..<heartRateData.count - 1 {
            let x = barX + CGFloat(i + 1) * barWidth
            let linePath = UIBezierPath()
            linePath.move(to: CGPoint(x: x, y: barY + 5))  // Adjust the value (30) as needed to reduce the height from the top
            linePath.addLine(to: CGPoint(x: x, y: barY + barMaxHeight - 10))
            linePath.lineWidth = 1
            UIColor.lightGray.setStroke()
            linePath.stroke()
        }

        
        // Draw title
        let title = "Heart Rate"
        let titleFont = UIFont.systemFont(ofSize: 25, weight: .bold)
        let titleAttributes = [NSAttributedString.Key.font: titleFont]
        let titleSize = title.size(withAttributes: titleAttributes)
        let titleX = (width - titleSize.width) / 2
        let titleY = margin
        title.draw(at: CGPoint(x: titleX - 100, y: titleY), withAttributes: titleAttributes)
        
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
        let rangeFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        let rangeAttributes = [NSAttributedString.Key.font: rangeFont]
        let rangeSize = range.size(withAttributes: rangeAttributes)
        let rangeX = margin
        let rangeY = titleY + titleSize.height + margin
        range.draw(at: CGPoint(x: rangeX, y: rangeY), withAttributes: rangeAttributes)
        
        
        let day = "Today (14:00)"
        let dayFont = UIFont.systemFont(ofSize: 16, weight: .regular)
        let dayAttributes = [NSAttributedString.Key.font: dayFont]
        let daySize = day.size(withAttributes: dayAttributes)
        let dayX = margin
        let dayY = titleY + titleSize.height + margin
        day.draw(at: CGPoint(x: dayX, y: dayY + 520), withAttributes: dayAttributes)
        
        
        let number1 = "125"
        let number1Font = UIFont.systemFont(ofSize: 16, weight: .regular)
        let number1Attributes = [NSAttributedString.Key.font: number1Font]
        let number1Size = number1.size(withAttributes: number1Attributes)
        let number1X = margin
        let number1Y = titleY + titleSize.height + margin
        number1.draw(at: CGPoint(x: number1X + 300, y: number1Y + 520), withAttributes: dayAttributes)
        
        let day1 = "Today (13:00)"
        let day1Font = UIFont.systemFont(ofSize: 16, weight: .regular)
        let day1Attributes = [NSAttributedString.Key.font: day1Font]
        let day1Size = day.size(withAttributes: day1Attributes)
        let day1X = margin
        let day1Y = titleY + titleSize.height + margin
        day1.draw(at: CGPoint(x: day1X, y: day1Y + 570), withAttributes: dayAttributes)
        
        let number2 = "140"
        let day2Font = UIFont.systemFont(ofSize: 16, weight: .regular)
        let day2Attributes = [NSAttributedString.Key.font: day1Font]
        let day2Size = day.size(withAttributes: day2Attributes)
        let day2X = margin
        let day2Y = titleY + titleSize.height + margin
        number2.draw(at: CGPoint(x: day2X + 300, y: day2Y + 570), withAttributes: dayAttributes)
        
        // Draw graph
        let maxHeartRate = heartRateData.max()!
        let minHeartRate = heartRateData.min()!
        let avgY = barY + barMaxHeight - CGFloat(avgHeartRate - minHeartRate) / CGFloat(maxHeartRate - minHeartRate) * barMaxHeight
        let avgLine = UIBezierPath()
        avgLine.move(to: CGPoint(x: barX, y: avgY + 100))
        avgLine.addLine(to: CGPoint(x: barX + graphWidth + 500, y: avgY + 100))
        avgLine.lineWidth = 1
        UIColor.black.setStroke()
        avgLine.stroke()
        
        let avgYx = barY + barMaxHeight - CGFloat(avgHeartRate - minHeartRate) / CGFloat(maxHeartRate - minHeartRate) * barMaxHeight
        let avgLinex = UIBezierPath()
        avgLine.move(to: CGPoint(x: barX, y: avgY + 155))
        avgLine.addLine(to: CGPoint(x: barX + graphWidth + 500, y: avgY + 155))
        avgLine.lineWidth = 1
        UIColor.black.setStroke()
        avgLine.stroke()
        
        
        for i in 0..<heartRateData.count {
            let x = barX + CGFloat(i) * barWidth
            let y = barY + barMaxHeight - CGFloat(heartRateData[i] - minHeartRate) / CGFloat(maxHeartRate - minHeartRate) * barMaxHeight

            // Convert hex color to UIColor
            let hexColor = 0xfa576c  // Replace with your hex color value
            let uiColor = UIColor(
                red: CGFloat((hexColor & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((hexColor & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(hexColor & 0x0000FF) / 255.0,
                alpha: 1.0
            )

            // Draw rounded rectangle bar with hex color
            let narrowerBarWidth = barWidth * 0.7 // Adjust the factor (0.8) as needed
            let bar = UIBezierPath(roundedRect: CGRect(x: x + (barWidth - narrowerBarWidth) / 2, y: y - 70, width: narrowerBarWidth, height: barMaxHeight - y + barY), cornerRadius: 20.0)
            uiColor.setFill()
            bar.fill()

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
