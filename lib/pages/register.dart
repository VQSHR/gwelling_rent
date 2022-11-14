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
        CommonToast.showToast('用户名或密码不能为空!');
        return;
      }
      if (password != repeatPassword) {
        CommonToast.showToast('两次输入密码不一致');
        return;
      }

      var params = {'username': username, 'password': password};
      var res = await DioHttp.of(context).post(RequestApi.REGISTER, params);
      print(res.data);
      Navigator.pushNamed(context, 'login');
    }

    return Scaffold(
      appBar: AppBar(title: const Text('注册')),
      body: SafeArea(
        minimum: const EdgeInsets.all(30),
        child: ListView(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: '用户名',
                hintText: '请输入用户名',
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: repeatPasswordController,
              decoration: const InputDecoration(
                labelText: '确认密码',
                hintText: '请输入密码',
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _registerHandler(),
              child: const Text('注册'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('已有账号，'),
                TextButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, 'login');
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                  child: const Text('去登录~'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
