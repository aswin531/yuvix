// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:uuid/uuid.dart';
// import 'package:yuvix/core/constants/color.dart';
// import 'package:yuvix/features/profile/controller/auth_services.dart';

// import '../../model/user_model.dart';

// class RegScreen extends StatefulWidget {
//   const RegScreen({Key? key}) : super(key: key);

//   @override
//   State<RegScreen> createState() => _RegScreenState();
// }

// class _RegScreenState extends State<RegScreen> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
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
//                 colors: [
//                   // Color(0xffB81736),
//                    ConstC.getColor(AppColor.background1),
//                   Color(0xff281537),
//                 ],
//               ),
//             ),
//             child:  Padding(
//               padding: EdgeInsets.only(top: 60.0, left: 22),
//               child: Text(
//                 'Create Your\nAccount',
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
//               child: Form(
//                 key: _formKey,
//                 child: CustomScrollView(
//                   slivers: [
//                     SliverFillRemaining(
//                       hasScrollBody: false,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 18.0, right: 18),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             TextFormField(
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Name value can\'t be empty';
//                                 }
//                                 return null;
//                               },
//                               autovalidateMode: AutovalidateMode.onUserInteraction,
//                               controller: _usernameController,
//                               decoration:  InputDecoration(
//                                 suffixIcon: Icon(
//                                   Icons.check,
//                                   color:  ConstC.getColor(AppColor.text),
//                                 ),
//                                 labelText: 'Username',
//                                 labelStyle: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color:  ConstC.getColor(AppColor.background1),
//                                 ),
//                               ),
//                             ),
//                             TextFormField(
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Phone number can\'t be empty';
//                                 }
//                                 return null;
//                               },
//                               autovalidateMode: AutovalidateMode.onUserInteraction,
//                               controller: _phoneController,
//                               keyboardType: TextInputType.number, 
//                               decoration: InputDecoration(
//                                 suffixIcon: Icon(
//                                   Icons.check,
//                                   color: ConstC.getColor(AppColor.text),
//                                 ),
//                                 labelText: 'Phone',
//                                 labelStyle: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color:  ConstC.getColor(AppColor.background1),
//                                 ),
//                               ),
//                             ),
//                             TextFormField(
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Password can\'t be empty';
//                                 }
//                                 return null;
//                               },
//                               autovalidateMode: AutovalidateMode.onUserInteraction,
//                               controller: _passwordController,
//                               obscureText: _obscurePassword,
//                               decoration: InputDecoration(
//                                 suffixIcon: IconButton(
//                                   icon: Icon(
//                                     _obscurePassword ? Icons.visibility_off : Icons.visibility,
//                                     color:  ConstC.getColor(AppColor.text),
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       _obscurePassword = !_obscurePassword;
//                                     });
//                                   },
//                                 ),
//                                 labelText: 'Password',
//                                 labelStyle:  TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color:  ConstC.getColor(AppColor.background1),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 70),
//                             GestureDetector(
//                               onTap: () async {
//                                 var uuid = const Uuid().v1();
//                                 if (_formKey.currentState!.validate()) {
                            
//                                   UserModel user = UserModel(
//                                     id: uuid,
//                                     name: _usernameController.text,
//                                     phone: _phoneController.text, 
//                                     password: _passwordController.text,
//                                     status: 1,
//                                   );
//                                   bool result = await authService.registerUser(user);
//                                   if (result) {
//                                     Navigator.pop(context);
//                                   }
//                                 }
//                               },
//                               child: Container(
//                                 height: 55,
//                                 width: 300,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(30),
//                                   gradient:  LinearGradient(
//                                     colors: [
//                                       // Color(0xffB81736),
//                                       ConstC.getColor(AppColor.background1),
//                                       Color(0xff281537),
//                                     ],
//                                   ),
//                                 ),
//                                 child:  Center(
//                                   child: Text(
//                                     'SIGN IN',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20,
//                                       color:  ConstC.getColor(AppColor.textC1),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 80),
//                              Align(
//                               alignment: Alignment.bottomRight,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     "Don't have an account?",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                        fontSize: 18,
//                                       color: ConstC.getColor(AppColor.text),
//                                     ),
//                                   ),
//                                   Text(
//                                     "Sign up",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 26,
//                                       color:  ConstC.getColor(AppColor.textC2),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:yuvix/features/profile/view/widgets/background.dart';
import 'package:yuvix/features/profile/view/widgets/register_form.dart';


class RegScreen extends StatelessWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          const RegistrationForm(),
        ],
      ),
    );
  }
}
