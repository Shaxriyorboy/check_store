import 'package:check_store/common/router/route_name.dart';
import 'package:check_store/feature/screens/sign_up_page/view_model/sign_up_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpNotifier = ChangeNotifierProvider((ref) => SignUpVM());

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, AppRouteName.HOME_PAGE);
          },
          child: const Text("Sign Up Page"),
        ),
      ),
    );
  }
}
