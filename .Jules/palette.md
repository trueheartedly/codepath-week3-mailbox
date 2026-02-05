## 2024-10-24 - [Accessible Custom Swipe Gestures]
**Learning:** Custom pan gestures on `UIImageView`s are invisible to VoiceOver. To make them accessible, we must implement `UIAccessibilityCustomAction`s that programmatically trigger the same completion logic as the gesture's "Ended" state.
**Action:** When implementing custom gestures, always extract the "completion/success" logic into a helper method (e.g., `finishRightSwipe()`) that can be called by both the gesture recognizer and the accessibility action handler.
