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
//    Isgl3dMultiMaterialCube * _cube;
    Isgl3dMeshNode *_torusNode;
    Isgl3dLight *_redLight;
    Isgl3dLight *_greenLight;
    Isgl3dLight *_blueLight;
    
	// Used to calculate the light positions
	float _lightAngle;
}

@end
