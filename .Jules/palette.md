## 2024-05-22 - Custom Gesture Accessibility
**Learning:** Custom `UIPanGestureRecognizer` implementations on `UIImageViews` completely bypass VoiceOver users unless explicitly bridged.
**Action:** Always map complex gesture states (like swipe thresholds) to discrete `UIAccessibilityCustomAction`s that replicate the *outcome* of the gesture, rather than trying to make the gesture itself accessible.
