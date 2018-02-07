%FISHEYEUNDISTORTPOINTS  Computes the ideal point coordinates from the observed point coordinates
%
%    dst = cv.fisheyeUndistortPoints(src, cameraMatrix, distCoeffs)
%    dst = cv.fisheyeUndistortPoints(..., 'OptionName', optionValue, ...)
%
% ## Input
% * __src__ Observed point coordinates, 1xNx2 or 1xNx2.
% * __cameraMatrix__ Input camera matrix A = [fx,0,cx;0,fy,cy;0,0,1].
% * __distCoeffs__ Input vector of distortion coefficients [k1,k2,p1,p2,k3,k4,k5,
%        k6] of 4, 5, or 8 elements. If the vector is empty, the zero distortion
%        coefficients are assumed.
%
% ## Output
% * __dst__ Output ideal point coordinates after undistortion and reverse
%        perspective transformation.
%
% ## Options
% * __R__ Rectification transformation in the object space (3x3 matrix). R1 or
%        R2 computed by cv.stereoRectify can be passed here. If the matrix is
%        empty, the identity transformation is used.
% * __P__ New camera matrix (3x3) or new projection matrix (3x4). P1 or P2
%        computed by cv.stereoRectify can be passed here. If the matrix is
%        empty, the identity new camera matrix is used.
%
% Undistorts 2D points using fisheye model
%
