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
        
        
        gl::Texture        applyFx(const gl::Texture &aTex);
        //gl::Fbo            mFbo;
    };
    
    
    
    
}}