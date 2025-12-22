## 2024-05-23 - Accessibility Custom Actions for Gestures
**Learning:** VoiceOver users cannot perform complex custom gestures (like swipe-to-reveal). `UIAccessibilityCustomAction` is critical for exposing these interactions programmatically.
**Action:** Always implement `accessibilityCustomActions` when using `UIPanGestureRecognizer` for primary actions. The actions should trigger the *outcome* of the gesture directly.
