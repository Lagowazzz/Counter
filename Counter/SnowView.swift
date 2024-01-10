
import Foundation
import UIKit

class SnowView: UIView {

    let snowflakeEmitter = CAEmitterLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSnowfall()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSnowfall()
    }

    func setupSnowfall() {
        snowflakeEmitter.emitterPosition = CGPoint(x: bounds.width / 2, y: 0)
        snowflakeEmitter.emitterSize = CGSize(width: bounds.width, height: 1)
        snowflakeEmitter.emitterShape = .line
        snowflakeEmitter.emitterCells = generateSnowflakes()
        snowflakeEmitter.backgroundColor = UIColor.clear.cgColor  // Установите цвет фона в прозрачный
        layer.addSublayer(snowflakeEmitter)
    }


    func generateSnowflakes() -> [CAEmitterCell] {
        var snowflakes = [CAEmitterCell]()

        let snowflake = CAEmitterCell()
        snowflake.birthRate = 10
        snowflake.lifetime = 60
        snowflake.velocity = 10
        snowflake.velocityRange = 20
        snowflake.yAcceleration = 3
        snowflake.emissionRange = .pi
        snowflake.spin = 1
        snowflake.spinRange = 1.0
        snowflake.scale = 0.5
        snowflake.color = UIColor.white.cgColor
        snowflake.contents = UIImage(systemName: "snow")?.cgImage

        snowflakes.append(snowflake)

        return snowflakes
    }
}

