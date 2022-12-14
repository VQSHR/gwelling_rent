import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/utils/common_toast.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ElevatedButton(
            // style: ElevatedButton.styleFrom(primary: Colors.red),
            onPressed: () {
              CommonToast.showToast('Already logged out');
            },
            child: const Text('Logout'),
          )
        ],
      ),
    );
  }
}
