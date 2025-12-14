## 2024-05-21 - Custom Gestures on UIImageViews
**Learning:** `UIImageView`s are often used as interactive elements in prototypes but default to `isAccessibilityElement = false`. This makes custom gesture interactions invisible to VoiceOver users.
**Action:** Always manually enable accessibility and provide detailed hints for custom gesture interactions on image-based controls.
