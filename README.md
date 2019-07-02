# SwiftyUtilsFramework
This is an amazing utility framework for all level of developers.

By using this library you can set your views constraints with auto-layout in a single line of code.

Install Pods:

pod 'SwiftyUtilsFramework'


Usage:
 
  someview.anchor(leading: leadingAnchor, top: topAnchor, trailing: trailing, bottom: bottom, padding: .init(top: 10, left: 10, bottom: 0, right: 0), size: .init(width: 50, height: 50))
  
  Constraints With other view
  
  someview.anchor(leading: ViewA.leadingAnchor, top: ViewA.bottomAchor, trailing: ViewA.trailing, bottom: bottom, padding: .init(top: 10, left: 10, bottom: 0, right: 0), size: .init(width: 50, height: 50))

Place view in center of a view

someView.centerAnchor(to: view)

someview.centerXAnchor(to: view)

someview.centerYAnchor(to: view)

You can use Hexa Color codes for creating color object with this library

Usage:

let primaryColor = UIColor(hex: "93280F")
