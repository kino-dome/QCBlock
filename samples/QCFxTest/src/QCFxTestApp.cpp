#include "cinder/app/AppBasic.h"
#include "cinder/gl/gl.h"
#include "cinder/params/Params.h"
#include "cinder/Capture.h"
#include "cinder/Surface.h"
#include "cinder/gl/Texture.h"

#include "Resources.h"
#include "QCBlock.h"

using namespace ci;
using namespace ci::app;
using namespace std;

class QCFxTestApp : public AppBasic {
  public:
	void setup();
	void mouseDown( MouseEvent event );	
	void update();
	void draw();
    
    params::InterfaceGl     mParams;
    float                   mBlurAmount;
    
    Capture                 mCapture;
    Surface                 mCaptureSurf;
    gl::Texture             mCaptureTex;
    gl::Texture::Format     mTexFormat;
    
    QCBlock::QCFx           mQCFx;
};

void QCFxTestApp::setup()
{
    mBlurAmount=0.0;
    mParams = params::InterfaceGl("parameters", Vec2i(100,100));
    mParams.addParam("Blur Amount", &mBlurAmount, "min=0.0 max=5.0 step=0.05");
    
    mQCFx.registerEvents(this);
    mQCFx.load(getResourcePath(VADEBLUR));
    
    mCapture=Capture(640,480);
    mCapture.start();
    // The input texture's target SHOULD be GL_TEXTURE_RECTANGLE_ARB for the CIImage conversion to take place correctly
    mTexFormat.setTarget(GL_TEXTURE_RECTANGLE_ARB);
}

void QCFxTestApp::mouseDown( MouseEvent event )
{
}

void QCFxTestApp::update()
{
    if(mCapture.checkNewFrame() && mCapture.isCapturing()){
        mCaptureSurf=mCapture.getSurface();
        mCaptureTex=gl::Texture(mCaptureSurf, mTexFormat);
        mCaptureTex=mQCFx.applyFx(mCaptureTex);
        mQCFx.setValueForKey(mBlurAmount, "Amount");
    }
}

void QCFxTestApp::draw()
{
	// clear out the window with black
	gl::clear( Color( 0, 0, 0 ) );
    if(mCaptureTex)    gl::draw(mCaptureTex,getWindowBounds());
    console()<<getAverageFps()<<endl;
    //mQCFx.draw();
    mParams.draw();
    
    
}


CINDER_APP_BASIC( QCFxTestApp, RendererGl )
