

import 'package:image_picker/image_picker.dart';
import 'package:teslo_shop/features/shared/infrastructure/services/camera_gallery_service.dart';

class CameraGalleryServiceImpl extends CameraGalleryService{

  final ImagePicker _picker = ImagePicker();

  @override
  Future<String?> selectPhoto() {
    // TODO: implement selectPhoto
    throw UnimplementedError();
  }

  @override
  Future<String?> takePhoto() async{
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      preferredCameraDevice: CameraDevice.rear
    );

    if ( photo == null ) return null;

    print('Tenemos una imagen ${ photo.path}');
    return photo.path;
  }
}