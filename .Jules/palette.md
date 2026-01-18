## 2024-10-24 - Exposing Custom Gestures to VoiceOver
**Learning:** Custom pan gestures on views (like swipe-to-action) are inaccessible to VoiceOver users as they cannot perform precise drags.
**Action:** Encapsulate the "completion" logic of the gesture into a shared method, then expose `UIAccessibilityCustomAction`s that set the necessary state and call that shared method.
