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
        
        setupAccessibility()

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
        let translation = panGestureRecognizer.translationInView(view)
        let velocity = panGestureRecognizer.velocityInView(view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            messageView.frame.origin.x = translation.x
            let offset = convertValue(abs(translation.x), r1Min: 0, r1Max: 60, r2Min: 0, r2Max: 1)
            laterIcon.alpha = offset
            archiveIcon.alpha = offset
            
            if translation.x < -60 && translation.x > -260 {
                swipeRightActionView.alpha = 0
                swipeLeftActionView.alpha = 1
                laterIcon.alpha = 1
                listIcon.alpha = 0
                showList = false
                showReschedule = true
                messageContainer.backgroundColor = UIColor(red: 247/255.0, green: 212/255.0, blue: 59/255.0, alpha: 1.0)
                swipeLeftActionView.frame.origin.x = translation.x + swipeLeftActionViewOrigin + 60
            } else if translation.x <= -260 {
                showList = true
                showReschedule = false
                laterIcon.alpha = 0
                listIcon.alpha = 1
                messageContainer.backgroundColor = UIColor.brownColor()
                swipeLeftActionView.frame.origin.x = translation.x + swipeLeftActionViewOrigin + 60
            } else if translation.x > 60 && translation.x < 260 {
                swipeRightActionView.alpha = 1
                swipeLeftActionView.alpha = 0
                archiveIcon.alpha = 1
                deleteIcon.alpha = 0
                messageContainer.backgroundColor = UIColor.greenColor()
                swipeRightActionView.frame.origin.x = translation.x + swipeRightActionViewOrigin - 60
            } else if translation.x >= 260 {
                archiveIcon.alpha = 0
                deleteIcon.alpha = 1
                messageContainer.backgroundColor = UIColor.redColor()
                swipeRightActionView.frame.origin.x = translation.x + swipeRightActionViewOrigin - 60
            } else {
                showList = false
                showReschedule = false
                messageContainer.backgroundColor = UIColor.grayColor()
            }
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            if translation.x < -60 && velocity.x < 0 {
                completeLeftSwipe()
            } else if translation.x > 60 && velocity.x > 0 {
                completeRightSwipe()
            } else {
                UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    self.messageView.frame.origin.x = 0
                }, completion: nil)
            }
        }
    }

    func completeLeftSwipe() {
        UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.swipeLeftActionView.frame.origin.x = -self.swipeLeftActionView.frame.width
            self.messageView.frame.origin.x = (self.messageViewOrigin - self.screenSize.width)
        }, completion: { _ in
            if self.showReschedule == true { self.rescheduleView.alpha = 1 }
            else if self.showList == true { self.listView.alpha = 1 }
            self.modalButton.enabled = true
        })
    }

    func completeRightSwipe() {
        UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.swipeRightActionView.frame.origin.x = self.screenSize.width
            self.messageView.frame.origin.x = self.screenSize.width
        }, completion: { _ in
            self.rescheduleView.alpha = 0
            self.listView.alpha = 0
            UIView.animateWithDuration(0.7, animations: {
                self.feedImageView.frame.origin.y = 0
                self.messageContainer.frame.origin.y = -self.messageView.frame.height
            }, completion: { _ in
                self.messageContainer.hidden = true
                self.undoAvailable = true
            })
        })
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
            laterIcon.alpha = 0
            listIcon.alpha = 0
            deleteIcon.alpha = 0
            archiveIcon.alpha = 0
            swipeRightActionView.frame.origin.x = swipeRightActionViewOrigin
            swipeLeftActionView.frame.origin.x = swipeLeftActionViewOrigin
        }
    }
    
    
    
    func setupAccessibility() {
        messageView.isAccessibilityElement = true
        messageView.accessibilityLabel = "Email Message"
        messageView.accessibilityHint = "Swipe actions available"

        messageView.accessibilityCustomActions = [
            UIAccessibilityCustomAction(name: "Later", target: self, selector: Selector("accessibilityLater:")),
            UIAccessibilityCustomAction(name: "List", target: self, selector: Selector("accessibilityList:")),
            UIAccessibilityCustomAction(name: "Archive", target: self, selector: Selector("accessibilityArchive:")),
            UIAccessibilityCustomAction(name: "Delete", target: self, selector: Selector("accessibilityDelete:"))
        ]
    }

    func accessibilityLater(action: UIAccessibilityCustomAction) -> Bool {
        messageContainer.backgroundColor = UIColor(red: 247/255.0, green: 212/255.0, blue: 59/255.0, alpha: 1.0)
        showReschedule = true
        showList = false
        completeLeftSwipe()
        return true
    }

    func accessibilityList(action: UIAccessibilityCustomAction) -> Bool {
        messageContainer.backgroundColor = UIColor.brownColor()
        showReschedule = false
        showList = true
        completeLeftSwipe()
        return true
    }

    func accessibilityArchive(action: UIAccessibilityCustomAction) -> Bool {
        messageContainer.backgroundColor = UIColor.greenColor()
        archiveIcon.alpha = 1
        deleteIcon.alpha = 0
        completeRightSwipe()
        return true
    }

    func accessibilityDelete(action: UIAccessibilityCustomAction) -> Bool {
        messageContainer.backgroundColor = UIColor.redColor()
        archiveIcon.alpha = 0
        deleteIcon.alpha = 1
        completeRightSwipe()
        return true
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

