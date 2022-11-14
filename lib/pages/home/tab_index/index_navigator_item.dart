import 'package:flutter/material.dart';

// 点击导航区域传递的数据结构：包含 导航名称、图片、点击事件
class IndexNavigatorItem {
  final String title;
  final String imageUrl;
  final Function(BuildContext contenxt) onTap;
  IndexNavigatorItem(this.title, this.imageUrl, this.onTap);
}

List<IndexNavigatorItem> indexNavigatorItemList = [
  IndexNavigatorItem('整租', 'static/images/home_index_navigator_total.png',
      (BuildContext context) {
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem('合租', 'static/images/home_index_navigator_share.png',
      (BuildContext context) {
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem('地图找房', 'static/images/home_index_navigator_map.png',
      (BuildContext context) {
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem('去出租', 'static/images/home_index_navigator_rent.png',
      (BuildContext context) {
    Navigator.of(context).pushNamed('login');
  }),
];
