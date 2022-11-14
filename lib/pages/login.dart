import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: SafeArea(
        minimum: const EdgeInsets.all(30),
        child: ListView(children: [
          const TextField(
            decoration: InputDecoration(labelText: '用户名', hintText: '请输入用户名'),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          TextField(
            obscureText: !_showPassword,
            decoration: InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
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
              child: const Text('登录')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('还没有账号，'),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'register');
                  },
                  child: const Text('去注册~'))
            ],
          ),
        ]),
      ),
    );
  }
}
