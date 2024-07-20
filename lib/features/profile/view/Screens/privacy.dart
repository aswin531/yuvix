import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,color: Colors.black
              ),
            ),
            SizedBox(height: 16),
            Text(
              '1. Introduction',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Welcome to our UVIX finance Management Application. We are committed to protecting your personal information and your right to privacy. If you have any questions or concerns about our policy, or our practices with regards to your personal information, please contact us at [Your Contact Information].',
            ),
            SizedBox(height: 16),
            Text(
              '2. Information We Collect',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We collect personal information that you voluntarily provide to us when you register on the app, express an interest in obtaining information about us or our products and services, when you participate in activities on the app (such as using our financial management tools) or otherwise contacting us.',
            ),
            SizedBox(height: 8),
            Text(
              'The personal information that we collect depends on the context of your interactions with us and the app, the choices you make, and the products and features you use. The personal information we collect may include the following:',
            ),
            SizedBox(height: 8),
            Text(
              '- Personal Information: Name, email address, phone number, and other similar information.',
            ),
            Text(
              '- Financial Information: Data related to your financial transactions, income, expenses, and other financial details.',
            ),
            Text(
              '- Usage Data: Information about your use of our app, such as IP address, browser type, and usage patterns.',
            ),
            SizedBox(height: 16),
            Text(
              '3. How We Use Your Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,color: Colors.black
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We use the information we collect in the following ways:',
            ),
            SizedBox(height: 8),
            Text(
              '- To provide, operate, and maintain our app.',
            ),
            Text(
              '- To improve, personalize, and expand our app.',
            ),
            Text(
              '- To understand and analyze how you use our app.',
            ),
            Text(
              '- To develop new products, services, features.',
            ),
          ],
        ),
      ),
    );
  }
}

