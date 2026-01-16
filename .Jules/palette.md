## 2024-05-23 - Accessibility in Custom Gesture Apps
**Learning:** Custom pan gestures (like swipe-to-archive) are invisible to VoiceOver. Relying on `UIPanGestureRecognizer` creates a complete accessibility blocker.
**Action:** Use `UIAccessibilityCustomAction` to map these gestures to rotor actions. This requires extracting the "completion" logic of the gesture (animation + state change) into a separate helper method that can be triggered programmatically, bypassing the gesture recognizer entirely.
