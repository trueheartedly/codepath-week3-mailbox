## 2024-05-23 - Initial Analysis
**Learning:** The legacy Swift 2 codebase requires specific syntax (String selectors, verbose API calls) and lacks modern accessibility features.
**Action:** When implementing accessibility, ensure compatibility with older APIs (e.g., UIAccessibilityCustomAction with selector strings) and test logic manually since automated UI tests are not available.

## 2024-05-23 - Accessibility Action Logic
**Learning:** When bypassing pan gestures to trigger actions programmatically (e.g., for accessibility), both visual state (background color, icon alpha) and logical state flags (e.g., `showReschedule`, `showList`) must be manually set before triggering the completion animation.
**Action:** Explicitly set all state variables in accessibility action handlers that would normally be set during the `Changed` phase of a gesture recognizer.
