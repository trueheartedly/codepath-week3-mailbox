# Palette's Journal

## 2024-10-25 - Legacy Swift Accessibility
**Learning:** Legacy Swift (2.x) projects require explicit selector strings for `UIAccessibilityCustomAction` and outcome-based logic since gesture recognizers are often tightly coupled with specific drag states.
**Action:** When working with legacy codebases, refactor gesture completion logic into reusable helper methods that can be triggered by both the gesture recognizer and accessibility actions.
