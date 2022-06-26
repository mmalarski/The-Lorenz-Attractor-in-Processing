# The Lorenz Attractor in Processing

---

### Introduction
Simple animation using Lorenz equations based on the 
[Coding Train](https://thecodingtrain.com/)'s youtube 
[video](https://www.youtube.com/watch?v=f0lkz2gSsIk).

### Prerequisites
* [Processing IDE](https://processing.org/download)
* PeasyCam 302 Library by Jonathan Feinberg

![Visualisation](visualisation.gif)

### Tips
You can generate desired number of frames and save them on your drive by uncommenting
and altering these lines at the end of the file:  
```
    saveFrame("/images/lorentz####.png");
    if (counter == 8000) {
      exit();
    }
```