import 'package:flutter/material.dart';

class FunctionButtonItem {
  final String imageUrl;
  final String title;
  final Function? onTapHandle;
  FunctionButtonItem(this.imageUrl, this.title, this.onTapHandle);
}

final List<FunctionButtonItem> list = [
  FunctionButtonItem('static/images/home_profile_record.png', "Record",
      (context) => Navigator.pushNamed(context, 'test')),
  FunctionButtonItem('static/images/home_profile_order.png', 'My Order', null),
  FunctionButtonItem('static/images/home_profile_favor.png', 'Starred', null),
  FunctionButtonItem('static/images/home_profile_id.png', 'Personal Info', null),
  FunctionButtonItem('static/images/home_profile_message.png', 'Contact Us', null),
  FunctionButtonItem('static/images/home_profile_contract.png', 'Lease', null),
  FunctionButtonItem('static/images/home_profile_wallet.png', 'Wallet', null),
  FunctionButtonItem('static/images/home_profile_house.png', "Lease Management", (context) {
    bool isLogin = true; // assume login
    if (isLogin) Navigator.of(context).pushNamed('room_manage');
  })
];
