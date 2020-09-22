# FXView

VFXView is a framework custom UIView by add some animation and effect.

# Table of contents
* [1 Installation](#Installation)
* [2 Setup](#Setup)
* * [2.1 Snow fall](#Snowfall)

## <a id="Installation"></a>1. Installation

### CocoaPods:

```ruby
use_frameworks!
target '<Your Target Name>' do
    pod 'VFXView'
end
```

### Manually

* Drag all files under `FSCalendar` folder into your project.
*

## <a id="Setup"></a>2. Setup

### <a id="Snowfall"></a>2.1 Snow fall 

With **VFXSnowView** you can create the snow fall effect on your view like bellow.

<p align="center">
  <img src="https://media.giphy.com/media/BF9N1QUCwlg61kGKKR/giphy.gif">
</p>

#### 2.1.2 Use Interface Builder

1 Drag an VFXSnowView object to **ViewController** <br/>

2 Change the **Custom Class** to **VFXSnowView** <br/>

3 Add outlet to **VFXSnowView** <br/>

<p align="center">
  <img src="docs/storyboard.png">
</p>

4 Start animation **VFXSnowView** <br/>

```swift
snowView.snowCount = 150 // Number of particle
snowView.snowRadius = 5 // Max radius of particle
snowView.start() // Start animation
```

#### 2.1.2 Or use code

```swift
let snowView = VFXSnowView(frame: self.view.bounds)
snowView.snowCount = 150 // Number of particle
snowView.snowRadius = 5 // Max radius of particle
snowView.start() // Start animation
```