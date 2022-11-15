import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hook_up_rent/apis/request_api.dart';
import 'package:hook_up_rent/pages/utils/common_toast.dart';
import 'package:hook_up_rent/pages/utils/dio_http.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var usernameController = TextEditingController();
    var passwordController = TextEditingController();
    var repeatPasswordController = TextEditingController();

    _registerHandler() async {
      var username = usernameController.text;
      var password = passwordController.text;
      var repeatPassword = repeatPasswordController.text;


      if (username.isEmpty || password.isEmpty) {
        CommonToast.showToast('Username and password cannot be empty!');
        return;
      }
      if (password != repeatPassword) {
        CommonToast.showToast('Password does not match');
        return;
      }

      var url = '/user/registered';
      var params = {'username': username, 'password': password};
      var res = await DioHttp.of(context).post(url, params);
      var resMap = jsonDecode(res.toString());

      print(resMap['status']);
      int status = resMap['status'];
      String description = resMap['description'] ?? 'Error';
      CommonToast.showToast(description);
      if (status.toString().startsWith('2')) {
        Navigator.of(context).pushReplacementNamed('login');
        /*Store store = await Store.getInstance();
      await store.setString(StoreKeys.token, token);*/
      }


    }

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SafeArea(
        minimum: const EdgeInsets.all(30),
        child: ListView(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                hintText: 'Username',
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Password',
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: repeatPasswordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Password',
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _registerHandler(),
              child: const Text('Register'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, 'login');
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                  child: const Text('Login'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
