import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hook_up_rent/pages/home/tab_search/data_list.dart';

class Firestore {

  static Future<dynamic> uploadPost(Map<String, dynamic> data) async {
    return await FirebaseFirestore.instance.collection("rooms").add(data);
  }

  static Future<void> deletePost(String docId) async {
    await FirebaseFirestore.instance
        .collection("rooms")
        .doc(docId)
        .delete();
  }
  static Future<List<RoomListItemData>> getAllEntries() async {
    return (await FirebaseFirestore.instance.collection('rooms').get())
        .docs
        .map((item) => RoomListItemData.fromMap(item.data()))
        .toList();
  }
  static Future<List<RoomListItemData>> getAllEntriesSorted(String field) async {
    return (await FirebaseFirestore.instance.collection('rooms').orderBy(field).get())
        .docs
        .map((item) => RoomListItemData.fromMap(item.data()))
        .toList();
  }
}
