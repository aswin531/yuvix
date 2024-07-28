
import 'package:flutter/material.dart';
import 'package:yuvix/features/inventory/view/widgets/product/product_textfeild.dart';

class ConditionalFields extends StatelessWidget {
  final String? selectedType;
  final TextEditingController ramController;
  final TextEditingController processorController;
  final TextEditingController cameraController;
  final TextEditingController batteryController;
  final TextEditingController storageController;
  final TextEditingController displaySizeController;
  final TextEditingController networkConnectivityController;
  final TextEditingController featuresController;
  final TextEditingController compatibilityController;
  final TextEditingController materialController;

  const ConditionalFields({
    required this.selectedType,
    required this.ramController,
    required this.processorController,
    required this.cameraController,
    required this.batteryController,
    required this.storageController,
    required this.displaySizeController,
    required this.networkConnectivityController,
    required this.featuresController,
    required this.compatibilityController,
    required this.materialController,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedType == null) return SizedBox.shrink();

    List<Widget> getFields() {
      switch (selectedType) {
        case 'Mobiles':
        case 'Smartphone':
        case 'Tablet':
          return [
            ProductTextFieldWidget(
              type: true,
              controller: ramController,
              labelText: 'RAM (GB)',
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              type: false,
              controller: processorController,
              labelText: 'Processor',
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              controller: cameraController,
              labelText: 'Camera',
              type: false,
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              controller: batteryController,
              labelText: 'Battery(mAh)',
              type: false,
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              type: true,
              controller: storageController,
              labelText: 'Storage (GB)',
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              type: false,
              controller: displaySizeController,
              labelText: 'Display Size',
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              type: false,
              controller: networkConnectivityController,
              labelText: 'Network Connectivity',
            ),
          ];
        case 'Smartwatch':
          return [
            ProductTextFieldWidget(
              type: false,
              controller: displaySizeController,
              labelText: 'Display Size',
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              type: true,
              controller: batteryController,
              labelText: 'Battery Life(mAh)',
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              type: false,
              controller: compatibilityController,
              labelText: 'Compatibility',
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              type: false,
              controller: featuresController,
              labelText: 'Features',
            ),
          ];
        case 'Accessories':
          return [
            ProductTextFieldWidget(
              type: false,
              controller: compatibilityController,
              labelText: 'Compatibility',
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              type: false,
              controller: materialController,
              labelText: 'Material',
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              type: false,
              controller: featuresController,
              labelText: 'Features',
            ),
          ];
        default:
          return [
            ProductTextFieldWidget(
              type: true,
              controller: ramController,
              labelText: 'RAM (GB)',
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              type: false,
              controller: processorController,
              labelText: 'Processor',
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              controller: cameraController,
              labelText: 'Camera',
              type: false,
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              controller: batteryController,
              labelText: 'Battery(mAh)',
              type: false,
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              type: true,
              controller: storageController,
              labelText: 'Storage (GB)',
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              type: false,
              controller: displaySizeController,
              labelText: 'Display Size',
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              type: false,
              controller: networkConnectivityController,
              labelText: 'Network Connectivity',
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              type: false,
              controller: featuresController,
              labelText: 'Features',
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              type: false,
              controller: compatibilityController,
              labelText: 'Compatibility',
            ),
            SizedBox(height: 20),
            ProductTextFieldWidget(
              type: false,
              controller: materialController,
              labelText: 'Material',
            ),
          ];
      }
    }

    return Column(children: getFields());
  }
}

