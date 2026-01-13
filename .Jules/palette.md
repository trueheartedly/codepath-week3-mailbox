## 2024-05-22 - Accessibility for Custom Gestures
**Learning:** Complex custom gestures (like swipe-to-archive) are inaccessible to VoiceOver users unless explicitly exposed via `UIAccessibilityCustomAction`.
**Action:** When using `UIPanGestureRecognizer` for primary interactions, always pair it with `accessibilityCustomActions` that programmatically trigger the same outcome.
