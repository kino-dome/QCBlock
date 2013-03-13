#include "cinder/app/AppBasic.h"
#include "cinder/gl/gl.h"
#include "Resources.h"

#include "QCBlock.h"

using namespace ci;
using namespace ci::app;
using namespace std;

class QCEventTestApp : public AppBasic {
  public:
	void setup();
	void mouseDown( MouseEvent event );	
	void update();
	void draw();
    
    QCBlock::QuartzComposition      mQCComp;
};

void QCEventTestApp::setup()
{
    Rand::randomize();
    
    mQCComp.registerEvents(this);
    mQCComp.load(getResourcePath(MYQTZ));
}

void QCEventTestApp::mouseDown( MouseEvent event )
{
}

void QCEventTestApp::update()
{
}

void QCEventTestApp::draw()
{
	// clear out the window with black
	gl::clear( Color( 0, 0, 0 ) );
    mQCComp.draw();
}


CINDER_APP_BASIC( QCEventTestApp, RendererGl )
