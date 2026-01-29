## 2024-10-24 - [Outcome-Based Accessibility Actions]
**Learning:** In legacy gesture-heavy codebases, implementing accessibility actions by directly triggering the outcome logic (e.g., animations, state changes) is safer than refactoring complex gesture handlers or simulating drags.
**Action:** Create helper methods for the "completion" phase of gestures and call them from `UIAccessibilityCustomAction` handlers.
