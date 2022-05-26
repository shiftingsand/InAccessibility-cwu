# InAccessibility

## Intro and Background

I'm [Chris Wu](https://twitter.com/MuseumShuffle) and this is my entry for the Accessibility challenge. The first app I ever wrote was [Museum Shuffle](https://apps.apple.com/us/app/museum-shuffle/id1367002436) with UIKit. One day when my mom was visiting I happened to watch her using my app and was horrified when I realized that one of my Views was completely broken. The tab that shows your saved favorites is supposed to show a larger version of the artwork and text describing the title/artist when you tap on it. She was only being shown a huge version of the artwork with no text. I figured out it was because she had very large accessibility fonts enabled, which broke my constraints for that View. That was something I never even considered when making the app as a beginner. I fixed the problem and when I rewrote the app in SwiftUI I had accessibility at the forefront of my mind. Ever since then it's been important to me to make sure that the apps that I write support accessibility features.

My two main goals for this project were to make the app useable for people that use very large accessibility fonts (even on very small screens) and VoiceOver users.

## Colorblindness

I did [some research](https://www.tableau.com/about/blog/examining-data-viz-rules-dont-use-red-green-together) and found that green/red colorblindness is very common. I changed the gear button so that it would go to a settings menu where the user can choose colors that are hopefully more useful. 

<img width="300" alt="The menu where colors are selected." src="https://github.com/shiftingsand/InAccessibility-cwu/blob/main/052522colorMenu.png">

<img width="300" alt="The UI after an alternate color scheme has been selected." src="https://github.com/shiftingsand/InAccessibility-cwu/blob/main/052522colorResult.png">

I made some logic so that the accessibility hint will describe what color is being replaced and what that color indicates.

Something I can't figure out is how to stop the footer in a Section of a SwiftUI Form from bleeding into the section when the largest accessibility fonts are used.

<img width="300" alt="Large text from the footer bleeding into the body of the Section." src="https://github.com/shiftingsand/InAccessibility-cwu/blob/main/052522colorBleed.png">

## Misc

I also thought the black graph was hard to read in dark mode so I had that change when toggling between light and dark mode. I wasn't sure how to handle the graph for VoiceOver users and settled on the graph being one combined item that reads the point values.

I coded this as an iPhone app in portrait mode.

----
A SwiftUI app that's not very accessible... On purpose

This app is part of the [Accessibility](https://www.swiftuiseries.com/accessibility) event during the SwiftUI Series. This project has been made inaccessible and non-inclusive on purpose. Can you fix the 20+ areas that can be improved?
