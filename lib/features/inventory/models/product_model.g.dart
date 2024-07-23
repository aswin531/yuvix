// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 3;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      productId: fields[0] as int,
      productName: fields[1] as String,
      category: fields[2] as String,
      brand: fields[3] as String,
      image: fields[4] as String?,
      color: fields[5] as String?,
      ram: fields[6] as String?,
      processor: fields[7] as String?,
      camera: fields[8] as String?,
      battery: fields[9] as String?,
      storage: fields[10] as String?,
      displaySize: fields[11] as String?,
      networkConnectivity: fields[12] as String?,
      compatibility: fields[13] as String?,
      material: fields[14] as String?,
      features: fields[15] as String?,
      quantity: fields[16] as int,
      price: fields[17] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.brand)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.color)
      ..writeByte(6)
      ..write(obj.ram)
      ..writeByte(7)
      ..write(obj.processor)
      ..writeByte(8)
      ..write(obj.camera)
      ..writeByte(9)
      ..write(obj.battery)
      ..writeByte(10)
      ..write(obj.storage)
      ..writeByte(11)
      ..write(obj.displaySize)
      ..writeByte(12)
      ..write(obj.networkConnectivity)
      ..writeByte(13)
      ..write(obj.compatibility)
      ..writeByte(14)
      ..write(obj.material)
      ..writeByte(15)
      ..write(obj.features)
      ..writeByte(16)
      ..write(obj.quantity)
      ..writeByte(17)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
