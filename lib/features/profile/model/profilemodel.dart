import 'package:hive/hive.dart';

part 'profilemodel.g.dart';

@HiveType(typeId: 4)
class ProfileModel extends HiveObject {
  @HiveField(0)
  String imagePath;

  @HiveField(1)
  String name;

  @HiveField(2)
  String licenseNumber;

  @HiveField(3)
  String gstNumber;

  ProfileModel({
    required this.imagePath,
    required this.name,
    required this.licenseNumber,
    required this.gstNumber,
  });
}
