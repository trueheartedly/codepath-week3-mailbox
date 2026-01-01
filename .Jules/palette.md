## 2024-05-23 - Accessibility Custom Actions
**Learning:** Legacy Swift 2 apps rely heavily on gesture recognizers which are inaccessible to VoiceOver. Adding `UIAccessibilityCustomAction` is a low-risk, high-impact way to expose these interactions without changing visual design.
**Action:** When working with custom gesture-based UI, always expose the same functionality via `accessibilityCustomActions`.
