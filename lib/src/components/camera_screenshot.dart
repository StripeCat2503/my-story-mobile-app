import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_story/main.dart';
import 'package:my_story/src/components/appbar.dart';
import 'package:my_story/src/components/image_preview.dart';
import 'package:my_story/src/components/overlay_loading.dart';
import 'package:my_story/src/controllers/components/camera_state_controller.dart';
import 'package:my_story/src/controllers/new_story/new_story_controller.dart';
import 'package:my_story/src/themes/color.dart';

class CameraScreenShot extends StatefulWidget {
  const CameraScreenShot({Key? key, this.onSaved}) : super(key: key);

  final Function(File image)? onSaved;

  @override
  _CameraScreenShotState createState() => _CameraScreenShotState();
}

class _CameraScreenShotState extends State<CameraScreenShot> {
  CameraController? _cameraController;

  File? _capturedImage;
  bool _captureLoading = false;
  double _cameraZoom = 1;
  double _maxZoomLevel = 1;
  double _minZoomLevel = 1;

  final _newStoryController = Get.find<NewStoryController>();

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

  Widget _buildToolBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: Get.width,
        color: Colors.black.withOpacity(0.7),
        height: 90,
        child: Stack(
          children: [
            if (_capturedImage == null)
              Positioned(
                bottom: 15,
                top: 15,
                left: 0,
                right: 0,
                child: _buildSnapButton(),
              ),
            if (_capturedImage == null)
              Positioned(
                bottom: 15,
                top: 15,
                right: 32,
                child: _buildSwapButton(),
              ),
            if (_capturedImage == null)
              Positioned(
                bottom: 15,
                top: 15,
                left: 32,
                child: _buildZoomSlider(),
              ),
            if (_capturedImage != null)
              Positioned(
                bottom: 15,
                top: 15,
                left: Get.width * 0.2,
                child: _buildSaveButton(),
              ),
            if (_capturedImage != null)
              Positioned(
                bottom: 15,
                top: 15,
                right: Get.width * 0.2,
                child: _buildCancelButton(),
              )
          ],
        ),
      ),
    );
  }

  Widget _buildCameraPreview() {
    return Container(
      height: Get.height,
      child: Stack(
        children: [
          Positioned(
            child: _capturedImage == null
                ? CameraPreview(
                    _cameraController!,
                  )
                : ImagePreview(
                    imageFile: _capturedImage,
                    flip: _cameraController?.description.lensDirection ==
                        CameraLensDirection.front,
                    key: UniqueKey(),
                  ),
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
          ),
          _buildToolBar(),
          if (_captureLoading) OverlayLoading(),
        ],
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

  Widget _buildZoomSlider() {
    return Container(
      width: Get.width * 0.3,
      child: Slider(
        value: _cameraZoom,
        onChanged: _onChangeCameraZoom,
        activeColor: Colors.white,
        min: _minZoomLevel,
        max: _maxZoomLevel,
        divisions: _maxZoomLevel.toInt(),
        inactiveColor: primaryLightColor.withOpacity(0.3),
        label: 'Zoom Level',
      ),
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

  Widget _buildSaveButton() {
    return RawMaterialButton(
      onPressed: _save,
      child: SvgPicture.asset(
        'lib/assets/icons/check.svg',
        width: 32,
        color: Colors.white,
      ),
      splashColor: primaryLightColor,
      shape: CircleBorder(),
    );
  }

  Widget _buildCancelButton() {
    return RawMaterialButton(
      onPressed: _cancel,
      child: SvgPicture.asset(
        'lib/assets/icons/cancel-outlined.svg',
        width: 32,
        color: Colors.white,
      ),
      splashColor: primaryLightColor,
      shape: CircleBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
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

  void _takePicture() async {
    try {
      setState(() {
        _captureLoading = true;
      });

      final image = await _cameraController?.takePicture();
      if (image != null) {
        setState(() {
          _capturedImage = File(image.path);
        });
      }
    } catch (error) {
      print('Error when take picture: $error');
    }

    setState(() {
      _captureLoading = false;
    });
  }

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

      _cameraController?.getMaxZoomLevel().then((value) {
        _maxZoomLevel = value;
      });

      _cameraController?.getMinZoomLevel().then((value) {
        _minZoomLevel = value;
      });

      setState(() {
        _cameraController?.setZoomLevel(_cameraZoom);
      });
    });
  }

  void _cancel() {
    setState(() {
      _capturedImage = null;
    });
  }

  void _save() {
    if (_capturedImage != null) {
      _newStoryController.addImageBlock(_capturedImage!.path);
      Get.back();
    }
  }

  void _onChangeCameraZoom(value) {
    setState(() {
      _cameraZoom = value;
      _cameraController?.setZoomLevel(_cameraZoom);
    });
  }
}
