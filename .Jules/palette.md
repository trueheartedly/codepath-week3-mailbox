## 2024-05-22 - Custom Gestures Accessibility
**Learning:** `UIPanGestureRecognizer` logic for custom actions (like Swipe to Archive) is completely invisible to VoiceOver. Relying solely on `translation.x` logic in gesture handlers excludes assistive technology users.
**Action:** When implementing custom gestures, always provide equivalent `UIAccessibilityCustomAction`s. Programmatically triggering the "completion" logic of the gesture (or shared logic) is essential, rather than trying to simulate the gesture itself.
