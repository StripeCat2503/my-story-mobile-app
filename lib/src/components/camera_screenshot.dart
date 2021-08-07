import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_story/main.dart';
import 'package:my_story/src/components/appbar.dart';
import 'package:my_story/src/themes/color.dart';

class CameraScreenShot extends StatefulWidget {
  const CameraScreenShot({Key? key}) : super(key: key);

  @override
  _CameraScreenShotState createState() => _CameraScreenShotState();
}

class _CameraScreenShotState extends State<CameraScreenShot> {
  CameraController? _cameraController;

  @override
  void initState() {
    super.initState();
    _initializeCamera(cameras!.first);
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController?.dispose();
  }

  Widget _buildCameraLoading() {
    return Container(
      width: Get.width,
      color: yellowPaperColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.25,
          ),
          SvgPicture.asset('lib/assets/icons/camera-loading.svg'),
          Container(
            margin: EdgeInsets.only(
              top: 15,
            ),
            child: LinearProgressIndicator(
              color: Colors.black,
            ),
            width: Get.width * 0.45,
          ),
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
    return Container(
      height: Get.height,
      child: CameraPreview(
        _cameraController!,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: Get.width,
                color: Colors.black.withOpacity(0.7),
                height: 90,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 15,
                      top: 15,
                      left: 0,
                      right: 0,
                      child: _buildSnapButton(),
                    ),
                    Positioned(
                      bottom: 15,
                      top: 15,
                      right: 32,
                      child: _buildSwapButton(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSnapButton() {
    return RawMaterialButton(
      onPressed: _takePicture,
      fillColor: Colors.white,
      padding: EdgeInsets.all(32),
      shape: CircleBorder(),
      elevation: 10,
      splashColor: primaryLightColor,
    );
  }

  Widget _buildSwapButton() {
    return RawMaterialButton(
      onPressed: _swapCamera,
      child: SvgPicture.asset(
        'lib/assets/icons/swap.svg',
        width: 32,
      ),
      splashColor: primaryLightColor,
      shape: CircleBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraController!.value.isInitialized) {
      return _buildCameraLoading();
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: yellowPaperColor,
        body: Stack(
          children: [
            !_cameraController!.value.isInitialized
                ? _buildCameraLoading()
                : _buildCameraPreview(),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: getPrimaryAppBar(
                bgColor: !_cameraController!.value.isInitialized
                    ? yellowPaperColor
                    : Colors.transparent,
                backActionColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _takePicture() {}

  void _swapCamera() {
    if (_cameraController?.description.lensDirection ==
        CameraLensDirection.front) {
      _initializeCamera(cameras!.first);
    } else if (_cameraController?.description.lensDirection ==
        CameraLensDirection.back) {
      _initializeCamera(cameras!.last);
    }
  }

  void _initializeCamera(CameraDescription cameraDescription) {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.max);
    _cameraController?.initialize().then((_) {
      if (!mounted) {
        return;
      }

      setState(() {});
    });
  }
}
