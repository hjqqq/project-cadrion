//
//  Basic3DView.h
//  projectCadrion
//
//  Created by Adrian Cayaco on 2/19/13.
//
//

#import "isgl3d.h"

@interface Basic3DView : Isgl3dBasic3DView {
    
@private
    // The multi-material cube
    Isgl3dMultiMaterialCube * _cube;
}

@end
