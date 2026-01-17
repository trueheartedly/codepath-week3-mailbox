## 2025-02-18 - Accessibility for Custom Pan Gestures
**Learning:** This app relies on `UIPanGestureRecognizer` on `UIImageView`s for core interactions (Archive/Delete/Later/List) without any native accessibility support. VoiceOver users cannot perform these actions.
**Action:** Always implement `UIAccessibilityCustomAction`s when using custom gesture recognizers for primary actions to expose them to Assistive Technologies.
