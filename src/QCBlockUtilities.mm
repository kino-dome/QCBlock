//
//  QCBlockUtilities.cpp
//  QCEventTest
//
//  Created by Hesam Ohadi on 3/10/13.
//
//
#include "cinder/app/App.h"
#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>
#include "QCBlockUtilities.h"
#include "cinder/gl/Texture.h"

using namespace ci;
using namespace ci::app;
using namespace std;

namespace cinder { namespace QCBlock {
    
    //from Memo's Code
    NSString* toNSString(std::string aString)
    {
        return [NSString stringWithUTF8String:aString.c_str()];
    }
    
    std::string fromNSString(NSString *aString)
    {
        return std::string([aString UTF8String]);
    }
    //
    
    NSNumber* toNSNumber(int aNum)
    {
        return [NSNumber numberWithInt:aNum];
    }
    
    NSNumber* toNSNumber(float aNum)
    {
        return [NSNumber numberWithFloat:aNum];
    }
    
    float fromNSNumber(NSNumber *aNum)
    {
        return [aNum floatValue];
    }

    
    NSColor* toNSColor(const ColorAf &aCol)
    {
        
        CGFloat cgCol[4];
        cgCol[0]=aCol.r; cgCol[1]=aCol.g; cgCol[2]=aCol.b; cgCol[3]=aCol.a;
        NSColorSpace* space = [NSColorSpace genericRGBColorSpace];
        
        NSColor* nsCol=[NSColor colorWithColorSpace:space components:cgCol count:4];
        return nsCol ;
    }
    
    CIImage* toCIImage(const gl::Texture &aTex)
    {
        CIImage* ciImage;
        CGSize size;
        size.width=aTex.getWidth();
        size.height=aTex.getHeight();
        CGColorSpaceRef space= CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
        
        ciImage=[CIImage imageWithTexture:aTex.getId() size:size flipped:false colorSpace:space];
        
        CGColorSpaceRelease(space);
        
        return ciImage;
        
    }
    //From RUI Project : http://ritter.ist.psu.edu/projects/RUI/macosx/rui.c
    
    int keyCodeForKeyString(char key)
    {
        string keyString=string(1,key);
        if ((keyString== "a") ) return 0;
        if ((keyString== "s") ) return 1;
        if ((keyString== "d") ) return 2;
        if ((keyString== "f") ) return 3;
        if ((keyString== "h") ) return 4;
        if ((keyString== "g") ) return 5;
        if ((keyString== "z") ) return 6;
        if ((keyString== "x") ) return 7;
        if ((keyString== "c") ) return 8;
        if ((keyString== "v") ) return 9;
        // what is 10?
        if ((keyString== "b") ) return 11;
        if ((keyString== "q") ) return 12;
        if ((keyString== "w") ) return 13;
        if ((keyString== "e") ) return 14;
        if ((keyString== "r") ) return 15;
        if ((keyString== "y") ) return 16;
        if ((keyString== "t") ) return 17;
        if ((keyString== "1") ) return 18;
        if ((keyString== "2") ) return 19;
        if ((keyString== "3") ) return 20;
        if ((keyString== "4") ) return 21;
        if ((keyString== "6") ) return 22;
        if ((keyString== "5") ) return 23;
        if ((keyString== "=") ) return 24;
        if ((keyString== "9") ) return 25;
        if ((keyString== "7") ) return 26;
        if ((keyString== "-") ) return 27;
        if ((keyString== "8") ) return 28;
        if ((keyString== "0") ) return 29;
        if ((keyString== "]") ) return 30;
        if ((keyString== "o") ) return 31;
        if ((keyString== "u") ) return 32;
        if ((keyString== "[") ) return 33;
        if ((keyString== "i") ) return 34;
        if ((keyString== "p") ) return 35;
        if ((keyString== "RETURN") ) return 36;
        if ((keyString== "l") ) return 37;
        if ((keyString== "j") ) return 38;
        if ((keyString== "'") ) return 39;
        if ((keyString== "k") ) return 40;
        if ((keyString== ";") ) return 41;
        if ((keyString== "\\") ) return 42;
        if ((keyString== ",") ) return 43;
        if ((keyString== "/") ) return 44;
        if ((keyString== "n") ) return 45;
        if ((keyString== "m") ) return 46;
        if ((keyString== ".") ) return 47;
        if ((keyString== "TAB") ) return 48;
        if ((keyString== " ") ) return 49;
        if ((keyString== "`") ) return 50;
        if ((keyString== "DELETE") ) return 51;
        if ((keyString== "ENTER") ) return 52;
        if ((keyString== "ESCAPE") ) return 53;
        
        // some more missing codes abound, reserved I presume, but it would
        // have been helpful for Apple to have a document with them all listed
        
        if ((keyString== ".") ) return 65;
        
        if ((keyString== "*") ) return 67;
        
        if ((keyString== "+") ) return 69;
        
        if ((keyString== "CLEAR") ) return 71;
        
        if ((keyString== "/") ) return 75;
        if ((keyString== "ENTER") ) return 76;  // numberpad on full kbd
        
        if ((keyString== "=") ) return 78;
        
        if ((keyString== "=") ) return 81;
        if ((keyString== "0") ) return 82;
        if ((keyString== "1") ) return 83;
        if ((keyString== "2") ) return 84;
        if ((keyString== "3") ) return 85;
        if ((keyString== "4") ) return 86;
        if ((keyString== "5") ) return 87;
        if ((keyString== "6") ) return 88;
        if ((keyString== "7") ) return 89;
        
        if ((keyString== "8") ) return 91;
        if ((keyString== "9") ) return 92;
        
        if ((keyString== "F5") ) return 96;
        if ((keyString== "F6") ) return 97;
        if ((keyString== "F7") ) return 98;
        if ((keyString== "F3") ) return 99;
        if ((keyString== "F8") ) return 100;
        if ((keyString== "F9") ) return 101;
        
        if ((keyString== "F11") ) return 103;
        
        if ((keyString== "F13") ) return 105;
        
        if ((keyString== "F14") ) return 107;
        
        if ((keyString== "F10") ) return 109;
        
        if ((keyString== "F12") ) return 111;
        
        if ((keyString== "F15") ) return 113;
        if ((keyString== "HELP") ) return 114;
        if ((keyString== "HOME") ) return 115;
        if ((keyString== "PGUP") ) return 116;
        if ((keyString== "DELETE") ) return 117;
        if ((keyString== "F4") ) return 118;
        if ((keyString== "END") ) return 119;
        if ((keyString== "F2") ) return 120;
        if ((keyString== "PGDN") ) return 121;
        if ((keyString== "F1") ) return 122;
        if ((keyString== "LEFT") ) return 123;
        if ((keyString== "RIGHT") ) return 124;
        if ((keyString== "DOWN") ) return 125;
        if ((keyString== "UP") ) return 126;
        
        return 0;
    }
    
    //

    NSPoint ciPosToQC(const Vec2f &aPos)
    {
        float width=app::App::get()->getWindowWidth();
        float height=app::App::get()->getWindowHeight();
        Vec2f normalizedPos= aPos/Vec2f(width,height);
        normalizedPos.y=1.0-normalizedPos.y;
        normalizedPos-=Vec2f(0.5,0.5);
        normalizedPos*=Vec2f(2.0,(height/width)*2.0);
        NSPoint result;
        result.x = normalizedPos.x;
        result.y = normalizedPos.y;
        return result;
    }
    
    Vec2f QCPosToCi(NSPoint aPos)
    {
        float width=app::App::get()->getWindowWidth();
        float height=app::App::get()->getWindowHeight();
        float QCHeight= (height/width)*2.0;
        Vec2f result;
        result.x= ((aPos.x+1.0)/2.0)*width;
        result.y= (1.0-((aPos.y+QCHeight/2.0)/QCHeight))*height;
        return result;
    }
    
    ColorAf ciColorFromCGColorRef(CGColorRef color)
    {
        const float* refColor;
        refColor= CGColorGetComponents(color);
        
        ColorAf newColor= ColorAf(refColor[0],refColor[1],refColor[2],refColor[3]);
        return newColor;
    }
    
    CGColorRef cgColorRefFromCiColor(ColorAf &color)
    {
        static float refColor[4];
        refColor[0] = color.r;
        refColor[1] = color.g;
        refColor[2] = color.b;
        refColor[3] = color.a;
        
        CGColorSpaceRef space = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
        
        CGColorRef newColorRef =  CGColorCreate(space, refColor);
        
        // no leaks
        CGColorSpaceRelease(space);
        
        return newColorRef;
    }
    
    }}