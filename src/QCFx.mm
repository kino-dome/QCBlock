//
//  QCFx.cpp
//  QCEventTest
//
//  Created by Hesam Ohadi on 3/10/13.
//
//

#include "QCFx.h"

namespace cinder { namespace QCBlock {
    
    
    gl::Texture QCFx::applyFx(const gl::Texture &aTex)
    {
        gl::Fbo  fbo=gl::Fbo(aTex.getWidth(),aTex.getHeight());
        setValueForKey(aTex, "inputImage_1");
        
        
        fbo.bindFramebuffer();
        gl::setMatricesWindowPersp(fbo.getWidth(), fbo.getHeight());
        gl::clear(Color::black());
        draw();
        fbo.unbindFramebuffer();
        gl::setMatricesWindowPersp(mApp->getWindowWidth(), mApp->getWindowHeight());
        
        
        return fbo.getTexture();
        
    }
    
    
}}