//
//  DropSegue.swift
//  DropSegue
//
//  Created by Usama Sadiq on 12/20/19.
//  Copyright © 2019 Usama Sadiq. All rights reserved.

import UIKit

// MARK:- Custom Segue

class Entering_RHS: UIStoryboardSegue {
    
    override func perform() {
        destination.transitioningDelegate = self
        super.perform()
    }
}

extension Entering_RHS: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return RHS_PresentAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return RHS_DismissAnimator()
    }
}

// MARK:- Animator

class RHS_PresentAnimator:NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // 1. Get the transition context to- view controller and view
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        
        // 2. Add the to-view to the transition context
        if let toView = toView {
            transitionContext.containerView.addSubview(toView)
        }
        
        // 3. Set up the initial state for the animation
        let finalFrame = transitionContext.finalFrame(for: toViewController)
        var startFrame = finalFrame
        startFrame.origin.x = +finalFrame.width
        
        toView?.frame = startFrame
        toView?.layoutIfNeeded()
        
        // 4. Perform the animation
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration) {
            
        }
        
        UIView.animate(withDuration: duration, animations: {
            if let toView = toView {
                toView.frame = finalFrame
            }
        }, completion: {
            finished in
            // 5. Clean up the transition context
            transitionContext.completeTransition(true)
        })
        
    }
}

class RHS_DismissAnimator:NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // 1. Get the transition context from- view controller and view
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        
        // 2. Add the to-view to the transition context
        if let fromView = fromView {
            if let toView = toView {
                transitionContext.containerView.insertSubview(toView, belowSubview: fromView)
            }
        }
        
        // 3. Set up the initial state for the animation
        var finalFrame = transitionContext.finalFrame(for: fromViewController)
        finalFrame.origin.x = +finalFrame.width
        
        // 4. Perform the animation
        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            if let fromView = fromView {
                fromView.frame = finalFrame
                fromView.layoutIfNeeded()
            }
        }, completion: {
            finished in
            // 5. Clean up the transition context
            transitionContext.completeTransition(true)
        })
    }
}

