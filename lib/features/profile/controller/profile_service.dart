
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../model/profile_model.dart';

class ProfileService with ChangeNotifier {
  ProfileModel _profile = ProfileModel(
    name: 'UVIX',
    licenseNumber: '123456',
    gstNumber: 'GST12345678',
    imagePath: 'assets/images/logo.png',
  );

  ProfileService() {
    _loadProfile();
  }

  ProfileModel get profile => _profile;

  void _loadProfile() async {
    var box = await Hive.openBox<ProfileModel>('profileBox');
    _profile = box.get('profile') ?? ProfileModel(
      name: 'UVIX',
      licenseNumber: '123456',
      gstNumber: 'GST12345678',
      imagePath: 'assets/images/logo.png',
    );
    notifyListeners();
  }

  void updateProfile(ProfileModel profile) {
    _profile = profile;
    Hive.box<ProfileModel>('profileBox').put('profile', profile);
    notifyListeners();
  }

  void setImagePath(String imagePath) {
    _profile.imagePath = imagePath;
    updateProfile(_profile);
  }

  void setName(String name) {
    _profile.name = name;
    updateProfile(_profile);
  }

  void setLicenseNumber(String licenseNumber) {
    _profile.licenseNumber = licenseNumber;
    updateProfile(_profile);
  }

  void setGstNumber(String gstNumber) {
    _profile.gstNumber = gstNumber;
    updateProfile(_profile);
  }
}

