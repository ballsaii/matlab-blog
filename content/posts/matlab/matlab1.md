---
author: "BBon"
date: 2014-09-28
linktitle: Creating a New Theme
menu:
  main:
    parent: matlab
next: /tutorials/github-pages-blog
prev: /tutorials/automated-deployments
title: Creating a New Theme
weight: 10
---


## MATLAB

```MATLAB
x = [1:10];
function mtest
  for i=1:10
  y(i) = x(i)+1;
  end
end
```
```
x = [1:10];
function mtest
  for i=1:10
  y(i) = x(i)+1;
  end
end
```

### Don't Repeat Yourself

DRY is a good design goal and Hugo does a great job supporting it. Part of the art of a good template is knowing when to add a new template and when to update an existing one. While you're figuring that out, accept that you'll be doing some refactoring. Hugo makes that easy and fast, so it's okay to delay splitting up a template.
