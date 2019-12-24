# Pre-work - *Tip Calculator*

**Tip Calculator** is a tip calculator application for iOS.

Submitted by: **Bernard Wong**

Date: 12.23.19

Time spent: **~8** hours spent in total

## Functionality of the Application 
A basic tip calculator application was created with the help of CodePath's [tip calculator tutorial](https://www.youtube.com/watch?v=fokeaXUdoz8) and information from [Stanford's first iOS lecture](https://www.youtube.com/watch?v=71pyOB4TPRE&vl=en-US). This application contains basic features for an application that calculates the bill which include: 

- the ability for a user to enter a bill amount 
- the ability for a user to choose a tip percentage 
- the ability to see the tip and total values. 

Along with this, a few additional features were added in. By researching different methods and learning from various sources such as Stanford's iOS lectures and stack overflow, I was able to learn a little bit more about how swift works and as a result was able to implement: 

- the ability for a user to enter in a tax amount that is also factored into the total bill 
- a scroller for users to choose a specific tip percentage in case they want to select another tip percentage other than the quick select tip percentages 
- additional information on how much the bill is if it is split amongst 2,3,4, or 5 people 
- a keyboard that is always visible so that the user can efficiently enter in information at all times 
- a visual cue of tip percentage, changing the app background to red if tip percentage ranges from 0-10%, yellow if tip percentage ranges from 10-20%, and green if tip percentage ranges from 20-100%. 
- an app icon and loading screen 

Changes occur whenever the bill/tax amount or tip percentages are changed in order to provide information as quickly as possible. 

## Video Walkthrough 

Here's a video showing the basic functionality of the app: 

<p align="center">
  <img src="https://github.com/bew030/tip-calculator/blob/master/appdemo.gif" />
</p>

## Understanding the code 

Code has been properly documented and methods have been properly described. The swift code that I wrote can be found in [the viewcontroller file](https://github.com/bew030/tip-calculator/blob/master/TipCalculator/ViewController.swift). The storyboard I used to make the app can be found in the [main storyboard file](https://github.com/bew030/tip-calculator/blob/master/TipCalculator/Base.lproj/Main.storyboard) (although I strongly advise viewing it in Xcode). The loading screen contains a tipping icon found from [visualpharm](https://www.visualpharm.com/free-icons/restaurant-595b40b75ba036ed117d9bca); the storyboard and can be found [here](https://github.com/bew030/tip-calculator/blob/master/TipCalculator/Base.lproj/LaunchScreen.storyboard). Other code is generally unaltered. 

## Notes
__Things I learned:__

This was my first experience with Swift and Xcode and it was a super cool experience. Coming from a Python and Java background, it was a unique experience being able to work with storyboards and essentially plan things visually and code simultaneously. The newest concept that I probably had to grasp was the idea of external and internal parameter names, as well as the concept of outlets and the usage of ! and ?? operators. Overall it was a super cool experience and I'm looking forward to improving and creating new apps.  

__What can be improved:__ 

- While the background changing colors is a cool idea, I'm really hoping to learn how to change the background in a gradient fashion. That way 20% can visually be much more different than 100%. I'm thinking that you can manipulate percentages of rgb dependent on the tip percentage and I have an idea of how to do this in python or java but right now I don't know enough about swift to implement it 
- While I was able to limit most of the labels involving currency to 2 decimal points, I'm not too sure how to limit user inputs to two decimal places (for example, it's possible for a user to input $3.2534 even though this isn't an actual amount). I googled it and found that it was possible but I didn't exactly understand the code so I'm hoping to learn more about swift so that I can understand the method before implementing it 
- I think the app that I made is very visually old fashioned (it looks like HTML without any CSS). I tried to change around the fonts but there wasn't much to work with (that I could find at least) so I'm hoping to learn more about how to change the app stylistically (both in style and animation)
- While I feel like I did a pretty good job avoiding repetitive code and making functions when functions were needed, I definitely feel like more items involving splitting the bill could have been organized into arrays. I essentially hard coded an array of information involving the amounts of the bill (where it only stores information for splits of 2,3,4, and 5 people) and the code would need to be changed if I decided to implement more options for splitting the bill. In general I think I need more practice with arrays in swift. 
