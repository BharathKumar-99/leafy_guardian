import 'dart:io';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:leafy_guardian/provider/plant_provider.dart';

import '../../constants/image_constants.dart';

class DetectionUi extends StatefulWidget {
  final PlantProvider provider;
  const DetectionUi({super.key, required this.provider});

  @override
  State<DetectionUi> createState() => _DetectionUiState();
}

class _DetectionUiState extends State<DetectionUi> {
  late List<CameraDescription> _cameras;
  CameraController? controller;
  bool isCameraLoading = false;
  @override
  void initState() {
    getCamera();
    super.initState();
  }

  getCamera() async {
    _cameras = await availableCameras();
    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            showAboutDialog(
                context: context,
                applicationName: 'Leafy Guardian',
                applicationVersion: '1.0.0',
                applicationIcon: Image.asset(ImageConstants.logo));
            break;
          default:
            showAboutDialog(
                context: context,
                applicationName: 'Leafy Guardian',
                applicationVersion: '1.0.0',
                applicationIcon: Image.asset(ImageConstants.logo));
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!(controller?.value.isInitialized ?? true)) {
      return Container();
    }

    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: controller != null
                ? ClipRRect(child: CameraPreview(controller!))
                : Container(),
          ),
        ),
        Positioned(
          bottom: 10,
          left: MediaQuery.of(context).size.width / 2 - 40,
          child: GestureDetector(
            onTap: () async {
              setState(() {
                isCameraLoading = true;
              });
              try {
                final image = await controller!.takePicture();
                widget.provider.detectPlant(File(image.path));
              } catch (e) {
                debugPrint(e.toString());
              }
            },
            child: const CircleAvatar(
              radius: 40,
              child: Icon(
                Icons.camera,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
        ),
        isCameraLoading
            ? BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [CircularProgressIndicator(), Text('Computing')],
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
