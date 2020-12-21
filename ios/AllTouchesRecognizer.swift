//
//  AllTouchesRecognizer.swift
//  ShowTouches
//
//  Implementation of the gesture recognizer based off of documentation for continuous gesture
//  recognizers:
//  https://developer.apple.com/documentation/uikit/touches_presses_and_gestures/implementing_a_custom_gesture_recognizer/implementing_a_continuous_gesture_recognizer
//  More info on using and controlling the gesture recognizer state machine:
//  https://developer.apple.com/documentation/uikit/touches_presses_and_gestures/implementing_a_custom_gesture_recognizer/about_the_gesture_recognizer_state_machine
//  Created by Michael Kiley on 12/18/20.
//



import UIKit

class AllTouchesRecognizer: UIGestureRecognizer {
    
  
  var storedTouches : [UITouch : StoredTouch] = [:]
  var fadeDuration : Double = 0.3
  
    
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
      
    for touch in touches {
      // Use touch location in window
      let touchLocation = touch.location(in: nil)
        
      // Touch objects are reused, so you need to keep track of touch data yourself if you want it to persist throughout a gesture
      let storedTouch = StoredTouch(touch: touch, location: touchLocation, view: UIView())
      storedTouches[touch] = storedTouch
    }
    super.touchesBegan(touches, with: event)
    // Changing state triggers target function in delegate
    state = .began
      
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
    
    if state == .failed {
       return
    }
    
    //Update position of touch indicator views; if you have added more touches to this gesture, create indicators for them
    for touch in touches {
      if let storedTouch = storedTouches[touch]{
          storedTouch.location = touch.location(in: nil)
      } else{
        let touchLocation = touch.location(in: nil)
        let storedTouch = StoredTouch(touch: touch, location: touchLocation, view: UIView())
        storedTouches[touch] = storedTouch
      }
    }
    super.touchesMoved(touches, with: event)
      
    state = .changed
  }
    
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
    
    // Fade out the touches you have lifted from the screen
    for touch in touches{
      if let storedTouch = storedTouches[touch] {
        storedTouch.isFadingOut = true
        storedTouch.removeFromView = true
      }
    }

    // If the gesture has touches that haven't ended yet, update those and set state to .changed to continue gesture
    if(touches.count != storedTouches.count){
      super.touchesMoved(touches, with: event)
      state = .changed
    } else {
      // All touches in gesture have ended, so end gesture, causing gesture recognizer to reset
      super.touchesEnded(touches, with: event)
      state = .ended
    }
      
  }
    
  override func reset() {
    // Remove any touch indicators still being shown
    for (uiTouch, storedTouch) in storedTouches {
      if (!storedTouch.isFadingOut){
        storedTouch.touchView?.removeFromSuperview()
        storedTouches[uiTouch] = nil
      }
    }
    // Reset recognizer data to desired initial state
    storedTouches = [:]
    super.reset()
  }
    
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    // Remove any touch indicators still being shown
    for (uiTouch, storedTouch) in storedTouches {
      if (!storedTouch.isFadingOut){
        storedTouch.touchView?.removeFromSuperview()
        storedTouches[uiTouch] = nil
      }
    }
    super.touchesCancelled(touches, with: event!)
    state = .cancelled
  }
    
    
}

class StoredTouch {
    
  //Used to identify touch throughout gesture
  var touch : UITouch
  var location : CGPoint

  //Reference to view stored for update and removal
  var touchView : UIView?

  var isFadingOut : Bool! = false
  var removeFromView : Bool! = false
  var isVisible : Bool! = false

  init(touch: UITouch, location: CGPoint, view: UIView) {
    self.touch = touch
    self.location = location
    self.touchView = view
  }
}
