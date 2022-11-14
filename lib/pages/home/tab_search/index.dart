import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/data_list.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/filter_drawer.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/index.dart';
import 'package:hook_up_rent/widgets/root_list_item_widget.dart';
import 'package:hook_up_rent/widgets/search_bar/index.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({Key? key}) : super(key: key);

  @override
  State<TabSearch> createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const FilterDrawer(),
      appBar: AppBar(
        // 去除 endDrawer 的默认按钮
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
          const SizedBox(
            height: 41,
            child: FilterBar(),
          ),
          Expanded(
              child: ListView(
                  children: dataList
                      .map((item) => RoomListItemWidget(data: item))
                      .toList()))
        ],
      ),
    );
  }
}
