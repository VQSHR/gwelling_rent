import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages, import_of_legacy_library_into_null_safe
// import 'package:flutter_swiper/flutter_swiper.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

const List<String> defaultImages = [
  'https://img-blog.csdnimg.cn/img_convert/cbb8a63102cbc9c779aa3ccbfe352b37.png',
  'https://img-blog.csdnimg.cn/img_convert/7d196d8b3ceea128617b33296ba8e6cd.png',
  'https://img-blog.csdnimg.cn/img_convert/4c3424ab3c6549d610d36a9542824727.png',
  'https://img-blog.csdnimg.cn/img_convert/7c5b94dba308d3ac52e18271feef033b.png',
];

var imageWidth = 424;
var imageHeight = 750;

class CommonSwiper extends StatelessWidget {
  final List<String> images;

  const CommonSwiper({Key? key, this.images = defaultImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * imageWidth / imageHeight,
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return CommonImage(
            images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
        pagination: const SwiperPagination(),
      ),
    );
  }
}
