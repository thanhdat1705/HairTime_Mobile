import 'dart:io';

class UpdateProfileRequest {
  String phoneNumber;
  String email;
  File avatarFile;
  String displayName;
  String description;

  UpdateProfileRequest({
    this.phoneNumber,
    this.email,
    this.avatarFile,
    this.displayName,
    this.description,
  });
}
