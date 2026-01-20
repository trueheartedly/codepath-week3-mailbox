## 2024-10-24 - Accessibility Custom Actions for Gesture-Driven Interfaces
**Learning:** Complex gesture interactions (like multi-stage swipes) are inaccessible to VoiceOver users. By extracting the completion logic into shared methods and exposing them via `UIAccessibilityCustomAction`, we can make the app fully functional for screen reader users without compromising the visual design.
**Action:** Always refactor gesture completion logic into separate methods to facilitate `UIAccessibilityCustomAction` implementation.
