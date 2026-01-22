## 2024-05-21 - Accessibility for Custom Gestures
**Learning:** Custom gestures (like `UIPanGestureRecognizer`) are invisible to VoiceOver. Users need `UIAccessibilityCustomAction` to perform the same actions without the physical gesture.
**Action:** Always map complex gestures to named `UIAccessibilityCustomAction`s that trigger the same end-state logic.

## 2024-05-21 - Visual State in Programmatic Actions
**Learning:** When triggering gesture-based actions programmatically (e.g. for a11y), we must manually set the visual state (colors, icons) that the gesture would have set during the drag, to ensure the completion animation looks correct.
**Action:** Ensure accessibility action handlers set all relevant view properties (background color, icon alpha) before triggering the completion animation.
