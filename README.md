# UIView-FDCollapsibleConstraints
![forkingdog](https://cloud.githubusercontent.com/assets/219689/7244961/4209de32-e816-11e4-87bc-b161c442d348.png)

# Overview
`UIView+FDCollapsibleConstraints` builds to **collapse** a view and its relevant layout constraints, simulating a **"Flow Layout"** mode.

## Demo 1 
This demo collapses the `forkingdog` image view and its bottom margin constraint.  

![view demo](https://github.com/forkingdog/UIView-FDCollapsibleConstraints/blob/master/Sceenshots/screenshot0.gif)  

## Demo 2

This demo collapses diffent components in cell, according to its data entity, each margin handles right as well.  

![cell demo](https://github.com/forkingdog/UIView-FDCollapsibleConstraints/blob/master/Sceenshots/screenshot1.gif)

# Basic usage

## 1. Select constraints to collapse
First, tell which constraints will be collapsed when the view collapses. We provide a `IBOutletCollection` to make it easier in Interface Builder:  

```
@property (nonatomic, copy) IBOutletCollection(NSLayoutConstraint) NSArray *fd_collapsibleConstraints;
```  

You can assgin it by codes, but it's better to **"connect lines"** in Interface Builder:   

![connecting lines](https://github.com/forkingdog/UIView-FDCollapsibleConstraints/blob/master/Sceenshots/screenshot2.gif)

## 2. Collapse a view

Selected constraints will collapse when:  

```
view.fd_collapsed = YES;
```
![collapsed](https://github.com/forkingdog/UIView-FDCollapsibleConstraints/blob/master/Sceenshots/screenshot5.png)

And expand back when:

```
view.fd_collapsed = NO;
```

![recovered](https://github.com/forkingdog/UIView-FDCollapsibleConstraints/blob/master/Sceenshots/screenshot6.png)

# Auto collapse

Not every view needs to add a width or height constraint, views like `UILabel`, `UIImageView` have their `Intrinsic content size` when they have content in it. For these views, we provide a `Auto collapse` property, when its content is gone, selected constraints will collapse automatically.  
You can enable auto collapse by:  

```
label.fd_autoCollapse = YES;
imageView.fd_autoCollapse = YES;
```

And it will work as you expect: 

```
label.text = nil/*or @""*/; (auto => label.fd_collapsed = YES)
label.text = @"forkingdog"; (auto => label.fd_collapsed = NO)
imageView.image = nil; (auto => imageView.fd_collapsed = YES)
imageView.image = [UIImage imageNamed:@"forkingdog"]; (auto => imageView.fd_collapsed = NO)
```

We've also offered a Interface Builder friendly way to enable `auto collapse`:  

```
@property (nonatomic, assign, getter=fd_autoCollapse) IBInspectable BOOL autoCollapse;
```

Here's what you may find in `Attribute Inspector`

![auto collapse](https://github.com/forkingdog/UIView-FDCollapsibleConstraints/blob/master/Sceenshots/screenshot4.png)

It's behavior is same as setting `fd_autoCollapse` property in code.

# Installation  

Cocoapods: 
```
pod search UIView+FDCollapsibleConstraints
```

# License
MIT
