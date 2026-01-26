## 2026-01-26 - Accessibility Actions for Custom Gestures
**Learning:** Custom pan gestures for swipe actions (like Archive/Delete) are inaccessible to VoiceOver users because they cannot perform precise drag gestures.
**Action:** Always implement `UIAccessibilityCustomAction`s that mirror the logic of swipe gestures, allowing assistive technology users to trigger the same outcomes programmatically.
