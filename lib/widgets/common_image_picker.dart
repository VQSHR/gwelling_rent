import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const List<String> defaultImages = [
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
];

// 设置图片宽高
var imageWidth = 750.0;
var imageHeight = 424.0;
var imageWidgetHeightRatio = imageWidth / imageHeight; // 宽高比

class CommonImagePicker extends StatefulWidget {
  final ValueChanged? onChange;

  const CommonImagePicker({Key? key, this.onChange}) : super(key: key);

  @override
  State<CommonImagePicker> createState() => _CommonImagePickerState();
}

class _CommonImagePickerState extends State<CommonImagePicker> {
  List<XFile> files = [];
  final _picker = ImagePicker();

  _pickImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      files.add(image);
      // 通知父级数据发生变化
      if (widget.onChange != null) {
        widget.onChange!(files);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width - 10 * 4) / 3;
    var height = width / imageWidgetHeightRatio;

    Widget addButton = GestureDetector(
      onTap: () => _pickImage(),
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: width,
        height: height,
        color: Colors.grey,
        child: const Center(
          child: Text(
            '+',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w100),
          ),
        ),
      ),
    );

    Widget wrapper(XFile file) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Image.file(
            File(file.path),
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
          Positioned(
            right: -20,
            top: -20,
            child: IconButton(
              onPressed: () {
                setState(() {
                  files.remove(file);
                  if (widget.onChange != null) {
                    widget.onChange!(file);
                  }
                });
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
            ),
          ),
        ],
      );
    }

    List<Widget> list = files.map((item) => wrapper(item)).toList()
      ..add(addButton);

    return Container(
      padding: const EdgeInsets.all(10),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: list,
      ),
    );
  }
}
