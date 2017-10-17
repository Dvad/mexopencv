/**
 * @file getOptimalNewCameraMatrix.cpp
 * @brief mex interface for getOptimalNewCameraMatrix
 * @author Kota Yamaguchi
 * @date 2011
 */
#include "mexopencv.hpp"
using namespace std;
using namespace cv;

/**
 * Main entry called from Matlab
 * @param nlhs number of left-hand-side arguments
 * @param plhs pointers to mxArrays in the left-hand-side
 * @param nrhs number of right-hand-side arguments
 * @param prhs pointers to mxArrays in the right-hand-side
 */
void mexFunction( int nlhs, mxArray *plhs[],
                  int nrhs, const mxArray *prhs[] )
{
    // Check the number of arguments
    if (nrhs<3 || ((nrhs%2)!=1) || nlhs>2)
        mexErrMsgIdAndTxt("mexopencv:error","Wrong number of arguments");
    
    // Argument vector
    vector<MxArray> rhs(prhs,prhs+nrhs);
    Mat cameraMatrix(rhs[0].toMat(CV_32F));
    Mat distCoeffs(rhs[1].toMat(CV_32F));
    Size imageSize(rhs[2].toSize());
    double balance = 0.0;
    Size newImageSize;
    double fov_scale = 1.0;
    for (int i=3; i<nrhs; i+=2) {
        string key = rhs[i].toString();
        if (key=="Balance")
            balance = rhs[i+1].toDouble();
        else if (key=="NewImageSize")
            newImageSize = rhs[i+1].toSize();
        else if (key=="FovScale")
            fov_scale = rhs[i+1].toDouble();
        else
            mexErrMsgIdAndTxt("mexopencv:error","Unrecognized option");
    }
    // Process
    Mat m;
    fisheye::estimateNewCameraMatrixForUndistortRectify(
        cameraMatrix, distCoeffs, imageSize,
        cv::Mat(),m, balance, newImageSize, fov_scale);
    plhs[0] = MxArray(m);
}
