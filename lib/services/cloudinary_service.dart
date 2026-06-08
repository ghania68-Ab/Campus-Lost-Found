import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';

class CloudinaryService {
  final CloudinaryPublic cloudinary = CloudinaryPublic(
    'bottle',
    'campus_upload',
    cache: false,
  );

  Future<String?> uploadImage(File file) async {
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          file.path,
          folder: 'campus_lost_found',
        ),
      );

      print("UPLOAD SUCCESS");
      print(response.secureUrl);

      return response.secureUrl;
    } catch (e) {
      print("UPLOAD ERROR: $e");
      return null;
    }
  }
}