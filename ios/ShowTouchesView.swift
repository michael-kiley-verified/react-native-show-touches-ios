//
//  ShowTouchesView.swift
//  ShowTouches
//
//  Created by Michael Kiley on 12/18/20.
//

import UIKit

class ShowTouchesView: UIView, UIGestureRecognizerDelegate {

  var allTouchesRecognizer : AllTouchesRecognizer!
  
  //Main circle props
  @objc var color : UIColor = UIColor.systemBlue
  @objc var opacity : NSNumber = 0.5
  @objc var radius : NSNumber = 40
  
  //Border props
  @objc var borderColor : UIColor = UIColor.systemBlue
  @objc var borderOpacity : NSNumber = 1
  @objc var borderWidth : NSNumber = 2

  //Animation props
  @objc var fadeDuration : NSNumber = 0.3
  
  

  override init(frame: CGRect) {
    super.init(frame: frame)
    setUpGestureHandler()
  }
  
  required init?(coder: NSCoder){
    super.init(coder: coder)
    setUpGestureHandler()
  }
  
  func setUpGestureHandler() -> Void{
      
    isMultipleTouchEnabled = true
    // Gesture recognizer will call touched() when state changes
    allTouchesRecognizer = AllTouchesRecognizer(target: self, action: #selector(touched))
    allTouchesRecognizer.cancelsTouchesInView = false
    allTouchesRecognizer.delegate = self
    allTouchesRecognizer.fadeDuration = Double(truncating: fadeDuration)
    addGestureRecognizer(allTouchesRecognizer)
      
  }
  
  // Receive touches even if another recognizer is also receiving them
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
  }
  
  // Receive all touch events
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive event: UIEvent) -> Bool {
      return true
  }

  @objc func touched(gesture: AllTouchesRecognizer) {
      switch gesture.state {
      case .began:
        for storedTouch in gesture.storedTouches.values{
          showNewTouch(storedTouch)
        }
      case .changed:
        print("changed")
        for storedTouch in gesture.storedTouches.values{
          if(storedTouch.removeFromView){
            // If this touch has been taken out of the gesture, fade out its indicator
            removeTouchView(storedTouch)
          } else if (!storedTouch.isVisible){
            // If this touch has just been added to the gesture, show a new indicator for it
            showNewTouch(storedTouch)
          } else {
            // This touch has an indicator already - update its view's position
            storedTouch.touchView?.layer.position = storedTouch.location
          }
        }
      case .ended:
        print("ended")
        for storedTouch in gesture.storedTouches.values {
          // The gesture is over - hide any touch indicators that are being shown
          if(storedTouch.removeFromView){
            removeTouchView(storedTouch)
          }
        }
      default:
        break
      }
  }
  
  func removeTouchView(_ storedTouch: StoredTouch)-> Void{
    UIView.animate(withDuration: Double(truncating: fadeDuration), animations: {
      storedTouch.touchView?.alpha = 0
    }) { _ in
      storedTouch.touchView?.removeFromSuperview()
    }
  }
  
  func showNewTouch(_ storedTouch: StoredTouch)->Void{
    
    let radiusF = CGFloat(truncating: radius)
    let touchView = UIView(frame: CGRect(x: storedTouch.location.x - radiusF, y: storedTouch.location.y - radiusF, width: 2 * radiusF, height: 2 * radiusF))
    touchView.layer.cornerRadius = radiusF
    touchView.backgroundColor = color.withAlphaComponent(CGFloat(truncating: opacity))
    touchView.layer.borderWidth = CGFloat(truncating: borderWidth)
    touchView.layer.borderColor = borderColor.withAlphaComponent(CGFloat(truncating: borderOpacity)).cgColor
    addSubview(touchView)
    
    storedTouch.touchView = touchView
    storedTouch.isVisible = true
    
  }
    

}
