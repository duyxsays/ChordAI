//
//  FingersOverlay.swift
//  ChordiAI
//
//  Created by Simon Andersen on 21/04/2023.
//

import SwiftUI

struct FingersOverlay: Shape {
  let points: [CGPoint]
  private let pointsPath = UIBezierPath()

  init(with points: [CGPoint]) {
    self.points = points
  }

  func path(in rect: CGRect) -> Path {
    for point in points {
      pointsPath.move(to: point)
      pointsPath.addArc(withCenter: point, radius: 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
    }

    return Path(pointsPath.cgPath)
  }
}
