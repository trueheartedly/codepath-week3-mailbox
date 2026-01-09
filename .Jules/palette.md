# Palette's Journal

## 2025-02-18 - Accessibility Actions in Legacy Swift
**Learning:** In Swift 2 (and likely 3), implementing `UIAccessibilityCustomAction` requires careful handling of selectors (String-based) and manual setup of the `accessibilityCustomActions` array on the view. The actions must be outcome-based (calling completion logic directly) rather than trying to simulate the gesture.
**Action:** When adding accessibility to gesture-heavy legacy apps, refactor the "completion" logic of gestures into separate helper methods (`completeRightSwipe`, `completeLeftSwipe`) first. This allows the accessibility actions to trigger the exact same state changes and animations as the gestures, ensuring a consistent experience without code duplication.
