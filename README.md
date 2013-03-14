QCBlock
=======

A Cinder block inspired by Memo Atken's ofxQuartzComposition. It enables Cinder (libcinder.com) to load/control/run Quartz Compositions.



Installation
============

After cloning the "QCBlock" floder place it in "(CINDER_PATH)/blocks/" and you're set. There is no static library (yet!) so you'd have to import the "src" folder to XCode.


Notes
=====

1. Include "QCBlock.h" to your cinder app which in turn will include the necessary headers.
2. The "registerEvents" method is not compatibale with the Rewrite branch of Cinder at the moment. It works with ci::callbackId right now which should be modified to use boost::signals2 as soon as possible.
Use the "registerEvents" method to pass Cinder events (mouse, key etc.) to your QC Composition.
