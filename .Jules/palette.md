## 2024-05-22 - Accessibility for Custom Swipe Gestures
**Learning:** Swipe gestures on image views (like custom table rows) are invisible to VoiceOver. Custom accessibility actions (`UIAccessibilityCustomAction`) are essential to expose these hidden interactions.
**Action:** When implementing custom gestures, always pair them with named accessibility actions that trigger the same completion logic programmatically.
