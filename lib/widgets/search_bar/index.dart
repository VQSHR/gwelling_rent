import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

class SearchBar extends StatefulWidget {
  final bool? showLocation; //是否显示位置
  final Function? goBackCallback; //回退
  final String? inputValue; //搜索框值
  final String defaultInputValue; //默认显示值
  final Function? onCancel; //取消按钮
  final bool? showMap; //是否显示地图按钮
  final Function? onSearch; //点击搜索框触发
  final ValueChanged<String>? onSearchSubmit; // 点击回车触发

  const SearchBar(
      {Key? key,
      this.showLocation,
      this.goBackCallback,
      this.inputValue = '',
      this.defaultInputValue = '请输入搜索词',
      this.onCancel,
      this.showMap,
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchWord = '';
  late TextEditingController _controller;
  late FocusNode _focus; // 焦点对象

  void _onClean() {
    setState(() {
      _controller.clear();
      _searchWord = '';
    });
  }

  @override
  void initState() {
    super.initState();
    _focus = FocusNode();
    _controller = TextEditingController(text: widget.inputValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // 是否显示位置
          if (widget.showLocation ?? false) // 默认为 false
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: const [
                    Icon(
                      Icons.room,
                      color: Colors.green,
                      size: 14,
                    ),
                    Text(
                      '北京',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          // 返回按钮
          if (widget.goBackCallback != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: (widget.goBackCallback ?? () {})
                    as GestureTapCallback, // 强转
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.black87,
                ),
              ),
            ),
          // 弹性输入框
          Expanded(
            child: Container(
              height: 34,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: _controller, // 控制正在编辑的文档
                focusNode: _focus, // 控制焦点
                onTap: () {
                  if (widget.onSearchSubmit == null) {
                    _focus.unfocus(); // 不是搜索页则失去焦点
                  }
                  if (widget.onSearch != null) {
                    widget.onSearch!();
                  }
                },
                onSubmitted: widget.onSearchSubmit,
                textInputAction: TextInputAction.search, // 键盘回车文本
                onChanged: (value) {
                  setState(() => _searchWord = value);
                },
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(top: 1, left: -10), // 负数
                  border: InputBorder.none,
                  hintText: '请输入搜索词',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  suffixIcon: GestureDetector(
                    onTap: () => _onClean(),
                    child: Icon(
                      Icons.clear,
                      size: 18,
                      color: _searchWord == '' ? Colors.grey[200] : Colors.grey,
                    ),
                  ),
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 10, top: 2),
                    child: Icon(
                      Icons.search,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // 取消按钮
          if (widget.onCancel != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: (widget.onCancel ?? () {}) as GestureTapCallback,
                child: const Text(
                  '取消',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          // 显示地图
          if (widget.showMap ?? false)
            const CommonImage(
              'static/icons/widget_search_bar_map.png',
              width: 40,
              height: 40,
            ),
        ],
      ),
    );
  }
}
