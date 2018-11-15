//
//  AnchorExtensions.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 15/11/2018.
//  Copyright © 2018 Rashid Abbas. All rights reserved.
//

import UIKit
public extension UIView{
    
    public func centerAnchor(to view: UIView , size: CGSize = .zero , yPadding: CGFloat = 0 , xPadding: CGFloat = 0){
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xPadding).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yPadding).isActive = true
        if size.width > 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height > 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    public func centerAnchorWithReturn(to view: UIView , size: CGSize = .zero , yPadding: CGFloat = 0 , xPadding: CGFloat = 0) -> [NSLayoutConstraint] {
        var anchor = [NSLayoutConstraint]()
        translatesAutoresizingMaskIntoConstraints = false
        anchor.append(centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xPadding))
        anchor.append(centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yPadding))
        if size.width > 0 {
            anchor.append(widthAnchor.constraint(equalToConstant: size.width))
        }
        if size.height > 0 {
            anchor.append(heightAnchor.constraint(equalToConstant: size.height))
        }
        anchor.forEach({ $0.isActive = true })
        return anchor
    }
    public func centerXAnchor(to View: UIView  , size: CGSize = .zero ,  xPadding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: View.centerXAnchor, constant: xPadding).isActive = true
        if size.width > 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height > 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    public func centerYAnchor(to View: UIView  , size: CGSize = .zero , yPadding: CGFloat = 0 ) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: View.centerYAnchor, constant: yPadding).isActive = true
        if size.width > 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height > 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    public func equalToFillViewAnchor(padding: UIEdgeInsets = .zero) {
        if #available(iOS 11.0, *) {
            anchor(leading: superview?.safeAreaLayoutGuide.leadingAnchor , top: superview?.safeAreaLayoutGuide.topAnchor , trailing: superview?.safeAreaLayoutGuide.trailingAnchor , bottom: superview?.safeAreaLayoutGuide.bottomAnchor , padding: padding)
        } else {
            // Fallback on earlier versions
            anchor(leading: superview?.leadingAnchor , top: superview?.topAnchor , trailing: superview?.trailingAnchor , bottom: superview?.bottomAnchor , padding: padding)
        }
    }
    
    public func equalHeightWidthAnchor(to View: UIView , widthmultiplier: CGFloat = 1 , heightmultiplier: CGFloat = 1)  {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: View.widthAnchor , multiplier: widthmultiplier).isActive = true
        heightAnchor.constraint(equalTo: View.heightAnchor, multiplier: heightmultiplier).isActive = true
    }
    public func equalWidthAnchor(to View: UIView , widthmultiplier: CGFloat = 1)  {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: View.widthAnchor , multiplier: widthmultiplier).isActive = true
    }
    public func equalHeightAnchor(to View: UIView , heightmultiplier: CGFloat = 1)  {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: View.heightAnchor, multiplier: heightmultiplier).isActive = true
    }
    
    public func heightWidthAnchor(size: CGSize = .zero)  {
        translatesAutoresizingMaskIntoConstraints = false
        if size.width > 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height > 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    public func anchor(leading: NSLayoutXAxisAnchor? , top: NSLayoutYAxisAnchor? , trailing: NSLayoutXAxisAnchor? , bottom:NSLayoutYAxisAnchor? ,  padding: UIEdgeInsets = .zero , size: CGSize = .zero , widthEqualTo: NSLayoutDimension? = nil , widthMultiplier: CGFloat = 0  , heightEqualTo: NSLayoutDimension? = nil , heightMultiplier: CGFloat = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top , constant: padding.top).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom , constant: -padding.bottom).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading , constant: padding.left).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing , constant: -padding.right).isActive = true
        }
        if size.width > 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height > 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        if let widthEqualTo = widthEqualTo {
            widthAnchor.constraint(equalTo: widthEqualTo, multiplier: widthMultiplier).isActive = true
        }
        if let heightEqualTo = heightEqualTo {
            heightAnchor.constraint(equalTo: heightEqualTo, multiplier: heightMultiplier).isActive = true
        }
    }
    
    public func anchorWithReturn(leading: NSLayoutXAxisAnchor? , top: NSLayoutYAxisAnchor? , trailing: NSLayoutXAxisAnchor? , bottom:NSLayoutYAxisAnchor? ,  padding: UIEdgeInsets = .zero , size: CGSize = .zero) -> [NSLayoutConstraint]
    {
        translatesAutoresizingMaskIntoConstraints = false
        var anchor = [NSLayoutConstraint]()
        if let leading = leading {
            anchor.append(leadingAnchor.constraint(equalTo: leading , constant: padding.left))
        }
        if let top = top {
            anchor.append(topAnchor.constraint(equalTo: top , constant: padding.top))
        }
        if let trailing = trailing {
            anchor.append(trailingAnchor.constraint(equalTo: trailing , constant: -padding.right))
        }
        if let bottom = bottom {
            anchor.append(bottomAnchor.constraint(equalTo: bottom , constant: -padding.bottom))
        }
        if size.width > 0 {
            anchor.append(widthAnchor.constraint(equalToConstant: size.width))
        }
        if size.height > 0 {
            anchor.append(heightAnchor.constraint(equalToConstant: size.height))
        }
        anchor.forEach{ $0.isActive = true }
        return anchor
    }
}
