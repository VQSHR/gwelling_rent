import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/data.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/item.dart';
import 'package:hook_up_rent/pages/utils/common_picker/index.dart';
import 'package:hook_up_rent/pages/utils/scoped_model_helper.dart';
import 'package:hook_up_rent/scoped_model/room_filter.dart';

class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult>? onChange;

  const FilterBar({Key? key, this.onChange}) : super(key: key);

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  // 搜索是否激活
  bool isAreaActive = false;
  bool isRentTypeActive = false;
  bool isPriceActive = false;
  bool isFilterActive = false;

  // 搜索内容
  String areaId = '';
  String rentTypeId = '';
  String priceId = '';
  List<String> moreIds = [];

  _onAreaChange(context) {
    setState(() {
      // 设置区域选中效果
      isAreaActive = true;
    });

    var result = CommonPicker.showPicker(
      value: 0,
      context: context,
      options: areaList.map((item) => item.name).toList(),
    );

    if (result == null) return;

    result.then((index) {
      if (index == null) return;
      setState(() {
        areaId = areaList[index].id;
      });
    }).whenComplete(() {
      setState(() {
        // 取消区域选中效果
        isAreaActive = false;
      });
    });
    _onChange();
  }

  _onRentTypeChange(context) {
    setState(() {
      isRentTypeActive = true;
    });

    var result = CommonPicker.showPicker(
      value: 0,
      context: context,
      options: rentTypeList.map((item) => item.name).toList(),
    );

    if (result == null) return;

    result.then((index) {
      if (index == null) return;
      setState(() {
        rentTypeId = rentTypeList[index].id;
      });
    }).whenComplete(() {
      setState(() {
        isRentTypeActive = false;
      });
    });
    _onChange();
  }

  _onPriceChange(context) {
    setState(() {
      isPriceActive = !isPriceActive;
    });
    var result = CommonPicker.showPicker(
        value: 0,
        context: context,
        options: priceList.map((item) => item.name).toList());

    if (result == null) return;

    result.then((index) {
      if (index == null) return;
      setState(() {
        areaId = priceList[index].id;
      });
    });
    result.whenComplete(() {
      setState(() {
        isPriceActive = false;
      });
    });
    _onChange();
  }

  _onFilterChange(context) {
    Scaffold.of(context).openEndDrawer();
  }

  // 响应给父组件
  _onChange() {
    var selectedList =
        ScopedModelHelper.getModel<FilterBarModel>(context).selectedList;
    if (widget.onChange != null) {
      widget.onChange!(
        FilterBarResult(
          areaId: areaId,
          rentTypeId: rentTypeId,
          priceId: priceId,
          moreId: moreIds,
          moreIds: selectedList.toList(),
        ),
      );
    }
  }

  _getData() {
    Map<String, List<GeneralType>> dataList = <String, List<GeneralType>>{};
    dataList['roomTypeList'] = roomTypeList;
    dataList['orientedList'] = orientedList;
    dataList['floorList'] = floorList;

    ScopedModelHelper.getModel<FilterBarModel>(context).dataList = dataList;
  }

  @override
  void initState() {
    Timer.run(_getData);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _onChange();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Item(
            title: '区域',
            isActive: isAreaActive,
            onTap: _onAreaChange,
          ),
          Item(
            title: '方式',
            isActive: isRentTypeActive,
            onTap: _onRentTypeChange,
          ),
          Item(
            title: '租金',
            isActive: isPriceActive,
            onTap: _onPriceChange,
          ),
          Item(
            title: '筛选',
            isActive: isFilterActive,
            onTap: _onFilterChange,
          ),
        ],
      ),
    );
  }
}
