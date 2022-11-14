import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/info/info_data.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

var textStyle = const TextStyle(color: Colors.black54);

class InfoItemWidget extends StatelessWidget {
  final InfoItem data;

  const InfoItemWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
      child: Row(
        children: [
          CommonImage(data.imageUrl, width: 120, height: 90),
          const Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    data.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data.source, style: textStyle),
                    Text(data.time, style: textStyle),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
