import 'package:hive/hive.dart';
import 'sales_item_model.dart';

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
  final double totalAmount;
  @HiveField(4)
  final List<SalesItemModel> salesList;

  SalesModel({
    required this.date,
    required this.customerName,
    required this.mobileNumber,
    required this.totalAmount,
    required this.salesList,
  });
}
