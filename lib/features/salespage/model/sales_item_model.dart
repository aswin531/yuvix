import 'package:hive/hive.dart';

part 'sales_item_model.g.dart';

@HiveType(typeId: 6)
class SalesItemModel extends HiveObject {
  @HiveField(0)
  final String productName;
  @HiveField(1)
  final int quantity;
  @HiveField(2)
  final double pricePerUnit;
  @HiveField(3)
  final double totalPrice;
  @HiveField(4)
  final String categoryName;

  SalesItemModel({
    required this.productName,
    required this.quantity,
    required this.pricePerUnit,
    required this.totalPrice,
    required this.categoryName,
  });
}
