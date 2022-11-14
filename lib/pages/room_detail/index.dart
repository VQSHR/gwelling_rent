import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/info/index.dart';
import 'package:hook_up_rent/pages/home/tab_search/data_list.dart';
import 'package:hook_up_rent/pages/room_detail/dart.dart';
import 'package:hook_up_rent/widgets/common_swiper.dart';
import 'package:hook_up_rent/widgets/common_tag.dart';
import 'package:hook_up_rent/widgets/common_title.dart';
import 'package:hook_up_rent/widgets/room_appliance.dart';
import 'package:share_plus/share_plus.dart';

class RoomDetailPage extends StatefulWidget {
  const RoomDetailPage({Key? key}) : super(key: key);

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

var bottomButtonTextStyle = const TextStyle(color: Colors.white, fontSize: 18);

class _RoomDetailPageState extends State<RoomDetailPage> {
  late RoomDetailData data;
  bool isLike = false; // 是否收藏
  bool showAllText = false; // 是否展开

  @override
  void initState() {
    super.initState();
    setState(() {
      data = defaultData;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 获取通过路由传递过来参数
    var item = ModalRoute.of(context)!.settings.arguments as RoomListItemData;
    var showTextTool = data.subTitle.length > 100;

    return Scaffold(
      appBar: AppBar(
        title: Text('房屋编号：${item.id}'),
        actions: [
          IconButton(
            onPressed: () => Share.share('https://www.baidu.com'),
            icon: const Icon(Icons.share),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              CommonSwiper(images: data.houseImgs),
              CommonTitle(data.title),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      data.price.toString(),
                      style: const TextStyle(fontSize: 20, color: Colors.pink),
                    ),
                    const Text(
                      '元/月(押一付三)',
                      style: TextStyle(fontSize: 14, color: Colors.pink),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 6, bottom: 6),
                child: Wrap(
                  spacing: 4,
                  children: data.tags.map((item) => CommonTag(item)).toList(),
                ),
              ),
              const Divider(color: Colors.grey, indent: 10, endIndent: 10),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 6),
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    BaseInfoItem('面积：${data.size}平方米'),
                    BaseInfoItem('楼层：${data.floor}'),
                    BaseInfoItem('户型：${data.roomType}'),
                    const BaseInfoItem('装修：精装'),
                  ],
                ),
              ),
              const CommonTitle('房屋配置'),
              RoomApplicanceList(data.applicances),
              const CommonTitle('房屋概况'),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Text(data.subTitle, maxLines: showAllText ? 5 : null),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (showTextTool)
                          GestureDetector(
                            onTap: () => setState(() {
                              showAllText = !showAllText;
                            }),
                            child: Row(
                              children: [
                                Text(showTextTool ? '展开' : '收起'),
                                Icon(showAllText
                                    ? Icons.keyboard_arrow_down
                                    : Icons.keyboard_arrow_up)
                              ],
                            ),
                          )
                        else
                          Container(),
                        GestureDetector(
                            onTap: () => Navigator.pushNamed(context, 'test'),
                            child: const Text('举报')),
                      ],
                    )
                  ],
                ),
              ),
              const CommonTitle('猜你喜欢'),
              const Info(),
              const SizedBox(height: 100),
            ],
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: 100,
            bottom: 0,
            child: Container(
              color: Colors.grey[200],
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      height: 50,
                      width: 60,
                      margin: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () => setState(() {
                          isLike = !isLike;
                        }),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              isLike ? Icons.star : Icons.star_border,
                              color: isLike ? Colors.green : Colors.black,
                              size: 24,
                            ),
                            Text(
                              isLike ? '已收藏' : '收藏',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (() => Navigator.pushNamed(context, 'test')),
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text('联系房东', style: bottomButtonTextStyle),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (() => Navigator.pushNamed(context, 'test')),
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text('预约看房', style: bottomButtonTextStyle),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BaseInfoItem extends StatelessWidget {
  final String content;

  const BaseInfoItem(this.content, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 3 * 10) / 2,
      child: Text(content),
    );
  }
}
