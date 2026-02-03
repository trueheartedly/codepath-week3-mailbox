## 2024-10-25 - Accessibility for Custom Gestures
**Learning:** Custom swipe gestures on views (like `UIImageView`) are invisible to VoiceOver. Refactoring completion logic into helper methods allows `UIAccessibilityCustomAction` to reuse the same animations and logic, ensuring a consistent experience for all users.
**Action:** When encountering custom gesture handlers, always extract the "committed" state logic into a separate method that can be called by both the gesture recognizer and accessibility actions.
