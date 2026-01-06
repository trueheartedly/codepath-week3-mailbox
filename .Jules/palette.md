## 2024-10-24 - Accessibility Actions for Custom Gestures
**Learning:** Custom pan gestures like swipe-to-archive are inaccessible to VoiceOver users. `UIAccessibilityCustomAction` bridges this gap by exposing these gestures as rotor actions.
**Action:** When implementing custom gestures, always add corresponding `UIAccessibilityCustomAction`s that trigger the same completion logic. Refactor completion logic into helper methods to share between gesture handlers and accessibility actions.
