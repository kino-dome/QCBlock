//
//  QCBlockUtilities.h
//  QCEventTest
//
//  Created by Hesam Ohadi on 3/10/13.
//
//
#pragma once

#include "cinder/app/App.h"

#ifdef __OBJC__
#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>
#else
class NSString;
class NSPoint;
class NSNumber;
class NSColor;
class CIImage;
class NSUInteger;
#endif

using namespace ci;
using namespace ci::app;
using namespace std;


namespace cinder { namespace QCBlock {
    
    NSString* toNSString(std::string aString);
    std::string fromNSString(NSString *aString);
    NSNumber* toNSNumber(int aNum);
    NSNumber* toNSNumber(float aNum);
    float fromNSNumber(NSNumber *aNum);
    NSColor* toNSColor(const ColorAf &aCol);
    CIImage* toCIImage(const gl::Texture &aTex);
    
    int keyCodeForKeyString(char key);
    NSPoint ciPosToQC(const Vec2f &aPos);
    Vec2f QCPosToCi(NSPoint aPos);
    
   // GLuint								copyTextureToRectTexture(id<QCPlugInContext> qcContext, GLuint textureName, GLsizei width, GLsizei height, GLenum textureTarget, bool flipped=false);
   // gl::Texture							ciTextureFromQCImage(id<QCPlugInContext> qcContext, id<QCPlugInInputImageSource> qcImage);
    //Surface						ciSurfaceFromQCImage(id<QCPlugInContext> qcContext, id<QCPlugInInputImageSource> qcImage);
   // id<QCPlugInOutputImageProvider>		qcImageFromCiTexture(id<QCPlugInContext> qcContext, gl::Texture &texture, void* releaseCallback);
    ColorAf								ciColorFromCGColorRef(CGColorRef color);
    CGColorRef							cgColorRefFromCiColor(ColorAf &color);

    
}}