## 2024-05-23 - Custom Gestures & VoiceOver
**Learning:** Swipe gestures on custom views (like `UIImageView`) are invisible to VoiceOver users unless explicitly exposed via `UIAccessibilityCustomAction`.
**Action:** Always map complex gestures to `accessibilityCustomActions` and ensure visual state updates (e.g., background color) are handled programmatically since the drag event won't fire.
