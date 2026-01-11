## 2024-05-23 - Accessibility Custom Actions
**Learning:** Custom swipe gestures in iOS (especially in legacy Swift) are completely invisible to VoiceOver unless explicitly exposed via UIAccessibilityCustomAction. Extracting the completion logic into helper methods (e.g., completeRightSwipe) allows reusing animation code for both gesture and accessibility triggers.
**Action:** Always refactor gesture completion handlers into separate methods to easily hook in accessibility actions.
