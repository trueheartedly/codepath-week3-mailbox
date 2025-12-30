## 2024-05-22 - Accessibility Custom Actions
**Learning:** Custom gestures (like swipe-to-act) are invisible to VoiceOver. `UIAccessibilityCustomAction` is the bridge.
**Action:** Always check if a gesture has a corresponding accessibility action. When implementing, refactor the "completion" logic of the gesture into a reusable method so both the gesture recognizer and the accessibility action can call it. This ensures behavior consistency.
