import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zembil_v0/common/widgets/bottom_bar.dart';
import 'package:zembil_v0/features/auth/screens/auth_screen.dart';
import 'package:zembil_v0/router.dart';

import 'features/shop/screens/shop_screen.dart';
import 'features/auth/services/auth_service.dart';
import 'providers/user_provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const ShopScreen()
          : const AuthScreen(),
    );
  }
}
