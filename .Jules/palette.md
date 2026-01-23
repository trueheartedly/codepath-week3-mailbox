## 2024-10-24 - [Reusing Gesture Logic for Accessibility]
**Learning:** Complex gesture logic (like pan-to-dismiss) often contains visual state changes and animations that are hard to replicate in accessibility actions without code duplication.
**Action:** Extract the 'completion' logic of the gesture into a helper method (e.g. `animateMessageAway`) that takes outcome parameters. Use this helper in both the gesture's `.Ended` state and the `UIAccessibilityCustomAction` handlers.
