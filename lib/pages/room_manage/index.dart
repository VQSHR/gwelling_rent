import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/data_list.dart';
import 'package:hook_up_rent/widgets/common_floating_button.dart';
import 'package:hook_up_rent/widgets/root_list_item_widget.dart';

import 'operation.dart';

class RoomManagePage extends StatefulWidget {
  const RoomManagePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RoomManagePageState();
}

class _RoomManagePageState extends State<RoomManagePage> {
  List<RoomListItemData> availableDataList = [];
  _getData() async {
    var dataList = await Firestore.getAllEntries();
    setState(() {
      availableDataList = dataList;
    });
  }

  @override
  void initState() {
    Timer(Duration.zero, _getData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CommonFloatingActionButton(
          'Post',
          () => Navigator.pushNamed(context, 'room_manage/room_add'),
        ),
        appBar: AppBar(
          title: const Text('Room Management'),
          bottom: const TabBar(tabs: [
            Tab(text: 'Rented'),
            Tab(text: 'Vacant'),
          ]),
        ),
        body: TabBarView(children: [
          ListView(
            children: availableDataList
                .map((item) => RoomListItemWidget(data: item))
                .toList(),
          ),
          ListView(
            children: availableDataList
                .map((item) => RoomListItemWidget(data: item))
                .toList(),
          )
        ]),
      ),
    );
  }
}
