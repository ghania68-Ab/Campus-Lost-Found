import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';

class CloudinaryService {
  final cloudinary = CloudinaryPublic(
    "dc0gzz57h", // ✅ your cloud name
    "campus_upload", // 🔥 your upload preset name
    cache: false,
  );

  Future<String?> uploadImage(File file) async {
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          file.path,
          folder: "campus_lost_found",
        ),
      );

      return response.secureUrl;
    } catch (e) {
      print("Cloudinary upload error: $e");
      return null;
    }
  }
}