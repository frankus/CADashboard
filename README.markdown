Cycle Analyst Dashboard for iOS
==============================

This is a *very* preliminary version of an iOS dashboard app for interfacing with a Cycle Analyst unit from [ebikes.ca](http://ebikes.ca/). The Cycle Analyst is a very cool amp-hour/voltage/speed monitor for electric bikes and other (mostly small) electric vehicles. 

To use this project, you will need:

- A Cycle Analyst unit modified to drive a standard serial interface as described in chapter 9 of [the manual](http://www.ebikes.ca/drainbrain/CycleAnalyst_Manual_Vers223.pdf)
- A Serial Cable for your iOS device (this project uses the [SkyWire cable](http://www.southernstars.com/products/skywire/index.html) from Southern Stars) 
- A way of getting the compiled code onto your device, traditionally done by registering for an iOS developer account with Apple. 

Testing
-------

This project has not been tested with an actual unit. Instead I have used a USB serial interface (in my case a PL2303-chipset device on my MacBook) and a small (included) ruby script (simCA.rb). 

Small Print
-----------

This project is not affiliated with the folks who make the Cycle Analyst unit, although they're a nice group of people. 

License
-------

Copyright &copy; 2011 Laika Systems. 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.