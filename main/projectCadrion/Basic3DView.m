//
//  Basic3DView.m
//  projectCadrion
//
//  Created by Adrian Cayaco on 2/19/13.
//
//

#import "Basic3DView.h"
#define LIGHT_RADIUS 4

@implementation Basic3DView

- (id)init
{
    if ((self = [super init])) {
        // Translate the camera
        self.camera.position = iv3(2, 3, 10);
        
//        // Create an Isgl3dMultiMaterialCube with random colors.
//        _cube = [Isgl3dMultiMaterialCube cubeWithDimensionsAndRandomColors:3 height:3 depth:3 nSegmentWidth:2 nSegmentHeight:2 nSegmentDepth:2];
//        
//        // Add the cube to the scene.
//        [self.scene addChild:_cube];
        
        // Create a white color material (with grey ambient color)
        Isgl3dColorMaterial * colorMaterial = [Isgl3dColorMaterial materialWithHexColors:@"444444" diffuse:@"FFFFFF" specular:@"FFFFFF" shininess:0.7];
        
        // Create a torus primitive
        Isgl3dTorus * torus = [Isgl3dTorus meshWithGeometry:3.0 tubeRadius:1.0 ns:32 nt:20];
        
        // Create a mesh node in the scene using torus primitive and color material
        _torusNode = [self.scene createNodeWithMesh:torus andMaterial:colorMaterial];
        
        // Create red light (producing white specular light), with rendering, and add to scene
        _redLight = [Isgl3dLight lightWithHexColor:@"FF0000" diffuseColor:@"FF0000" specularColor:@"FFFFFF" attenuation:0.02];
        _redLight.renderLight = YES;
        [self.scene addChild:_redLight];
        
        // Create green light (producing white specular light), with rendering, and add to scene
        _greenLight = [Isgl3dLight lightWithHexColor:@"00FF00" diffuseColor:@"00FF00" specularColor:@"FFFFFF" attenuation:0.02];
        _greenLight.renderLight = YES;
        [self.scene addChild:_greenLight];
        
        // Create blue light (producing white specular light), with rendering, and add to scene
        _blueLight = [Isgl3dLight lightWithHexColor:@"0000FF" diffuseColor:@"0000FF" specularColor:@"FFFFFF" attenuation:0.02];
        _blueLight.renderLight = YES;
        [self.scene addChild:_blueLight];
        
        // Set the scene ambient color
        [self setSceneAmbient:@"444444"];
        
        // Schedule updates
        [self schedule:@selector(tick:)];
    }
    return self;
}

- (void) dealloc {
    [self.scene removeChild:_redLight];
    [self.scene removeChild:_blueLight];
    [self.scene removeChild:_greenLight];
    [_redLight release];
    [_blueLight release];
    [_greenLight release];
    [_torusNode release];
    [super dealloc];
}

- (void) tick:(float)dt {
    // Rotate the cube by 1 degree about its y-axis
    
//    _cube.rotationY += 1;
//    _cube.rotationX += 0.5;
    
    // Rotate the torus
    _torusNode.rotationX += 0.75;
    _torusNode.rotationY += 0.75;
    _torusNode.rotationZ += 0.75;
    
    // Move the lights
    _redLight.position = iv3(LIGHT_RADIUS * sin(_lightAngle * M_PI / 30), LIGHT_RADIUS * cos(_lightAngle * M_PI / 30), 0);
    _greenLight.position = iv3(LIGHT_RADIUS * -cos(_lightAngle * M_PI / 60), LIGHT_RADIUS * sin(_lightAngle * M_PI / 60), LIGHT_RADIUS * cos(_lightAngle * M_PI / 60));
//    _blueLight.position = iv3(LIGHT_RADIUS * sin(_lightAngle * M_PI / 45), LIGHT_RADIUS * cos(_lightAngle * M_PI / 45), LIGHT_RADIUS * sin(_lightAngle * M_PI / 45));
    
    // Update the light angle
    _lightAngle = _lightAngle + 0.5;
}

@end
