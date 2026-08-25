# ColorMaker

A simple iOS app built with **UIKit** and **programmatic Auto Layout** that lets you mix a custom color using three RGB sliders.

## Overview

ColorMaker displays a bordered preview square in the center of the screen, with three labeled sliders (Red, Green, Blue) stacked above it. Dragging any slider updates the preview square's background color in real time by combining the current values of all three sliders.

## Features

- Pure UIKit, no Storyboard/XIB — all views are created and laid out in code
- Programmatic Auto Layout using `NSLayoutConstraint.activate`
- Three `UISlider` controls (0.0–1.0 range) mapped directly to RGB components
- Live color preview via a bordered `UIView`
- Single `@objc` action method (`changeValue(_:)`) shared by all three sliders

## Requirements

- Xcode 15+
- iOS 13+
- Swift 5

## Project Structure

```
ColorMaker/
├── AppDelegate.swift
├── SceneDelegate.swift
├── ViewController.swift   # All UI setup and logic lives here
├── Main.storyboard        # Empty/default entry point
├── Assets.xcassets
└── Info.plist
```

## How It Works

### UI Setup (`configureUI()`)

Called once from `viewDidLoad()`. It:

1. Creates the `colorView` preview square (200×200, white border, clear background)
2. Creates three labels (`redControlLabel`, `greenControlLabel`, `blueControlLabel`), each tinted to match its channel
3. Creates three `UISlider` instances (`redControl`, `greenControl`, `blueControl`), each defaulting to `0.5`
4. Adds every view to the hierarchy with `addSubview` **before** activating constraints
5. Activates a single `NSLayoutConstraint.activate([...])` block that:
   - Centers `colorView` in the view
   - Stacks the three labels above it, right-aligned to each other
   - Pins each slider's top edge to its corresponding label
   - Gives each slider an explicit width (sliders have no intrinsic width, so this is required — see [Known Issues](#known-issues))

### Color Updates (`changeValue(_:)`)

```swift
@objc func changeValue(_ sender: UISlider) {
    colorView.backgroundColor = UIColor(
        red: CGFloat(redControl.value),
        green: CGFloat(greenControl.value),
        blue: CGFloat(blueControl.value),
        alpha: 1
    )
}
```

All three sliders call this same method on `.valueChanged`. Rather than branching on which slider fired (via `tag` or `sender`), it simply reads the current value of all three sliders every time — since the final color always depends on all three channels together.

## License

Personal learning project — no license specified.
