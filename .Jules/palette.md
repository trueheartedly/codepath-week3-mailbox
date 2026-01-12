## 2024-05-22 - Custom Swipe Gestures and VoiceOver
**Learning:** Custom gestures using `UIPanGestureRecognizer` are invisible to VoiceOver users. To make swipeable table rows (like in Mailbox) accessible, you MUST implement `UIAccessibilityCustomAction`.
**Action:** When implementing custom gestures, always add a corresponding `UIAccessibilityCustomAction` that triggers the same completion logic programmatically. Expose these actions on the view's `accessibilityCustomActions` property.
