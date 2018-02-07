%FISHEYEPROJECTPOINTS  Projects 3D points to an image plane
%
%    imagePoints = cv.fisheyeProjectPoints(objectPoints, rvec, tvec, cameraMatrix, distCoeffs)
%    [imagePoints, jacobian] = cv.projectPoints(...)
%    [...] = cv.projectPoints(..., 'OptionName', optionValue, ...)
%
% ## Input
% * __objectPoints__ Array of object points, Nx1x3/1xNx3 array or cell array
%        of 3-element vectors, where N is the number of points in the view.
% * __rvec__ Rotation vector. See cv.Rodrigues for details.
% * __tvec__ Translation vector.
% * __cameraMatrix__ Camera matrix A = [fx,0,cx;0,fy,cy;0,0,1].
% * __distCoeffs__ Input vector of distortion coefficients [k1,k2,p1,p2,k3,
%        k4,k5,k6] of 4, 5, or 8 elements. If the vector is NULL/empty, the
%        zero distortion coefficients are assum
%
% ## Output
% * __imagePoints__ Output array of image points, Nx1x2/1xNx2 array or cell
%        array of 2-element vectors
% * __jacobian__ Optional output 2Nx15 jacobian matrix of derivatives of image points
%        with respect to components of the focal lengths, coordinates of the principal 
%        point, distortion coefficients, rotation vector, translation vector, and the skew.
%        In the old interface different components of the jacobian are returned via different
%        output parameters.
%
% ## Options
% * __Alpha__ The skew coefficient.
%
% The function computes projections of 3D points to the image plane given intrinsic
% and extrinsic camera parameters. Optionally, the function computes Jacobians - matrices of 
% partial derivatives of image points coordinates (as functions of all the input parameters) 
% with respect to the particular parameters, intrinsic and/or extrinsic.
%
