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
        NSArray* inputKeys=getInputKeys();
        console()<<([inputKeys count])<<endl;
        for ( int i=0; i<2; i++){
            console()<<fromNSString([inputKeys objectAtIndex:i])<<endl;
        }
        
        fbo.bindFramebuffer();
        gl::clear(Color::black());
        draw();
        fbo.unbindFramebuffer();
        return fbo.getTexture();
        
    }
    
    
}}