// const float PI = 3.1415926535897932384626433832795;
// const float PI180 = float(PI / 180.0);
// 
// float sind(float a)
// {
// 	return sin(a * PI180);
// }
// 
// float cosd(float a)
// {
// 	return cos(a * PI180);
// }
// 
// float added(vec2 sh, float sa, float ca, vec2 c, float d)
// {
// 	return 0.5 + 0.25 * cos((sh.x * sa + sh.y * ca + c.x) * d) + 0.25 * cos((sh.x * ca - sh.y * sa + c.y) * d);
// }
// 
// void mainImage( out vec4 fragColor, in vec2 fragCoord )
// {
// 	// Halftone dot matrix shader
// 	// @author Tomek Augustyn 2010
// 
// 	// Ported from my old PixelBender experiment
// 	// https://github.com/og2t/HiSlope/blob/master/src/hislope/pbk/fx/halftone/Halftone.pbk
// 
// 	// Hold and drag horizontally to adjust the threshold
// 
// 	float threshold = .7;
// 
// 	float ratio = 640.0 / 960.0;
// 	float coordX = fragCoord.x / iResolution.x;
// 	float coordY = fragCoord.y / iResolution.x;
// 	vec2 dstCoord = vec2(coordX, coordY);
// 	vec2 srcCoord = vec2(coordX, coordY / ratio);
// 	vec2 rotationCenter = vec2(0.5, 0.5);
// 	vec2 shift = dstCoord - rotationCenter;
// 
// 	float dotSize = 2.0;
// 	float angle = 45.0;
// 
// 	float rasterPattern = added(shift, sind(angle), cosd(angle), rotationCenter, PI / dotSize * 1000.0);
// 	vec4 srcPixel = texture(iChannel0, srcCoord);
// 
// 	float avg = 0.2125 * srcPixel.r + 0.7154 * srcPixel.g + 0.0721 * srcPixel.b;
// 	float gray = (rasterPattern * threshold + avg - threshold) / (1.0 - threshold);
// 	float r = srcPixel.r * rasterPattern;
// 	float g = srcPixel.g * rasterPattern;
// 	float b = srcPixel.b * rasterPattern;
// 	// uncomment to see how the raster pattern looks 
// 	// gray = rasterPattern;
// 
// 	fragColor = vec4(srcPixel * rasterPattern * 1.5);
// }
// 