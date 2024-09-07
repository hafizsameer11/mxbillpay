/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

/*=================================================================== Image Pick Using camera ===================================================*/

import '../../export.dart';

Future<PickedFile?> imageFromCamera() async {
  var pickedFile = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 100);
  if (pickedFile == null) {
    showInSnackBar(message: strNoImageClicked);
  } else {
    return PickedFile(pickedFile.path);
    //  return cropImage(pickedFile.path);
  }
  return null;
}

/*=================================================================== Image Pick Using Gallery ===================================================*/

Future<PickedFile?> imageFromGallery() async {
  var pickedFile = await ImagePicker()
      .pickImage(source: ImageSource.gallery, imageQuality: 100);
  if (pickedFile == null) {
    showInSnackBar(message: strNoImageSelected);
  } else {
    return PickedFile(pickedFile.path);
    //return cropImage(pickedFile.path);
  }
  return null;
}

Future<PickedFile?> cropImage(filePath) async {
  var croppedImage = await ImageCropper().cropImage(
    sourcePath: filePath,
    aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    aspectRatioPresets: [CropAspectRatioPreset.original],
  );
  if (croppedImage == null) {
    showInSnackBar(message: strNoImage);
  } else {
    return PickedFile(croppedImage.path);
  }
  return null;
}
