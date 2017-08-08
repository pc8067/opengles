//
//  multiple_sample.hpp
//  Opengles3D
//
//  Created by 勒俊 on 2017/7/27.
//  Copyright © 2017年 XunLei. All rights reserved.
//

#ifndef multiple_sample_hpp
#define multiple_sample_hpp

#include "new_opengles_base.hpp"

class MULTIPLE_SAMPLE:public NEW_OPENGLES_BASE
{
public:
    
    void setTexture(unsigned char *buffer, int width, int height, GLenum format);
    
    void Init();
    
    void renderBW(GLuint inputTexture, GLuint &rsTexture);
    
    void renderMS(GLuint inputTexture, GLuint &rsTexture);
    
    void renderRed(GLuint inputTexture, GLuint &rsTexture);
    
    void render();
    
    void setupFrameBuffer2();
    
    ~MULTIPLE_SAMPLE();
    
public:
    
    GLuint textureId1;
    int textureWidth = 0;
    int textureHeight = 0;
    
    GLuint textureId2;
    GLuint textureId3;
    
    GLuint program2;
    GLuint program3;
    
    const char* fShader2;
    const char *fShader3;
    
    GLuint framebuffer1;
    GLuint framebuffer2;
    
    unsigned char *buffer1;
    unsigned char *buffer2;
    unsigned char *buffer3;
    
    unsigned char *outBuffer;
    
    
    int count = 0;
};


#endif /* multiple_sample_hpp */
