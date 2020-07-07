import 'dart:typed_data';

import 'package:esite/base/appearance/gaps.dart';
import 'package:esite/base/widget/hud.dart';
import 'package:esite/base/widget/image_picker.dart';
import 'package:esite/base/widget/y_button.dart';
import 'package:esite/base/widget/y_image.dart';
import 'package:flutter/material.dart';
import 'package:esite/base/extension/double_ex.dart';

/// tab - 我的
class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePageState();
}
class _MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin {
  Asset _asset;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container( 
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          YButton( 
            text: "普通按钮",
            width: 150,
            height: 50,
            bgColor: Colors.blue,
            corner: FButtonCorner(leftBottomCorner: 30, rightTopCorner: 30),
            borderWidth: 0.5,
            borderColor: Colors.black,
            gradient: LinearGradient(colors: [
              Color(0xff00B0FF),
              Color(0xffFFc900),
            ]),
            image: Icon(Icons.ac_unit, color: Colors.white, size: 20,),
            imageAlignment: ImageAlignment.left,
            imageSpacing: 5,
            shadowColor: Colors.grey,
            shadowBlur: 10,
            isLoading: false,
            onPressed: () => Hud.showAlert(context: context, cancelText: "取消", msg: "您确定要退出登陆吗？", confirmCallback: () {
              Hud.showToast(text: "已退出登录");
            }),
          ),
          Gaps.vGap10,
          FButton(
            width: 130.ypx,
            effect: true,
            padding: EdgeInsets.fromLTRB(6, 16, 30, 16),
            text: "FButton #4",
            textColor: Colors.white,
            color: Color(0xff00B0FF),
            onPressed: () {},
            clickEffect: true,
            cornerStyle: FButtonCornerStyle.bevel,
            strokeWidth: 0.5,
            strokeColor: Color(0xff000000),
          ),
          Gaps.vGap10,
          YImage(
            src: "https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png", 
            // cornerRadius: 0,
            width: 100.ypx,
            height: 100.ypx,
            cornerRadius: 8,
            onPressed: () => Hud.showToast(text: "点击图片"),
          ),
          Gaps.vGap10,
          YButton(text: "多选照片", width: 100, height: 100, onPressed: () => _pickImages() ),
          Gaps.vGap10,
          if (_asset != null)
            YImage(asset: _asset, width: 110, height: 110, cornerRadius: 60,)
        ],
      ),
    );
  }

  _pickImages() async {
    var assets = await ImagePicker.showImagePicker(maxCount: 1);
    if (assets == null || assets.length == 0) {
      return;
    }

    setState(() {
      _asset = assets.length > 0 ? assets[0] : null;
    });
  }

  @override
  bool get wantKeepAlive => true;
}