//
//  QuartzComposition.h
//  
//
//  Created by Hesam Ohadi on 3/5/13.
//
//

#include "QuartzComposition.h"



namespace cinder { namespace QCBlock{
    
    bool QuartzComposition::mouseMove(cinder::app::MouseEvent event)
    {
        mMousePos=event.getPos();
        //console()<<mMousePos<<endl;
        CGEventRef cgEvent;
        NSEvent *QCEvent;
        
        cgEvent = CGEventCreateMouseEvent(NULL, kCGEventMouseMoved, CGPointMake(event.getX(), mCiHeight-event.getY()), kCGMouseButtonLeft);
        QCEvent= [NSEvent eventWithCGEvent:cgEvent];
        drawAtTime(mTime,QCEvent);
        CFRelease(cgEvent);
        
        return false;
    }
    
    bool QuartzComposition::mouseDown(cinder::app::MouseEvent event)
    {
        mMousePos=event.getPos();
        console()<<mMousePos<<endl;
        CGEventRef cgEvent;
        NSEvent *QCEvent;
        if (event.isLeft()){
            cgEvent = CGEventCreateMouseEvent(NULL, kCGEventLeftMouseDown, CGPointMake(event.getX(), mCiHeight-event.getY()), kCGMouseButtonLeft);
        }
        else if (event.isRight()) {
            cgEvent = CGEventCreateMouseEvent(NULL, kCGEventRightMouseDown, CGPointMake(event.getX(), mCiHeight-event.getY()), kCGMouseButtonLeft);
        }

        
        QCEvent= [NSEvent eventWithCGEvent:cgEvent];
        drawAtTime(mTime,QCEvent);
        CFRelease(cgEvent);
        
        return false;
    }
    
    bool QuartzComposition::mouseUp(cinder::app::MouseEvent event)
    {
        mMousePos=event.getPos();
        CGEventRef cgEvent;
        NSEvent *QCEvent;
        if (event.isLeft()){
            cgEvent = CGEventCreateMouseEvent(NULL, kCGEventLeftMouseUp, CGPointMake(event.getX(), mCiHeight-event.getY()), kCGMouseButtonLeft);
        }
        else if (event.isRight()) {
            cgEvent = CGEventCreateMouseEvent(NULL, kCGEventRightMouseUp, CGPointMake(event.getX(), mCiHeight-event.getY()), kCGMouseButtonLeft);
        }
        
        
        QCEvent= [NSEvent eventWithCGEvent:cgEvent];
        drawAtTime(mTime,QCEvent);
        CFRelease(cgEvent);
        
        return false;
    }
    
    bool QuartzComposition::mouseDrag(cinder::app::MouseEvent event)
    {
        mMousePos=event.getPos();
        CGEventRef cgEvent;
        NSEvent *QCEvent;
        if (event.isLeft()){
            cgEvent = CGEventCreateMouseEvent(NULL, kCGEventLeftMouseDragged, CGPointMake(event.getX(), mCiHeight-event.getY()), kCGMouseButtonLeft);
        }
        else if (event.isRight()) {
            cgEvent = CGEventCreateMouseEvent(NULL, kCGEventRightMouseDragged, CGPointMake(event.getX(), mCiHeight-event.getY()), kCGMouseButtonLeft);
        }
        
        
        QCEvent= [NSEvent eventWithCGEvent:cgEvent];
        drawAtTime(mTime,QCEvent);
        CFRelease(cgEvent);
        
        return false;
    }
    
    bool QuartzComposition::mouseWheel(cinder::app::MouseEvent event)
    {
        CGEventRef cgEvent;
        NSEvent *QCEvent;
        
        cgEvent = CGEventCreateMouseEvent(NULL, kCGEventScrollWheel, CGPointMake(event.getX(), mCiHeight-event.getY()), kCGMouseButtonLeft);
        
        QCEvent= [NSEvent eventWithCGEvent:cgEvent];
        drawAtTime(mTime,QCEvent);
        CFRelease(cgEvent);
        
        return false;
    }
    
    bool QuartzComposition::keyDown(cinder::app::KeyEvent event)
    {
        CGEventRef cgEvent;
        NSEvent *QCEvent;
        
        cgEvent = CGEventCreateKeyboardEvent(NULL, (CGKeyCode)keyCodeForKeyString(event.getChar()), true);
        
        QCEvent= [NSEvent eventWithCGEvent:cgEvent];
        drawAtTime(mTime,QCEvent);
        CFRelease(cgEvent);
        
        return false;
    }
    
    bool QuartzComposition::keyUp(cinder::app::KeyEvent event)
    {
        CGEventRef cgEvent;
        NSEvent *QCEvent;
        
        cgEvent = CGEventCreateKeyboardEvent(NULL, (CGKeyCode)keyCodeForKeyString(event.getChar()), false);
        
        QCEvent= [NSEvent eventWithCGEvent:cgEvent];
        drawAtTime(mTime,QCEvent);
        CFRelease(cgEvent);
        
        return false;
    }
    
    bool QuartzComposition::resize(cinder::app::ResizeEvent event)
    {
        
            mCiWidth=event.getWidth();
            mCiHeight=event.getHeight();
            mQCWidth=2.0;
            mQCHeight= (mCiHeight/mCiWidth)*mQCWidth;
        
        
        return false;
    }
    
    QuartzComposition::QuartzComposition()
    {
        mQCComposition=nil;
        mQCRenderer=nil;
        mMousePos=Vec2f(0.0,0.0);
        mTime=0;
        mHasRegisteredEvents=false;
    }
    /*
    QuartzComposition::QuartzComposition(app::App *aApp) : mApp(aApp)
    {
        mQCComposition=nil;
        mQCRenderer=nil;
        mMousePos=Vec2f(0.0,0.0);
        
        mCbMouseDown= mApp->registerMouseDown(this, &QuartzComposition::mouseDown);
        mCbMouseDrag= mApp->registerMouseDrag(this, &QuartzComposition::mouseDrag);
        mCbMouseUp= mApp->registerMouseUp(this, &QuartzComposition::mouseUp);
        mCbMouseMove= mApp->registerMouseMove(this, &QuartzComposition::mouseMove);
        mCbMouseWheel= mApp->registerMouseWheel(this, &QuartzComposition::mouseWheel);
        mCbKeyUp= mApp->registerKeyUp(this, &QuartzComposition::keyUp);
        mCbKeyDown= mApp->registerKeyDown(this, &QuartzComposition::keyDown);
        mCbResize= mApp->registerResize(this, &QuartzComposition::resize);
        
        mCiWidth=mApp->getWindowWidth();
        mCiHeight=mApp->getWindowHeight();
        mQCWidth=2.0;
        mQCHeight= (mCiHeight/mCiWidth)*mQCWidth;
        mTime=0;
    }
    */
    QuartzComposition::~QuartzComposition()
    {
        [mQCComposition release];
        [mQCRenderer release];
        
        if(mHasRegisteredEvents){
            mApp->unregisterMouseDown(mCbMouseDown);
            mApp->unregisterMouseDrag(mCbMouseDrag);
            mApp->unregisterMouseUp(mCbMouseUp);
            mApp->unregisterMouseMove(mCbMouseMove);
            mApp->unregisterMouseWheel(mCbMouseWheel);
            mApp->unregisterKeyUp(mCbKeyUp);
            mApp->unregisterKeyDown(mCbKeyDown);
            mApp->unregisterResize(mCbResize);
        
            delete mApp;
            mApp= NULL;
        }
    
    if(mApp!=NULL){
        delete mApp;
        mApp= NULL;
    }
        
        
    }
    
    void QuartzComposition::registerEvents(app::App *aApp)
    {
        mApp=aApp;
        
        mCbMouseDown= mApp->registerMouseDown(this, &QuartzComposition::mouseDown);
        mCbMouseDrag= mApp->registerMouseDrag(this, &QuartzComposition::mouseDrag);
        mCbMouseUp= mApp->registerMouseUp(this, &QuartzComposition::mouseUp);
        mCbMouseMove= mApp->registerMouseMove(this, &QuartzComposition::mouseMove);
        mCbMouseWheel= mApp->registerMouseWheel(this, &QuartzComposition::mouseWheel);
        mCbKeyUp= mApp->registerKeyUp(this, &QuartzComposition::keyUp);
        mCbKeyDown= mApp->registerKeyDown(this, &QuartzComposition::keyDown);
        mCbResize= mApp->registerResize(this, &QuartzComposition::resize);
        
        mCiWidth=mApp->getWindowWidth();
        mCiHeight=mApp->getWindowHeight();
        mQCWidth=2.0;
        mQCHeight= (mCiHeight/mCiWidth)*mQCWidth;
        mTime=0;
        mHasRegisteredEvents=true;
    }
    
    
    void QuartzComposition::load(fs::path aPath) {
		[mQCComposition release];
        mPath=aPath;
		mQCComposition = [[QCComposition compositionWithFile:toNSString(mPath.string())] retain];
		[mQCRenderer release];
        
        App*        cinderApp=App::get();
        Renderer*   cinderRenderer= cinderApp->getRenderer();
        
        
		CGLContextObj cglContext			= cinderRenderer->getCglContext();
		CGLPixelFormatObj cglPixelFormat	= cinderRenderer->getCglPixelFormat();
		CGColorSpaceRef colorSpace			= CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
		mQCRenderer = [[QCRenderer alloc] initWithCGLContext:cglContext pixelFormat:cglPixelFormat colorSpace:colorSpace composition:mQCComposition];
		CGColorSpaceRelease(colorSpace);
	}
    
    void QuartzComposition::draw(NSEvent *event) {
		drawAtTime(getElapsedSeconds(), event);
        mTime=getElapsedSeconds();
	}
	
	void QuartzComposition::drawAtTime(double t, NSEvent *event) {
		if(mQCRenderer) {
            
            // mMousePos=Vec2f(Rand::randFloat()*200.0,Rand::randFloat()*200.0);
            
			NSPoint mousePos;
			mousePos.x = mMousePos.x/(float)getWindowWidth();
			mousePos.y = 1.0-(mMousePos.y/(float)getWindowHeight());

			NSMutableDictionary  *arguments = [NSMutableDictionary dictionaryWithObject:[NSValue valueWithPoint:mousePos] forKey:QCRendererMouseLocationKey];
            //mousePos = [NSEvent mousePos];
            
           // NSDictionary *arguments = [NSDictionary dictionaryWithObject:[NSValue // 5
                    //                                               valueWithPoint:mousePos]
                      //                                     forKey:QCRendererMouseLocationKey];
            if(event) {
                [arguments setObject:event forKey:QCRendererEventKey];
            }
			
            
			glMatrixMode(GL_MODELVIEW);
			glPushMatrix();
			glLoadIdentity();
			
			glMatrixMode(GL_PROJECTION);
			glPushMatrix();
			glLoadIdentity();
			
            
            //gl::setMatricesWindowPersp(getWindowWidth(), getWindowHeight());
            //gl::pushModelView();
            //gl::setMatricesWindowPersp(mCiWidth, mCiHeight);
			if(![mQCRenderer renderAtTime:t arguments:arguments]) NSLog(@"Rendering failed at time %.3fs", time);
            
           // gl::popModelView();
            //gl::setMatricesWindow(getWindowWidth(), getWindowHeight());
            
			glMatrixMode(GL_PROJECTION);
			glPopMatrix();
			
			glMatrixMode(GL_MODELVIEW);
			glPopMatrix();
            
		}
	}
    
    bool QuartzComposition::setValueForKey(id aValue, string aKey) {
		return [mQCRenderer setValue:aValue forInputKey:toNSString(aKey)];
	}
	
    bool QuartzComposition::setValueForKey(int aValue, string aKey) {
		return [mQCRenderer setValue:toNSNumber(aValue) forInputKey:toNSString(aKey)];
	}
    
    bool QuartzComposition::setValueForKey(float aValue, string aKey) {
		return [mQCRenderer setValue:toNSNumber(aValue) forInputKey:toNSString(aKey)];
	}
    
    bool QuartzComposition::setValueForKey(string aValue, string aKey) {
		return [mQCRenderer setValue:toNSString(aValue) forInputKey:toNSString(aKey)];
	}
    
    bool QuartzComposition::setValueForKey(const ColorAf &aValue, string aKey) {
		return [mQCRenderer setValue:toNSColor(aValue) forInputKey:toNSString(aKey)];
	}
    
    bool QuartzComposition::setValueForKey(const gl::Texture &aValue, string aKey) {
		return [mQCRenderer setValue:toCIImage(aValue) forInputKey:toNSString(aKey)];
	}
    
	id QuartzComposition::getValueForInputKey(string aKey) {
		return [mQCRenderer valueForInputKey:toNSString(aKey)];
	}
    
	id QuartzComposition::getValueForOutputKey(string aKey) {
		return [mQCRenderer valueForOutputKey:toNSString(aKey)];
	}
    
    
    
    //from Memo's Code
    
    NSArray* QuartzComposition::getInputKeys()
    {
        return [mQCRenderer inputKeys];
        
    }
    
    NSArray* QuartzComposition::getOutputKeys()
    {
        return [mQCRenderer outputKeys];
    }
    
   }}