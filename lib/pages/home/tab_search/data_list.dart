// 搜索页数据准备
class RoomListItemData {
  final String? id;
  final String title;
  final String description;
  final String imageUrl;
  final num price;
  final num area;
  final String location;
  final String roomType;
  final List<String> appliances;

  const RoomListItemData(
      {
        this.id,
        required this.title,
        required this.description,
        required this.imageUrl,
        required this.price,
        required this.area,
        required this.location,
        required this.roomType,
        required this.appliances
      });

  factory RoomListItemData.fromMap(Map<String, dynamic> map) =>
      RoomListItemData(
          id: map['id'],
          title: map['title'],
          description: map['description'],
          imageUrl: map['imageUrl'],
          price: map['price'],
          area: map['area'],
          location: map['location'],
          roomType: map['roomType'],
          appliances: List<String>.from(map['appliances']));


  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
        'price': price,
        'area': area,
        'location': location,
        'roomType': roomType,
        'appliances': appliances
      };
}

// const List<RoomListItemData> dataList = [
//   RoomListItemData(
//       title: '朝阳门南大街 2室1厅 8300元',
//       subTitle: "二室/114/东|北/朝阳门南大街",
//       imageUrl:
//           "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu9t1kxj30lo0c7796.jpg",
//       price: 1200,
//       id: '1',
//       tags: ["近地铁", "集中供暖", "新上", "随时看房"]),
//   RoomListItemData(
//       title: '整租 · CBD总部公寓二期 临近国贸 精装修 随时拎包入住',
//       subTitle: "一室/110/西/CBD总部公寓二期",
//       imageUrl:
//           "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu5s7gcj30lo0c7myq.jpg",
//       price: 6000,
//       id: '3',
//       tags: ["近地铁", "随时看房"]),
//   RoomListItemData(
//       title: '朝阳门南大街 2室1厅 8300元',
//       subTitle: "二室/114/东|北/朝阳门南大街",
//       imageUrl:
//           "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu5s7gcj30lo0c7myq.jpg",
//       price: 1200,
//       id: '2',
//       tags: ["近地铁", "集中供暖", "新上", "随时看房"]),
//   RoomListItemData(
//       title: '整租 · CBD总部公寓二期 临近国贸 精装修 随时拎包入住',
//       subTitle: "一室/110/西/CBD总部公寓二期",
//       imageUrl:
//           "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu9t1kxj30lo0c7796.jpg",
//       price: 6000,
//       id: '41',
//       tags: ["近地铁", "随时看房"]),
// ];
