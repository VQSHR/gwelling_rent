import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/data_list.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/filter_drawer.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/index.dart';
import 'package:hook_up_rent/widgets/root_list_item_widget.dart';
import 'package:hook_up_rent/widgets/search_bar/index.dart';

import '../../../widgets/common_floating_button.dart';
import '../../room_manage/operation.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({Key? key}) : super(key: key);

  @override
  State<TabSearch> createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  List<RoomListItemData> availableDataList = [];
  Map<String, bool> sortState = {
    'default': true,
    'price': false,
    'area': false,
    'roomType': false,
  };

  _getData() async {
    var dataList = await Firestore.getAllEntries();
    setState(() {
      availableDataList = dataList;
    });
  }

  _getDataSorted(String field) async {
    var dataList = await Firestore.getAllEntriesSorted(field);
    setState(() {
      availableDataList = dataList;
    });
  }

  _toggleGetData(String field) async {
    if (sortState[field] == false) {
      _getDataSorted(field);
      setState(() {
        sortState.forEach((key, value) {value = false;});
        sortState[field] = true;
      });

    } else {
      _getData();
      setState(() {
        sortState[field] = false;
        sortState['default'] = true;
      });

    }
  }

  Color _toggleColor(String field) {
    var color = (sortState[field] ?? false) ? Colors.green : Colors.black87;
    return color;
  }

  @override
  void initState() {
    Timer(Duration.zero, _getData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CommonFloatingActionButton(
        'Post',
        () {
          var retVal = Navigator.pushNamed(context, 'room_manage/room_add');
          retVal.then((value) {
            if (value == true) {
              _getData();
            }
          });
        },
      ),
      endDrawer: const FilterDrawer(), // 去除 endDrawer 的默认按钮
      appBar: AppBar(
        actions: [Container()],
        elevation: 0,
        // backgroundColor: Colors.white,
        title: SearchBar(
          showLocation: true,
          showMap: true,
          inputValue: '',
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 41,
            child: Container(
              height: 51,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Sort by:'),
                  GestureDetector(
                      onTap: () => _toggleGetData('price'),
                      child: Text('Price',
                          style: TextStyle(color: _toggleColor('price')))),
                  GestureDetector(
                      onTap: () => _toggleGetData('area'),
                      child: Text('Area',
                          style: TextStyle(color: _toggleColor('area')))),
                  GestureDetector(
                      onTap: () => _toggleGetData('roomType'),
                      child: Text('Room Type',
                          style: TextStyle(color: _toggleColor('roomType')))),
                ],
              ),
            ),
            //FilterBar(),
          ),
          Expanded(
              child: ListView(
                  children: availableDataList
                      .map((item) => RoomListItemWidget(data: item))
                      .toList())),
          const SizedBox(height: 80)
        ],
      ),
    );
  }
}
