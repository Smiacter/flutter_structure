import 'package:esite/module/gas/gas_page.dart';
import 'package:esite/module/home/home_page.dart';
import 'package:esite/module/mine/mine_page.dart';
import 'package:esite/module/nav/nav_page.dart';
import 'package:esite/module/pay/pay_page.dart';
import 'package:flutter/material.dart';
import '../../appearance/app_color.dart';
import '../../appearance/dimens.dart';
import '../../appearance/theme_util.dart';
import '../../widget/y_image.dart';
import '../../widget/double_tap_back_exit.dart';

class TabContainer extends StatefulWidget {
  TabContainer({Key key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabContainer> {
  var _pageController = PageController();
  List<Widget> _pages = [];
  List<String> _tabTitles = [];
  List<List<Widget>> _tabImages = [];
  List<List<Widget>> _tabDarkImages = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    // TODO: 根据条件（应该是网络请求或者地区配置）显示不同个数的tab
    _pages = [
      HomePage(),
      NavPage(),
      GasPage(),
      PayPage(),
      MinePage(),
    ];
    _tabTitles = ["首页", "导航", "加油", "付款", "我的"];
    _tabImages = [
      [
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_home_off'), width: 25.0,),
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_home_on'), width: 25.0,),
      ],
      [
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_nav_off'), width: 25.0,),
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_nav_on'), width: 25.0,),
      ],
      [
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_gas_off'), width: 25.0,),
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_gas_on'), width: 25.0,),
      ],
      [
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_pay_off'), width: 25.0,),
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_pay_on'), width: 25.0,),
      ],
      [
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_mine_off'), width: 25.0,),
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_mine_on'), width: 25.0,),
      ],
    ];
    // TODO: 替换Dark tab图标
    _tabDarkImages = [
      [
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_home_off'), width: 25.0,),
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_home_on'), width: 25.0,),
      ],
      [
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_nav_off'), width: 25.0,),
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_nav_on'), width: 25.0,),
      ],
      [
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_gas_off'), width: 25.0,),
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_gas_on'), width: 25.0,),
      ],
      [
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_pay_off'), width: 25.0,),
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_pay_on'), width: 25.0,),
      ],
      [
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_mine_off'), width: 25.0,),
        YAssetImage(src: ImageUtils.getImgPath('tab/tab_mine_on'), width: 25.0,),
      ],
    ]; 
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = ThemeUtil.isDark(context);
    return DoubleTapBackExit( 
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ThemeUtil.getBackgroundColor(context),
          items: _buildBottomBarItems(isDark),
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          elevation: 5.0,
          iconSize: 21.0,
          selectedFontSize: Dimens.font_sp10,
          unselectedFontSize: Dimens.font_sp10,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: isDark ? AppColor.dark_unselected_item_color : AppColor.unselected_item_color,
          onTap: (index) => _pageController.jumpToPage(index),
        ),
        body: PageView.builder(
          itemBuilder: (ctx, index) => _pages[index],
          itemCount: _pages.length,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(), // 禁止滑动
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
      ),
    ),
    );
  }

  List<BottomNavigationBarItem> _buildBottomBarItems(bool isDark) {
    return List.generate(_tabTitles.length, (i) {
      return BottomNavigationBarItem(  
        icon: isDark ? _tabImages[i][0] : _tabDarkImages[i][0],
        activeIcon: isDark ? _tabImages[i][1] : _tabDarkImages[i][1],
        title: Padding(  
          padding: const EdgeInsets.only(top: 1.5),
          child: Text(_tabTitles[i], key: Key(_tabTitles[i]),),
        )
      );
    });
  }
}
