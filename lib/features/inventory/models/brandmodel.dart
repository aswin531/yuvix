import 'package:hive/hive.dart';

part 'brandmodel.g.dart';

@HiveType(typeId: 2)
class BrandModel {
  @HiveField(0)
  int? brandId;

  @HiveField(1)
  String? brandName;

  @HiveField(2)
  String? brandImage;

  @HiveField(3)
  int? productCount;

  BrandModel({
    required this.brandId,
    required this.brandName,
    required this.brandImage,
    required this.productCount,
  });
}
