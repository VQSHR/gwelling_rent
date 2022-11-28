import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/config.dart';
import 'package:hook_up_rent/widgets/common_check_button.dart';

class RoomApplianceItem {
  final String title;
  final int iconPoint;
  final bool isChecked;

  const RoomApplianceItem(this.title, this.iconPoint, this.isChecked);
}

const List<RoomApplianceItem> _dataList = [
  RoomApplianceItem('Closet', 0xe918, false),
  RoomApplianceItem('Washer', 0xe917, false),
  RoomApplianceItem('AC', 0xe90d, false),
  RoomApplianceItem('Gas', 0xe90f, false),
  RoomApplianceItem('Fridge', 0xe907, false),
  RoomApplianceItem('Radiator', 0xe910, false),
  RoomApplianceItem('TV', 0xe908, false),
  RoomApplianceItem('Shower', 0xe912, false),
  RoomApplianceItem('Internet', 0xe90e, false),
  RoomApplianceItem('Couch', 0xe913, false),
];

class RoomAppliance extends StatefulWidget {
  final ValueChanged<List<RoomApplianceItem>>? onChange;

  const RoomAppliance(this.onChange, {Key? key}) : super(key: key);

  @override
  State<RoomAppliance> createState() => _RoomApplianceState();
}

class _RoomApplianceState extends State<RoomAppliance> {
  List<RoomApplianceItem> list = _dataList;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: list
          .map((item) => GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                    list = list
                        .map((inItem) => (inItem == item)
                            ? RoomApplianceItem(
                                item.title,
                                item.iconPoint,
                                !item.isChecked,
                              )
                            : inItem)
                        .toList();
                  });
                  if (widget.onChange != null) {
                    widget.onChange!(list);
                  }
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Column(
                    children: [
                      Icon(
                        IconData(item.iconPoint, fontFamily: Config.commonIcon),
                        size: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(item.title),
                      ),
                      CommonCheckButton(item.isChecked),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class RoomApplianceList extends StatelessWidget {
  final List<String> list;

  const RoomApplianceList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    var showList =
        _dataList.where((item) => list.contains(item.title)).toList();
    if (showList.isEmpty) {
      return Container(
        padding: const EdgeInsets.only(left: 10),
        child: const Text('No appliance info'),
      );
    }

    return Wrap(
      runSpacing: 20,
      children: showList
          .map((item) => SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: Column(
                  children: [
                    Icon(
                      IconData(item.iconPoint, fontFamily: Config.commonIcon),
                      size: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(item.title),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
