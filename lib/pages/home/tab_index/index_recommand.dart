import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_recommand_data.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_recommand_item.dart';

class IndexRecommand extends StatelessWidget {
  final List<IndexRecommendItem> dataList;

  const IndexRecommand({
    Key? key,
    this.dataList = indexRecommendData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Color(0x00800000)),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '房屋推荐',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                Text(
                  '更多',
                  style: TextStyle(color: Colors.black54),
                )
              ]),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10, // 主轴上 children 的间距
            runSpacing: 10, // 纵轴上 children 的间距
            children: dataList
                .map((item) => IndexRecommandItemWidget(data: item))
                .toList(),
          ),
        ],
      ),
    );
  }
}
