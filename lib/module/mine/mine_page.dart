import 'package:esite/base/appearance/gaps.dart';
import 'package:esite/base/widget/hud.dart';
import 'package:esite/base/widget/y_button.dart';
import 'package:esite/base/widget/y_image.dart';
import 'package:flutter/material.dart';
import 'package:esite/base/extension/double_ex.dart';

/// tab - 我的
class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            // bgColor: Colors.blue,
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
            image: "https://images.unsplash.com/photo-1593642532400-2682810df593?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80", 
            // cornerRadius: 0,
            width: 100.ypx,
            height: 100.ypx,
            onPressed: () => Hud.showToast(text: "点击图片"),
          ),
          Gaps.vGap10,
          YImage(image: ImageUtils.getImgPath("common/page_empty"), width: 150.ypx, height: 150.ypx)
        ],
      ),
    );
  }
}