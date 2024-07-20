
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:yuvix/features/profile/controller/profile_service.dart';
import 'dart:io';
import 'login.dart';
import 'privacy.dart';

class ProfilePage extends StatelessWidget {
  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  'Are you sure you want to logout?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ),
              child: const Text('Logout'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _editImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      print(pickedFile.path);
      Provider.of<ProfileService>(context, listen: false).setImagePath(pickedFile.path);
    }
  }

  Future<void> _editText(BuildContext context, String field) async {
    TextEditingController controller = TextEditingController();
    controller.text = field == 'Name'
        ? Provider.of<ProfileService>(context, listen: false).profile.name
        : field == 'License'
            ? Provider.of<ProfileService>(context, listen: false).profile.licenseNumber
            : Provider.of<ProfileService>(context, listen: false).profile.gstNumber;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $field'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: 'Enter new $field'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                if (field == 'Name') {
                  Provider.of<ProfileService>(context, listen: false).setName(controller.text);
                } else if (field == 'License') {
                  Provider.of<ProfileService>(context, listen: false).setLicenseNumber(controller.text);
                } else {
                  Provider.of<ProfileService>(context, listen: false).setGstNumber(controller.text);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Color(0xff03448c),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<ProfileService>(
          builder: (context, profileProvider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _editImage(context);
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: profileProvider.profile.imagePath.isNotEmpty
                            ? FileImage(File(profileProvider.profile.imagePath))
                            : AssetImage('Assets/images/logo.png') as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _editText(context, 'Name'),
                  child: Text(
                    profileProvider.profile.name,
                    style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold, color: Color(0xff03448c)),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => _editText(context, 'License'),
                      child: Column(
                        children: [
                          Text('License No:', style: TextStyle(fontSize: 16)),
                          Text(
                            profileProvider.profile.licenseNumber,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _editText(context, 'GST'),
                      child: Column(
                        children: [
                          Text('GST No:', style: TextStyle(fontSize: 16)),
                          Text(
                            profileProvider.profile.gstNumber,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Privacy()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff03448c),
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    child: Text('Privacy Policy'),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _showLogoutDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff03448c),
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    child: Text('Logout'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
