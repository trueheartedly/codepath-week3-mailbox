## 2024-10-25 - Accessibility of Image-Based Interactions
**Learning:** The app relies heavily on `UIImageView` for interactive elements (like `messageView`) instead of standard controls. This makes them invisible to VoiceOver by default.
**Action:** Always manually set `isAccessibilityElement = true` and provide descriptive `accessibilityLabel` and `accessibilityHint` for these custom interactive views in `viewDidLoad`.
