## 2024-05-22 - Accessibility in Legacy iOS
**Learning:** Legacy iOS apps (Swift 2/3) using UIImageViews for interactive elements often lack basic accessibility properties.
**Action:** When working with UIImageView based interfaces, always explicitly set `isAccessibilityElement = true`, provide an `accessibilityLabel`, and a descriptive `accessibilityHint` for custom gestures.
