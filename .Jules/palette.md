## 2024-10-24 - Accessibility Actions for Custom Gestures
**Learning:** Custom swipe gestures are often inaccessible to VoiceOver users.
**Action:** When using `UIPanGestureRecognizer` for actions, always implement `UIAccessibilityCustomAction` to provide alternative access to the same functionality. Extract the completion logic into helper methods that can be called by both the gesture recognizer and the accessibility actions.
