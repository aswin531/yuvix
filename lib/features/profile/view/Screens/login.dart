// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:yuvix/features/profile/controller/auth_services.dart';
// import '../../../../core/constants/color.dart';
// import 'register.dart'; 

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   bool _obscurePassword = true;

//   @override
//   Widget build(BuildContext context) {
//     final authService = Provider.of<AuthService>(context);
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             decoration:  BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [ ConstC.getColor(AppColor.background1), Color(0xff281537)],
//               ),
//             ),
//             child:  Padding(
//               padding: EdgeInsets.only(top: 60.0, left: 22),
//               child: Text(
//                 'Hello\nLogin!',
//                 style: TextStyle(
//                   fontSize: 30,
//                   color:  ConstC.getColor(AppColor.textC1),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 200.0),
//             child: Container(
//               decoration:  BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40),
//                   topRight: Radius.circular(40),
//                 ),
//                 color:  ConstC.getColor(AppColor.textC1),
//               ),
//               height: double.infinity,
//               width: double.infinity,
//               child: CustomScrollView(
//                 slivers: [
//                   SliverToBoxAdapter(
//                     child: Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 30),
//                           Form(
//                             key: _formKey,
//                             child: Column(
//                               children: [
//                                 TextFormField(
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Username cannot be empty';
//                                     }
//                                     return null;
//                                   },
//                                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                                   controller: _usernameController,
//                                   decoration: InputDecoration(
//                                     suffixIcon: Icon(Icons.check, color:  ConstC.getColor(AppColor.text)),
//                                     labelText: 'Username',
//                                     labelStyle: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color:  ConstC.getColor(AppColor.background1),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                                 TextFormField(
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Password cannot be empty';
//                                     }
//                                     return null;
//                                   },
//                                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                                   controller: _passwordController,
//                                   obscureText: _obscurePassword,
//                                   decoration: InputDecoration(
//                                     suffixIcon: IconButton(
//                                       icon: Icon(
//                                         _obscurePassword
//                                             ? Icons.visibility_off
//                                             : Icons.visibility,
//                                         color:  ConstC.getColor(AppColor.text),
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           _obscurePassword = !_obscurePassword;
//                                         });
//                                       },
//                                     ),
//                                     labelText: 'Password',
//                                     labelStyle:  TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color:  ConstC.getColor(AppColor.background1),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                                 GestureDetector(
//                                   onTap: () async {
//                                     if (_formKey.currentState!.validate()) {
//                                       final user = await authService.loginUser(
//                                         _usernameController.text,
//                                         _passwordController.text,
//                                       );
//                                       if (user != null) {
//                                         Navigator.pushNamedAndRemoveUntil(
//                                           context,
//                                             'BottomNav',
//                                           (route) => false,
//                                           arguments: user,
//                                         );
//                                       }
//                                     }
//                                   },
//                                   child: Container(
//                                     height: 55,
//                                     width: double.infinity,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(30),
//                                       gradient:  LinearGradient(
//                                         colors: [
//                                           // Color(0xffB81736),
//                                            ConstC.getColor(AppColor.background1),
//                                          Color(0xff281537)],
//                                       ),
//                                     ),
//                                     child: const Center(
//                                       child: Text(
//                                         'LOGIN',
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 20,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 70),
//                                 Align(
//                                   alignment: Alignment.centerRight,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       const Text(
//                                         "Don't have an account?",
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.grey,
//                                           fontSize: 18,
//                                         ),
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(builder: (context) => const RegScreen()),
//                                           );
//                                         },
//                                         child:  Text(
//                                           "Sign up",
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 26,
//                                             color:  ConstC.getColor(AppColor.textC2),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 const SizedBox(height: 30),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:yuvix/core/constants/color.dart';
import 'package:yuvix/features/profile/view/widgets/login_form.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(context),
          const LoginForm(),
        ],
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ConstC.getColor(AppColor.background1),
            const Color(0xff281537),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 22),
        child: Text(
          'Hello\nLogin!',
          style: TextStyle(
            fontSize: 30,
            color: ConstC.getColor(AppColor.textC1),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
