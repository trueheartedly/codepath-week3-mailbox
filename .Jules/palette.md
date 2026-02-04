## 2024-10-25 - Simulating Gesture State for Accessibility
**Learning:** When retrofitting accessibility to gesture-heavy legacy code (Swift 2), logic often relies on transient gesture values (translation/velocity).
**Action:** Extract "completion" logic into helper methods and manually set the required visual state (colors, icons) in the accessibility action before calling the completion helper, effectively bypassing the gesture recognizer's "Changed" state.
