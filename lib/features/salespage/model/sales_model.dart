import 'package:hive/hive.dart';

part 'sales_model.g.dart';

@HiveType(typeId: 5)
class SalesModel extends HiveObject {
  @HiveField(0)
  final String date;
  @HiveField(1)
  final String customerName;
  @HiveField(2)
  final String mobileNumber;
  @HiveField(3)
  final String productName;
  @HiveField(4)
  final int quantity;
  @HiveField(5)
  final double pricePerUnit;
  @HiveField(6)
  final double totalPrice;

  SalesModel({
    required this.date,
    required this.customerName,
    required this.mobileNumber,
    required this.productName,
    required this.quantity,
    required this.pricePerUnit,
    required this.totalPrice,
  });
}


