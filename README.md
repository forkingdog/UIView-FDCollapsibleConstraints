# UIView-FDCollapsibleConstraints
![forkingdog](https://cloud.githubusercontent.com/assets/219689/7244961/4209de32-e816-11e4-87bc-b161c442d348.png)

# Overview
`UIView+FDCollapsibleConstraints` builds to **collapse** a view and its relevant layout constraints. 

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

![cell demo](https://github.com/forkingdog/UIView-FDCollapsibleConstraints/blob/master/Sceenshots/screenshot2.gif)

## 2. Collapse a view

Selected constraints will collapse:  

```
view.fd_collapsed = YES;
```

And recover back properly:

```
view.fd_collapsed = NO;
```

# Auto collapse






# License
MIT
