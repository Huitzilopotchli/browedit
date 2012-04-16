attribute vec4 a_position;
attribute vec2 a_texCoord;
attribute vec2 a_texCoord2;
attribute vec3 a_normal;
attribute vec3 a_color;

uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;
uniform mat3 normalMatrix;

varying vec2 texCoord;

varying vec3 normal;
varying vec3 eyeVec;
varying vec3 lightDir;

void main()
{
    vec3 lightPosition = vec3(0.0, 0.0, 0.0);
    
    vec4 transformed = modelMatrix * viewMatrix * a_position;


    normal = normalMatrix * a_normal;
    lightDir = lightPosition-vec3(transformed);
    eyeVec = -vec3(transformed);

    texCoord = a_texCoord;  
    gl_Position = projectionMatrix * modelMatrix * viewMatrix * a_position;
}