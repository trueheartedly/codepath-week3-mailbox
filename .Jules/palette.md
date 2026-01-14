## 2024-10-18 - Custom Gesture Accessibility
**Learning:** Custom gestures on non-standard elements (like `UIImageView`) are invisible to VoiceOver, blocking core functionality.
**Action:** Always implement `UIAccessibilityCustomAction`s that trigger the *result* of the gesture (e.g., calling an animation method directly) rather than trying to simulate the gesture events. Mirror the "Ended" state logic of the gesture recognizer.
