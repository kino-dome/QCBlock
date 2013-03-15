//
//  QCFx.h
//  QCEventTest
//
//  Created by Hesam Ohadi on 3/10/13.
//
//


#include "QuartzComposition.h"
#include "cinder/gl/Fbo.h"


using namespace ci;
using namespace ci::app;
using namespace std;

namespace cinder { namespace QCBlock{
    
    
    class QCFx: public QuartzComposition {
    public:
        
        // The input texture's target SHOULD be GL_TEXTURE_RECTANGLE_ARB for the CIImage conversion to take place correctly
        
        gl::Texture        applyFx(const gl::Texture &aTex);
        //gl::Fbo            mFbo;
    };
    
    
    
    
}}