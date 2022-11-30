import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/utils/common_toast.dart';
import 'package:hook_up_rent/widgets/room_appliance.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hook_up_rent/widgets/common_floating_button.dart';
import 'package:hook_up_rent/widgets/common_form_item.dart';
import 'package:hook_up_rent/widgets/common_image_picker.dart';
import 'package:hook_up_rent/widgets/common_radio_form_item.dart';
import 'package:hook_up_rent/widgets/common_select_form_item.dart';
import 'package:hook_up_rent/widgets/common_title.dart';

import '../../widgets/common_num_item.dart';
import '../room_manage/operation.dart';

class RoomAddPage extends StatefulWidget {
  const RoomAddPage({Key? key}) : super(key: key);

  @override
  State<RoomAddPage> createState() => _RoomAddPageState();
}

const roomTypeList = ['1B1B', '2B1B', '2B2B', '3B2B'];

class _RoomAddPageState extends State<RoomAddPage> {
  int roomType = 0;
  List<RoomApplianceItem> appliances = [];
  String imageUrl = '';

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var locationController = TextEditingController();
  var priceController = TextEditingController();
  var areaController = TextEditingController();

  Future<void> _uploadRoomData() async {
    final data = {
      'title': titleController.text,
      'description': descriptionController.text,
      'location': locationController.text,
      'price': num.parse(priceController.text),
      'area': num.parse(areaController.text),
      'roomType': roomTypeList[roomType],
      'appliances': appliances
          .where((element) => element.isChecked)
          .map((e) => e.title)
          .toList(),
      'imageUrl':
          'https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu9t1kxj30lo0c7796.jpg',
    };
    await Firestore.uploadPost(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posting'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CommonFloatingActionButton('Submit', () {
        bool valid = true;
        if (titleController.text.isEmpty) {
          CommonToast.showToast('Title cannot be empty!');
          valid = false;
        }
        if (locationController.text.isEmpty ||
            priceController.text.isEmpty ||
            areaController.text.isEmpty) {
          CommonToast.showToast('Info fields cannot be empty!');
          valid = false;
        }
        if (valid == true) {
          Timer(Duration.zero, _uploadRoomData);
          CommonToast.showToast('Room added successfully');
          Navigator.of(context).pop(true);
        }
      }),
      body: ListView(
        children: [
          const CommonTitle('Info'),
          CommonFormItem(
              label: 'Address',
              hintText: 'Enter street address',
              controller: locationController),
          CommonNumItem(
            label: 'Rent Price',
            suffixText: 'USD/month',
            hintText: 'Enter monthly rent',
            controller: priceController,
          ),
          CommonNumItem(
            label: 'Area',
            suffixText: 'sqr ft',
            hintText: 'Enter room area',
            controller: areaController,
          ),
          CommonSelectFormItem(
            label: 'Room Type',
            value: roomType,
            onChange: (val) {
              setState(() => roomType = val!);
            },
            options: roomTypeList,
          ),
          const CommonTitle('Images'),
          const CommonImagePicker(),
          const CommonTitle('Appliances'),
          RoomAppliance((data) {
            appliances = data;
          }),
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
          const CommonTitle('Description'),
          Container(
            margin: const EdgeInsets.only(bottom: 100),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: descriptionController,
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
