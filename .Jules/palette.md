# Palette Journal

## 2024-05-22 - [Accessibility in Gesture-Heavy Apps]
**Learning:** Custom pan gestures (`UIPanGestureRecognizer`) are invisible to VoiceOver users unless explicitly exposed via `UIAccessibilityCustomAction`.
**Action:** Always map complex swipe gestures to simplified custom actions (Archive, Delete, etc.) that can be triggered via standard accessibility controls.
