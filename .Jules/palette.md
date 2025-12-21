## 2024-10-24 - Accessibility for Custom Gestures
**Learning:** For apps relying on custom `UIPanGestureRecognizer` (like "swipe to archive"), elements are often inaccessible to VoiceOver users because the gesture recognizer intercepts touches.
**Action:** Always expose these interactions via `UIAccessibilityCustomAction`. This allows VoiceOver users to access the same functionality (Archive, Later, etc.) through the Actions Rotor without needing the complex physical gesture.
