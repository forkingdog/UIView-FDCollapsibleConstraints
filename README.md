# UIView-FDCollapsibleConstraints
![forkingdog](https://cloud.githubusercontent.com/assets/219689/7244961/4209de32-e816-11e4-87bc-b161c442d348.png)

# Overview
`UIView+FDCollapsibleConstraints` builds to **collapse** a view and its relevant layout constraints. 

This demo collapses the `forkingdog` image view and its bottom margin constraint.  

![view demo](https://github.com/forkingdog/UIView-FDCollapsibleConstraints/blob/master/Sceenshots/screenshot0.gif)  

This demo collapses diffent components in cell, according its data entity, each margin is handled right as well.  

![cell demo](https://github.com/forkingdog/UIView-FDCollapsibleConstraints/blob/master/Sceenshots/screenshot1.gif)

# Basic usage

First, tell which constraints will be collapsed when the view collapses. We provide a `IBOutletCollection` to make it easier in Interface Builder:  

```
@property (nonatomic, copy) IBOutletCollection(NSLayoutConstraint) NSArray *fd_collapsibleConstraints;
```  

You can assgin it by codes, but it's better to **"connect lines"** in Interface Builder:   

![cell demo](https://github.com/forkingdog/UIView-FDCollapsibleConstraints/blob/master/Sceenshots/screenshot2.gif)


# Auto collapse






# License
MIT
