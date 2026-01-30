## 2026-01-30 - [Gesture Accessibility]
**Learning:** Gesture-only interfaces like swipe-to-archive exclude users who cannot perform complex or precise gestures. Relying solely on `UIPanGestureRecognizer` creates a barrier for users with limited motor control or vision impairments.
**Action:** Always provide `UIAccessibilityCustomAction`s for any swipe-based actions to ensure they are accessible via VoiceOver rotor or custom gestures, mirroring the outcomes of the complex interactions.
