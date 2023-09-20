// import 'package:animated_text_kit/animated_text_kit.dart';

// import '../../search/screens/search_screen.dart';
// import '../services/auth_service.dart';
// import '/common/widgets/custom_button.dart';
// import '/common/widgets/custom_textfield.dart';
// import '/constants/global_variables.dart';
// import 'package:flutter/material.dart';

// enum Auth {
//   signin,
//   signup,
// }

// class AuthScreen extends StatefulWidget {
//   static const String routeName = '/auth-screen';
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   Auth _auth = Auth.signup;
//   final _signUpFormKey = GlobalKey<FormState>();
//   final _signInFormKey = GlobalKey<FormState>();
//   final AuthService authService = AuthService();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _nameController = TextEditingController();
//   bool _isLogin = true;

//   @override
//   void dispose() {
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _nameController.dispose();
//   }

//   void signUpUser() {
//     authService.signUpUser(
//       context: context,
//       email: _emailController.text,
//       password: _passwordController.text,
//       name: _nameController.text,
//     );
//   }

//   void signInUser() {
//     authService.signInUser(
//       context: context,
//       email: _emailController.text,
//       password: _passwordController.text,
//     );
//   }

//   void navigateToSearchScreen(String query) {
//     Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(50),
//         child: AppBar(
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: GlobalVariables.appBarGradient,
//             ),
//           ),
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               DefaultTextStyle(
//                 style: const TextStyle(
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 child: AnimatedTextKit(
//                   repeatForever: true,
//                   animatedTexts: [
//                     FadeAnimatedText('ሰላም!'),
//                     FadeAnimatedText('Hello!'),
//                     FadeAnimatedText('Akkam'),
//                     FadeAnimatedText('مرحبًا'),
//                   ],
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.topLeft,
//                 child: Image.asset(
//                   'assets/images/logo.png',
//                   width: 120,
//                   height: 45,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 10),
//                 ListTile(
//                   tileColor: _auth == Auth.signup
//                       ? GlobalVariables.backgroundColor
//                       : GlobalVariables.greyBackgroundCOlor,
//                   title: const Text(
//                     'Create Account',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   leading: Radio(
//                     activeColor: GlobalVariables.secondaryColor,
//                     value: Auth.signup,
//                     groupValue: _auth,
//                     onChanged: (Auth? val) {
//                       setState(() {
//                         _auth = val!;
//                       });
//                     },
//                   ),
//                 ),
//                 if (_auth == Auth.signup)
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     color: GlobalVariables.backgroundColor,
//                     child: Form(
//                       key: _signUpFormKey,
//                       child: Column(
//                         children: [
//                           CustomTextField(
//                             controller: _nameController,
//                             hintText: 'Name',
//                           ),
//                           const SizedBox(height: 10),
//                           CustomTextField(
//                             controller: _emailController,
//                             hintText: 'Email',
//                           ),
//                           const SizedBox(height: 10),
//                           CustomTextField(
//                             controller: _passwordController,
//                             hintText: 'Password',
//                           ),
//                           const SizedBox(height: 10),
//                           CustomButton(
//                             text: 'Sign Up',
//                             color: const Color(0xFF5E60A9),
//                             onTap: () {
//                               if (_signUpFormKey.currentState!.validate()) {
//                                 signUpUser();
//                               }
//                             },
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ListTile(
//                   tileColor: _auth == Auth.signin
//                       ? GlobalVariables.backgroundColor
//                       : GlobalVariables.greyBackgroundCOlor,
//                   title: const Text(
//                     'Sign-In.',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   leading: Radio(
//                     activeColor: GlobalVariables.secondaryColor,
//                     value: Auth.signin,
//                     groupValue: _auth,
//                     onChanged: (Auth? val) {
//                       setState(() {
//                         _auth = val!;
//                       });
//                     },
//                   ),
//                 ),
//                 if (_auth == Auth.signin)
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     color: GlobalVariables.backgroundColor,
//                     child: Form(
//                       key: _signInFormKey,
//                       child: Column(
//                         children: [
//                           CustomTextField(
//                             controller: _emailController,
//                             hintText: 'Email',
//                           ),
//                           const SizedBox(height: 10),
//                           CustomTextField(
//                             controller: _passwordController,
//                             hintText: 'Password',
//                           ),
//                           const SizedBox(height: 10),
//                           CustomButton(
//                             text: 'Sign In',
//                             color: const Color(0xFF5E60A9),
//                             onTap: () {
//                               if (_signInFormKey.currentState!.validate()) {
//                                 signInUser();
//                               }
//                             },
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               setState(() {
//                                 _isLogin = !_isLogin;
//                               });
//                             },
//                             child: Text(_isLogin
//                                 ? 'Create New Account'
//                                 : 'I already have an account'),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../search/screens/search_screen.dart';
import '../services/auth_service.dart';
import '/common/widgets/custom_button.dart';
import '/common/widgets/custom_textfield.dart';
import '/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isLogin = true;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FadeAnimatedText('ሰላም!'),
                    FadeAnimatedText('Hello!'),
                    FadeAnimatedText('Akkam'),
                    FadeAnimatedText('مرحبًا'),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                if (_auth == Auth.signup)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          if (!_isLogin)
                            CustomTextField(
                              controller: _nameController,
                              hintText: 'Name',
                            ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Email',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _passwordController,
                            hintText: 'Password',
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_isLogin) {
                          // if (_signInFormKey.currentState!.validate()){
                          signInUser();
                        }
                        // }
                        else {
                          // if (_signUpFormKey.currentState!.validate()){
                          signUpUser();
                        }
                        // }
                      },
                      child: Text(_isLogin ? 'Login' : 'Signup'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(_isLogin
                          ? 'Create New Account'
                          : 'I already have an account'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
