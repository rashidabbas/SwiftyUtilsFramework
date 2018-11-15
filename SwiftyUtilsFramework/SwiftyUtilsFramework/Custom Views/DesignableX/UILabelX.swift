//
//  UILabelX.swift
//  kontrol
//
//  Created by Rashid Abbas on 06/09/2018.
//  Copyright © 2018 kontrol. All rights reserved.
//
//
import UIKit
extension UILabelX {
    @IBInspectable
    public var leftTextInset: CGFloat {
        set { textInsets.left = newValue }
        get { return textInsets.left }
    }

    @IBInspectable
    public var rightTextInset: CGFloat {
        set { textInsets.right = newValue }
        get { return textInsets.right }
    }

    @IBInspectable
    public var topTextInset: CGFloat {
        set { textInsets.top = newValue }
        get { return textInsets.top }
    }

    @IBInspectable
    public var bottomTextInset: CGFloat {
        set { textInsets.bottom = newValue }
        get { return textInsets.bottom }
    }
}


@IBDesignable
open class UILabelX: UILabel {

    public var textInsets = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize() }
    }

    override open func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = bounds.inset(by: textInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textInsets.top,
                                          left: -textInsets.left,
                                          bottom: -textInsets.bottom,
                                          right: -textInsets.right)
        return textRect.inset(by: invertedInsets)
    }

    override open func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }




    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }

    @IBInspectable public var BorderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = BorderColor.cgColor
        }
    }

    @IBInspectable public var rotationAngle: CGFloat = 0 {
        didSet {
            self.transform = CGAffineTransform(rotationAngle: rotationAngle * .pi / 180)
        }
    }

    // MARK: - Shadow Text Properties

    @IBInspectable public var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }

    @IBInspectable public var shadowColorLayer: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColorLayer.cgColor
        }
    }

    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }

    @IBInspectable public var shadowOffsetLayer: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            layer.shadowOffset = shadowOffsetLayer
        }
    }





//    public enum Direction {
//
//        /// Draw the gradient from top to bottom.
//        case vertical
//
//        /// Draw the gradient from left to right.
//        case horizontal
//
//        // Draw the gradient in a custom direction providing the start and end points.
//        case custom(start: CGPoint, end: CGPoint)
//
//        /// The start point of the gradient when drawn.
//        var startPoint: CGPoint {
//            switch self {
//            case .vertical:
//                return CGPoint(x: 0.5, y: 0)
//            case .horizontal:
//                return CGPoint(x: 0, y: 0.5)
//            case .custom(start: let start, end: _):
//                return start
//            }
//        }
//
//        /// The end point of the gradient when drawn.
//        var endPoint: CGPoint {
//            switch self {
//            case .vertical:
//                return CGPoint(x: 0.5, y: 1)
//            case .horizontal:
//                return CGPoint(x: 1, y: 0.5)
//            case .custom(start: _, end: let end):
//                return end
//            }
//        }
//
//    }

    /// The CAGradientLayer instance containing the gradient information to play.
//    public var gradientLayer: CAGradientLayer {
//        //swiftlint:disable force_cast
//        return layer as! CAGradientLayer
//        //swiftlint:enable force_cast
//    }

    // Override UIView property. The class used to create the layer for instances of this class.
//    override public static var layerClass: AnyClass {
//        return CAGradientLayer.self
//    }

    /// An array of UIColor objects defining the color of each gradient stop. Animatable.
    ///
    /// Defaults to nil.
//    public var colors: [UIColor]? {
//        didSet {
//            gradientLayer.colors = colors?.map { $0.cgColor }
//        }
//    }

    /// An optional array of Double objects defining the location of each gradient stop. Animatable.
    ///
    /// The gradient stops are specified as values between 0 and 1.
    /// The values must be monotonically increasing. If nil, the stops are spread uniformly across the range.
    ///
    /// Defaults to nil.
//    public var locations: [Double]? {
//        didSet {
//            gradientLayer.locations = locations?.map(NSNumber.init(value:))
//        }
//    }

    /// The direction to draw the gradient. Animatable.
    ///
    /// Defaults to vertical:
    ///     - startPoint: (0.5, 0.0)
    ///     - endPoint:   (0.5, 1.0)
//    public var direction: Direction {
//        didSet {
//            gradientLayer.startPoint = direction.startPoint
//            gradientLayer.endPoint   = direction.endPoint
//        }
//    }

    /// Initialise with default values calling didSet to update the underlying gradient layer in the process.
    override init(frame: CGRect) {

//        self.colors    = nil
//        self.direction = .vertical
//        self.locations = nil

        super.init(frame: frame)

    }

    /// Not yet implemented.
    required public init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }
}
