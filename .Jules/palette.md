## 2024-05-23 - Custom Gestures & VoiceOver
**Learning:** In legacy Swift codebases with heavy custom gesture handling (like `UIPanGestureRecognizer`), accessibility is often missing. The most robust fix is not to simulate the gesture, but to expose the *outcome* via `UIAccessibilityCustomAction`.
**Action:** When retrofitting gestures, create dedicated `completion` methods that can be called by both the gesture recognizer and the accessibility action selector. This avoids logic duplication.
