# InAccessibility
I'm [Chris Wu](https://twitter.com/MuseumShuffle) and this is my entry. My two main goals were to make this app useable for people that use very large accessibility fonts (even on very small screens) and VoiceOver users.

I did [some research](https://www.tableau.com/about/blog/examining-data-viz-rules-dont-use-red-green-together) and found that green/red colorblindness is very common. I changed the gear button so that it would go to a settings menu where the user can choose colors that are hopefully more useful. 


![The menu where colors are selected.](https://github.com/shiftingsand/InAccessibility-cwu/blob/main/052522colorMenu.png)

![The UI after an alternate color scheme has been selected.](https://github.com/shiftingsand/InAccessibility-cwu/blob/main/052522colorResult.png)

I made some logic so that the accessibility hint will describe what color is being replaced and what that color indicates.

Something I can't figure out is how to stop the footer in a Section of a SwiftUI Form from bleeding into the section when the largest accessibility fonts are used.

![Large text from the footer bleeding into the body of the Section.](https://github.com/shiftingsand/InAccessibility-cwu/blob/main/052522colorBleed.png)

I also thought the black graph was hard to read in dark mode so I had that change when toggling between light and dark mode.

I coded this as an iPhone app in portrait mode. The simulator will still let you use landscape even though I didn't select that in Device Orientation. [This blog post](https://www.jessesquires.com/blog/2021/11/13/xcode-13-device-orientation-bug/) talks about that.

----
A SwiftUI app that's not very accessible... On purpose

This app is part of the [Accessibility](https://www.swiftuiseries.com/accessibility) event during the SwiftUI Series. This project has been made inaccessible and non-inclusive on purpose. Can you fix the 20+ areas that can be improved?
