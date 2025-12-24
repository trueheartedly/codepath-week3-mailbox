## 2024-05-23 - Accessibility for Custom Gestures
**Learning:** Custom pan gestures (like swipe-to-archive) are completely invisible to VoiceOver. While `accessibilityHint` helps, the real fix is `accessibilityCustomActions`.
**Action:** Always map complex gestures to `UIAccessibilityCustomAction`s so users can access the same functionality via the rotor.
