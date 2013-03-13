#include "cinder/app/AppBasic.h"
#include "cinder/gl/gl.h"
#include "QCBlock.h"
#include "Resources.h"
#include "cinder/Camera.h"


using namespace ci;
using namespace ci::app;
using namespace std;

class OpenCLTestApp : public AppBasic {
  public:
	void setup();

    void keyDown (KeyEvent event);
	void update();
	void draw();
    
    QCBlock::QuartzComposition   mQCComp;
    int counter;
};

void OpenCLTestApp::setup()
{
    mQCComp.registerEvents(this);
    mQCComp.load(fs::path(getResourcePath(MYQTZ)));
    counter=0;
}

void OpenCLTestApp::keyDown(KeyEvent event)
{
    counter++;
    counter=counter%3;
    mQCComp.setValueForKey(counter, "Blending");
}

void OpenCLTestApp::update()
{
}

void OpenCLTestApp::draw()
{
	// clear out the window with black
	gl::clear( Color( 0, 0, 0 ) );

    /*
    CameraPersp cam( getWindowWidth(), getWindowHeight(), 60.0,5.0,5000.0 );
    
    glMatrixMode( GL_MODELVIEW );
	glLoadMatrixf( cam.getModelViewMatrix().m );
    console()<<cam.getModelViewMatrix()<<endl;
    glLoadIdentity();
    console()<<gl::getModelView()<<endl;
    
	glMatrixMode( GL_PROJECTION );
	glLoadMatrixf( cam.getProjectionMatrix().m );
    console()<<cam.getProjectionMatrix()<<endl;
    glLoadIdentity();
    console()<<gl::getProjection()<<endl;
    */

    //gl::pushMatrices();
   // gl::setMatricesWindowPersp(getWindowWidth(), getWindowHeight());
    mQCComp.draw();
    //gl::popMatrices();
}


CINDER_APP_BASIC( OpenCLTestApp, RendererGl )
