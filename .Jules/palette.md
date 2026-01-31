## 2025-05-15 - Accessibility for Gesture UIs
**Learning:** Custom gestures (like swipe-to-archive) are invisible to VoiceOver users. Adding `UIAccessibilityCustomAction` allows these users to access the same functionality via the "Rotor" or simple swipes.
**Action:** When working on gesture-heavy apps, always expose the equivalent actions via `accessibilityCustomActions` and use outcome-based helper methods to trigger the logic.
