//
//  FeedViewController.swift
//  Mailbox
//
//  Created by James Taylor on 10/3/15.
//  Copyright © 2015 James Taylor. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIScrollViewDelegate {
    
    // feed vars
    @IBOutlet weak var scrollView: UIScrollView!
    
    // message vars
    @IBOutlet weak var messageContainer: UIView!
    @IBOutlet weak var messageView: UIImageView!
    @IBOutlet weak var laterIcon: UIImageView!
    @IBOutlet weak var listIcon: UIImageView!
    @IBOutlet weak var deleteIcon: UIImageView!
    @IBOutlet weak var archiveIcon: UIImageView!
    @IBOutlet weak var swipeLeftActionView: UIView!
    @IBOutlet weak var swipeRightActionView: UIView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    // origin vars
    var scrollViewOrigin: CGFloat!
    var messageViewOrigin: CGFloat!
    var swipeRightActionViewOrigin: CGFloat!
    var swipeLeftActionViewOrigin: CGFloat!
    
    // state statuses
    var showReschedule: Bool!
    var showList: Bool!
    var undoAvailable: Bool!
    var menuOpen:Bool!
    
    // container vars
    @IBOutlet weak var containerView: UIView!
    var containerViewOrigin: CGFloat!
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    // menu vars
    @IBOutlet weak var menuView: UIView!
    
    // overlays vars
    @IBOutlet weak var listView: UIImageView!
    @IBOutlet weak var rescheduleView: UIImageView!
    @IBOutlet weak var modalButton: UIButton!
    
    
    // INITIATION
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // determine and set origin values of views within pan
        scrollViewOrigin = scrollView.frame.origin.y
        containerViewOrigin = containerView.frame.origin.x
        messageViewOrigin = messageView.frame.origin.x
        swipeLeftActionViewOrigin = swipeLeftActionView.frame.origin.x
        swipeRightActionViewOrigin = swipeRightActionView.frame.origin.x
        
        // hide/disable swipe action icons and modals
        laterIcon.alpha = 0
        listIcon.alpha = 0
        deleteIcon.alpha = 0
        archiveIcon.alpha = 0
        modalButton.enabled = false
        
        // setup scrolling
        scrollView.delegate = self
        let scrollWidth:CGFloat = feedImageView.image!.size.width
        let scrollHeight:CGFloat = feedImageView.image!.size.height + messageView.image!.size.height + messageView.image!.size.height
        scrollView.contentSize = CGSize(width: scrollWidth, height: scrollHeight)
        print(scrollView.contentSize,feedImageView.image!.size.height)
        
        // message swipe gesture
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onCustomPan:")
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        messageView.addGestureRecognizer(panGestureRecognizer)
        
        // edge swipe gesture
        let edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: "onEdgePan:")
        edgeGesture.edges = UIRectEdge.Left
        containerView.addGestureRecognizer(edgeGesture)
        
        // menu
        menuOpen = false
        
        // undo
        undoAvailable = false
    }
    
    
    // MESSAGE SWIPE
    
    func onCustomPan(panGestureRecognizer: UIPanGestureRecognizer) {
        //let point = panGestureRecognizer.locationInView(view)
        let translation = panGestureRecognizer.translationInView(view)
        let velocity = panGestureRecognizer.velocityInView(view)
        
        
        // begin swiping
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            
            
            // while swiping
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            
            // set point of swipe origin
            messageView.frame.origin.x = translation.x
            
            // calculate alpha of icon based on swiping from 0 -> 60
            let offset = convertValue(abs(translation.x), r1Min: 0, r1Max: 60, r2Min: 0, r2Max: 1)
            //print("alpha = \(offset)")
            
            laterIcon.alpha = offset
            archiveIcon.alpha = offset
            
            // while swiping left from -60 -> -260
            if translation.x < -60 && translation.x > -260 {
                swipeRightActionView.alpha = 0
                swipeLeftActionView.alpha = 1
                laterIcon.alpha = 1
                listIcon.alpha = 0
                showList = false
                showReschedule = true
                messageContainer.backgroundColor = UIColor(red: 247/255.0, green: 212/255.0, blue: 59/255.0, alpha: 1.0)
                swipeLeftActionView.frame.origin.x = translation.x + swipeLeftActionViewOrigin + 60
                
            }
            // while swiping left from -260 ->
            else if translation.x <= -260 {
                showList = true
                showReschedule = false
                laterIcon.alpha = 0
                listIcon.alpha = 1
                messageContainer.backgroundColor = UIColor.brownColor()
                swipeLeftActionView.frame.origin.x = translation.x + swipeLeftActionViewOrigin + 60
            }
            
            // while swiping right from 60 -> 260
            else if translation.x > 60 && translation.x < 260{
                swipeRightActionView.alpha = 1
                swipeLeftActionView.alpha = 0
                archiveIcon.alpha = 1
                deleteIcon.alpha = 0
                messageContainer.backgroundColor = UIColor.greenColor()
                swipeRightActionView.frame.origin.x = translation.x + swipeRightActionViewOrigin - 60
            }
                
            // while swiping right from 260 ->
            else if translation.x >= 260 {
                archiveIcon.alpha = 0
                deleteIcon.alpha = 1
                messageContainer.backgroundColor = UIColor.redColor()
                swipeRightActionView.frame.origin.x = translation.x + swipeRightActionViewOrigin - 60
            }
                
            else {
                showList = false
                showReschedule = false
                messageContainer.backgroundColor = UIColor.grayColor()
            }
            //            print("showList = \(showList)")
            //            print("showReschedule = \(showReschedule)")
            //            print(velocity)
            print(messageContainer.backgroundColor)
            print(translation)
            //            print("laterVievOrigin = \(laterViewOrigin)")
            //            print("laterView = \(laterView.frame.origin.x)")
            //            print("Edge Gesture changed at: \(point)")
            
            
        // end swiping
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            
            // if swiping left
            if translation.x < -60 && velocity.x < 0 { //swipe far enough - animate off
                
                // laterView
                UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    self.swipeLeftActionView.frame.origin.x = -self.swipeLeftActionView.frame.width
                    }, completion: { (Bool) -> Void in
                })
                
                // messageView animates off screen
                UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    self.messageView.frame.origin.x = (self.messageViewOrigin - self.screenSize.width)
                    }, completion: { (Bool) -> Void in
                        if self.showReschedule == true {
                            self.rescheduleView.alpha = 1
                        } else if self.showList == true {
                            self.listView.alpha = 1
                        }
                        //self.messageContainer.backgroundColor = UIColor.whiteColor()
                        self.modalButton.enabled = true
                })
                
            // if swiping right
            } else if translation.x > 60 && velocity.x > 0 { //swipe far enough - animate off
                
                // laterView
                UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    self.swipeRightActionView.frame.origin.x = self.screenSize.width
                    }, completion: { (Bool) -> Void in
                })
                
                // messageView animates off screen
                UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    self.messageView.frame.origin.x = self.screenSize.width
                    }, completion: { (Bool) -> Void in
                        self.rescheduleView.alpha = 0
                        self.listView.alpha = 0
                        UIView.animateWithDuration(0.7, animations: { () -> Void in
                            self.feedImageView.frame.origin.y = 0
                            self.messageContainer.frame.origin.y = -self.messageView.frame.height
                            //self.scrollView.contentOffset.y = 0
                            }, completion: { (Bool) -> Void in
                                self.messageContainer.hidden = true
                                //self.messageContainer.backgroundColor = UIColor.whiteColor()
                                self.undoAvailable = true
                        })
                })
            }
                
                //swipe not far enough - return to default state
            else {
                UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    self.messageView.frame.origin.x = 0
                    }, completion: { (Bool) -> Void in
                        //print("back to default state")
                })
            }
        }
    }
    
    
    // CLOSE MODAL
    
    @IBAction func didPressModalButton(sender: UIButton) {
        rescheduleView.alpha = 0
        listView.alpha = 0
        UIView.animateWithDuration(0.7, animations: { () -> Void in
            self.feedImageView.frame.origin.y = 0
            self.messageContainer.frame.origin.y = -self.messageView.frame.height
        }, completion: { (Bool) -> Void in
            self.messageContainer.hidden = true
            self.undoAvailable = true
        })
        modalButton.enabled = false
    }
    
    
    // SHAKE TO UNDO
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if undoAvailable == true && motion == .MotionShake {
            print("shake")
            // bring message back in
            self.messageView.frame.origin.x = self.messageViewOrigin
            self.messageContainer.backgroundColor = UIColor.grayColor()
            UIView.animateWithDuration(0.7) { () -> Void in
                self.feedImageView.frame.origin.y = self.messageView.frame.height
                self.messageContainer.frame.origin.y = 0
                
            }
            messageContainer.hidden = false
            undoAvailable = false
        }
    }
    
    
    
    // MENU OPEN/CLOSE
    
    @IBAction func didPressMenu(sender: UIButton) {
        print("menu button pressed")
        if menuOpen == true {
            UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.containerView.frame.origin.x = self.containerViewOrigin
                }) { (Bool) -> Void in
                    self.menuView.alpha = 0
                    self.menuOpen = false
                    print(self.menuOpen)
            }
        } else if menuOpen == false {
            self.menuView.alpha = 1
            UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.containerView.frame.origin.x = self.screenSize.width - 40
                }) { (Bool) -> Void in
                    self.menuOpen = true
                    print(self.menuOpen)
            }
            
        }
    }
    
    
    // EDGE SWIPE > MENU
    
    func onEdgePan(panGestureRecognizer: UIScreenEdgePanGestureRecognizer) {
        let point = panGestureRecognizer.locationInView(view)
        let velocity = panGestureRecognizer.velocityInView(view)
        
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            menuView.alpha = 1
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            containerView.frame.origin.x = point.x

        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            if velocity.x > 0 {
                UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                    self.containerView.frame.origin.x = self.screenSize.width - 40
                    }) { (Bool) -> Void in
                        self.menuOpen = true
                }
            } else if velocity.x < 0 {
                UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                    self.containerView.frame.origin.x = self.containerViewOrigin
                    }) { (Bool) -> Void in
                        self.menuView.alpha = 0
                }}
        }
    }
}

