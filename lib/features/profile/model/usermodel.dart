import 'package:hive_flutter/adapters.dart';

part 'usermodel.g.dart';
@HiveType(typeId: 0)
class UserModel extends HiveObject{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String phone;
  @HiveField(2)
  late String password;
  @HiveField(3)
  late int status;
  @HiveField(4)
  late String id;


  UserModel({required this.name,required this.phone,required this.password,required this.status,required this.id});
}
