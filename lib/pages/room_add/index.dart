import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/room_appliance.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hook_up_rent/widgets/common_floating_button.dart';
import 'package:hook_up_rent/widgets/common_form_item.dart';
import 'package:hook_up_rent/widgets/common_image_picker.dart';
import 'package:hook_up_rent/widgets/common_radio_form_item.dart';
import 'package:hook_up_rent/widgets/common_select_form_item.dart';
import 'package:hook_up_rent/widgets/common_title.dart';

class RoomAddPage extends StatefulWidget {
  const RoomAddPage({Key? key}) : super(key: key);

  @override
  State<RoomAddPage> createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  int rentType = 0; // 租凭方式
  int decorationType = 0; // 装修

  int roomType = 0; // 户型
  int floor = 0; // 楼层
  int oriented = 0; // 朝向

  var titleController = TextEditingController(); // 描述
  var descController = TextEditingController(); // 描述

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posting'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CommonFloatingActionButton(
          'Submit',
          () {}),
      body: ListView(
        children: [
          const CommonTitle('Info'),
          // CommonFormItem(
          //   label: 'community',
          //   contentBuilder: (context) {
          //     return GestureDetector(
          //       behavior: HitTestBehavior.translucent,
          //       onTap: () {
          //         Navigator.pushNamed(context, 'search');
          //       },
          //       child: SizedBox(
          //         height: 40,
          //         child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: const [
          //               Text(
          //                 'Select community',
          //                 style: TextStyle(fontSize: 16),
          //               ),
          //               Icon(Icons.keyboard_arrow_right)
          //             ]),
          //       ),
          //     );
          //   },
          // ),
          CommonFormItem(
            label: 'Rent Price',
            suffixText: 'USD/month',
            hintText: 'Enter monthly rent',
            controller: TextEditingController(),
          ),
          CommonFormItem(
            label: 'Area',
            suffixText: 'sqr ft',
            hintText: 'Enter room area',
            controller: TextEditingController(),
          ),
          // CommonRadioFormItem(
          //   label: 'Rent Type',
          //   options: const ['partial', 'whole'],
          //   value: rentType,
          //   onChange: (index) {
          //     setState(() => rentType = index!);
          //   },
          // ),
          CommonSelectFormItem(
            label: 'Room Type',
            value: roomType,
            onChange: (val) {
              setState(() => roomType = val!);
            },
            options: const ['1', '2', '3', '4'],
          ),
          CommonSelectFormItem(
            label: 'floor',
            value: floor,
            onChange: (val) {
              setState(() => floor = val!);
            },
            options: const ['high', 'mid', 'low'],
          ),
          // CommonSelectFormItem(
          //   label: 'Facing',
          //   value: oriented,
          //   onChange: (val) {
          //     setState(() => oriented = val!);
          //   },
          //   options: const ['E', 'S', 'W', 'N'],
          // ),
          // CommonRadioFormItem(
          //   label: '装修',
          //   options: const ['精装', '简装'],
          //   value: decorationType,
          //   onChange: (index) {
          //     setState(() => decorationType = index!);
          //   },
          // ),
          const CommonTitle('Images'),
          const CommonImagePicker(),
          const CommonTitle('Title'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Enter title',
                border: InputBorder.none,
              ),
            ),
          ),
          const CommonTitle('Appliances'),
          RoomAppliance((data) {}),
          const CommonTitle('Description'),
          Container(
            margin: const EdgeInsets.only(bottom: 100),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: descController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Enter Description',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
