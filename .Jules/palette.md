## 2024-10-24 - Accessibility in Prototype Apps
**Learning:** Image-based prototypes are inaccessible by default because screen readers see them as blank canvases.
**Action:** When building prototypes, always add `accessibilityLabel` and `accessibilityHint` to interactive image views to make them usable by VoiceOver, even if the underlying controls are fake.
