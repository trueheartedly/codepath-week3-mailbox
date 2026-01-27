## 2024-05-22 - [Accessibility Actions for Gestures]
**Learning:** Replicating gesture-based actions for VoiceOver requires explicitly setting state flags (e.g., showReschedule) and visual properties (colors, alphas) before triggering the completion animation, as the gesture recognizer's "Changed" state is bypassed.
**Action:** Extract completion logic into shared helper methods where possible, but be prepared to manually set state in action handlers if refactoring is risky.
