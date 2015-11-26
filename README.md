UIButton+BackgroundContentMode
==============================

[![CocoaPods](http://img.shields.io/cocoapods/v/UIButton+BackgroundContentMode.svg?style=flat)](https://cocoapods.org/pods/UIButton%2BBackgroundContentMode)

A missing background content mode for UIButton.


When to use?
------------

<img src="https://cloud.githubusercontent.com/assets/931655/11419768/e6e0826e-946c-11e5-81e9-70b13972e997.png" alt="scale-to-fill" width="150" align="right" hspace="20" />

Let's assume that we have to set background image of UIButton. Like this:

```objc
[button setBackgroundImage:image forState:UIControlStateNormal];
```

Oh my god. Aspect ratio has broken. :weary:<br />
It's time to use **UIButton+BackgroundContentMode** to keep background image aspect ratio.

<br />

Installation
------------

Use [CocoaPods](http://cocoapods.org).

```ruby
pod 'UIButton+BackgroundContentMode', '~> 0.1'
```


Usage
-----

Import `UIButton+BackgroundContentMode`, then set `backgroundContentMode` of UIButton.

For example:

<img src="https://cloud.githubusercontent.com/assets/931655/11419769/e702fbb4-946c-11e5-9b32-0fedb56021e2.png" alt="aspect-fit" width="150" align="left" />
<br />

```objc
button.backgroundContentMode = UIViewContentModeScaleAspectFit;
```

<br /><br />

<img src="https://cloud.githubusercontent.com/assets/931655/11419770/e71e8fd2-946c-11e5-984c-4686e7108e06.png" alt="aspect-fill" width="150" align="left" />
<br />

```objc
button.backgroundContentMode = UIViewContentModeScaleAspectFill;
```

<br /><br />

Finish! Set background image and enjoy coding. :tada:


License
-------

UIButton+BackgroundContentMode is under MIT license. See the [LICENSE](LICENSE) file for more info.
