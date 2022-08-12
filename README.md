# EN13715

A platform independent Swift Package implementing the **EN 13715:2020 Railway applications - 
Wheelsets and bogies - Wheels - Tread profile**.

## Introduction

**EN 13715:2020** defines three families of profiles for standard gauge railways:
* 1/40,
* S1002 and
* EPS (including the former P8 profile).

This Swift Package implements the complete standard for profile generation.

## Use of this Package

### Including the Package in your project

To include the Package in your project simply add the package as a dependency into your 
Swift Package Manager project or into your application project.

### Public API

The public API is straightforward. Profiles are created in a syntax, which is similar to
the project definition according EN 13715:

```swift
// Create a profile EN 13715 — 1/40 / h30 / e32,5 / 15% for a wheel with 135 mm width. 
let oneTo40 = try? EN13715.profile(.oneTo40, h: 30.0, e: 32.5, 15, wheelWidth: 135)

// Create a profile EN 13715 — S1002 / h28 / e30,5 / 10% for a wheel with 140 mm width. 
let s1002 = try? EN13715.profile(.s1002, h: 30, e: 30, 15)

// Create a profile EN 13715 — EPS / h31 / e32 / 6,7% for a wheel with 135 mm width. 
let eps = try? EN13715.profile(.eps, h: 31.0, e: 32, 6.7, wheelWidth: 135)
```

After creating the profile, the x/y-coordinate versions can be retreived:

```swift
let profile = s1002.profile(resolution: 0.5)
```

The resolution in which the profile is sampled defines the maximum distance, between two
neighboring points. The algorithm may decide to return more points. The characteristic 
points of the profiles, which are defined in the standard are always included in the 
array of points, which are returned.

### Co-ordinates

EN 13715 defines a co-ordinate system, which has its origin in the point D0, which is located on 
the running surface at 70 mm distance from the wheel back. The y-axis is pointing
in lateral direction of the profile and the z-axis in vertical direction. All measures are given
in Millimeters.

This package uses a co-ordinate system, which has the same origin, but where there is an x-axis
and a y-axis, because this matches better the typical usage in software.  
