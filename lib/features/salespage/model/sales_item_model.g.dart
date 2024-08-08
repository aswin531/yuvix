// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SalesItemModelAdapter extends TypeAdapter<SalesItemModel> {
  @override
  final int typeId = 6;

  @override
  SalesItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SalesItemModel(
      productName: fields[0] as String,
      quantity: fields[1] as int,
      pricePerUnit: fields[2] as double,
      totalPrice: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, SalesItemModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.productName)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.pricePerUnit)
      ..writeByte(3)
      ..write(obj.totalPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalesItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
