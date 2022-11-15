import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/utils/common_toast.dart';
import 'package:hook_up_rent/pages/utils/dio_http.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  _loginHandle() async {
    var username = usernameController.text;
    var password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      CommonToast.showToast('Username and password cannot be empty!');
      return;
    }
    const url = '/user/login';
    var params = {
      'username': username,
      'password': password
    };

    var res = await DioHttp.of(context).post(url, params);
    var resMap = jsonDecode(res.toString());

    int status = resMap['status'];
    String description = resMap['description'] ?? 'Error';
    CommonToast.showToast(description);
    if (status.toString().startsWith('2')) {
      String token = resMap['body']['token'];
      /*Store store = await Store.getInstance();
      await store.setString(StoreKeys.token, token);*/
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SafeArea(
        minimum: const EdgeInsets.all(30),
        child: ListView(children: [
          const TextField(
            decoration: InputDecoration(labelText: 'Username', hintText: 'Username'),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          TextField(
            obscureText: !_showPassword,
            decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Password',
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    icon: Icon(_showPassword
                        ? Icons.visibility_off
                        : Icons.visibility))),
          ),
          const Padding(padding: EdgeInsets.all(20)),
          ElevatedButton(
              onPressed: () {
                // Todo(),
              },
              child: const Text('Login')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('No account?'),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'register');
                  },
                  child: const Text('Register'))
            ],
          ),
        ]),
      ),
    );
  }
}
