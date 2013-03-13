//
//  QuartzComposition.h
//  
//
//  Created by Hesam Ohadi on 3/5/13.
//
//


#pragma once

#include "cinder/app/App.h"
#include "cinder/Rand.h"
#include "QCBlockUtilities.h"

#ifdef __OBJC__
#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>
#else
class QCComposition;
class id;
class QCRenderer;
class NSArray;
class NSEvent;
#endif

using namespace ci;
using namespace ci::app;
using namespace std;

namespace cinder { namespace QCBlock{
	
	class QuartzComposition {
	public:
		QuartzComposition();
       // QuartzComposition(app::App *aApp);
		~QuartzComposition();
        
        void registerEvents(app::App *aApp);
        
        bool   mouseDown(MouseEvent event);
        bool   mouseUp(MouseEvent event);
        bool   mouseMove(MouseEvent event);
        bool   mouseDrag(MouseEvent event);
        bool   mouseWheel(MouseEvent event);
        bool   keyUp(KeyEvent event);
        bool   keyDown(KeyEvent event);
        bool   resize(ResizeEvent event);
		
		void load(fs::path aPath);
        void load(std::string   aPath) {load(fs::path(aPath));}
		
		void draw(NSEvent *event=nil);	// draws with app time
		void drawAtTime(double t, NSEvent *event=nil);	// draw at a specific moment
		
		bool setValueForKey(id aValue, string aKey);
        bool setValueForKey(int aValue, string aKey);
        bool setValueForKey(float aValue, string aKey);
        bool setValueForKey(string aValue, string aKey);
        bool setValueForKey(const ColorAf &aValue, string aKey);
        bool setValueForKey(const gl::Texture &aValue, string aKey);
        
		id getValueForInputKey(string aKey);
		id getValueForOutputKey(string aKey);
		
		NSArray* getInputKeys();
		NSArray* getOutputKeys();
        
        QCComposition*                              mQCComposition;
		QCRenderer*                                 mQCRenderer;
        
        Vec2f                                       mMousePos;
        float                                       mCiWidth, mCiHeight, mQCWidth, mQCHeight;
        float                                       mTime;
        NSEvent*                                    mEvent;

	protected:
        std::shared_ptr<class QuartzComposition>    mQuartzComposition;
        fs::path                                    mPath;
        
        
        app::App                                    *mApp;
        ci::CallbackId                              mCbMouseDown, mCbMouseDrag, mCbMouseUp, mCbMouseMove, mCbMouseWheel, mCbKeyUp, mCbKeyDown, mCbResize;
		bool                                        mHasRegisteredEvents;
		
	};
    
}}
