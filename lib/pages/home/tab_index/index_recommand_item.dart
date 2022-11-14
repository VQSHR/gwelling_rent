import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_recommand_data.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

var textStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);

class IndexRecommandItemWidget extends StatelessWidget {
  final IndexRecommendItem data;

  const IndexRecommandItemWidget({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'login');
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        width: (MediaQuery.of(context).size.width - 10 * 3) / 2,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  data.title,
                  style: textStyle,
                ),
                Text(
                  data.subTitle,
                  style: textStyle,
                )
              ],
            ),
            CommonImage(data.imageUrl, width: 55),
          ],
        ),
      ),
    );
  }
}
