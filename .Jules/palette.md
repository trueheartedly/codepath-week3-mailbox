## 2024-05-22 - [Accessibility] Adding Custom Actions to Swipeable Views
**Learning:** Custom gesture recognizers (like pan-to-archive) are invisible to VoiceOver users unless explicitly exposed via `UIAccessibilityCustomAction`.
**Action:** When implementing custom gestures on views, always add corresponding `UIAccessibilityCustomAction`s to the view's `accessibilityCustomActions` property.
