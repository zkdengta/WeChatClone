import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart' show Constants, AppColors, AppStyles;
import '../i18n/strings.dart' show Strings;

enum ActionItems {
  GROUP_CHAT,
  ADD_FRIEND,
  QR_SCAN,
  PAYMENT,
  HELP
}

class NavigationIconViw {
  final BottomNavigationBarItem item;

  NavigationIconViw({Key key, String title, IconData icon, IconData activeIcon})
      :
        item = BottomNavigationBarItem(
          icon: Icon(icon),
          activeIcon: Icon(activeIcon),
          title: Text(title),
          backgroundColor: Colors.white,
        );
}

class HomeScreen extends StatefulWidget {
  String title = Strings.TitleWechat;
  Color headerColor;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  static const HeaderColor = const Color(AppColors.PrimaryColor);
  int _currentIndex = 0;
  List<NavigationIconViw> _navigationViews;
  List<Widget> _mainActions;
  List<Widget> _functionActions;

  void initState() {
    super.initState();
    widget.headerColor = HeaderColor;

    //设置popup的位置
    _showMenu(BuildContext context) {

      showMenu<ActionItems>(
        context: context,
        position:  RelativeRect.fromLTRB(1000.0, 90.0, 0.0, 0.0),
        items: <PopupMenuItem<ActionItems>>[
          PopupMenuItem(
            child: _buildPopupMunuItem(0xe69e, Strings.MenuGroupChat),
            value: ActionItems.GROUP_CHAT,
          ),
          PopupMenuItem(
            child: _buildPopupMunuItem(0xe638, Strings.MenuAddFriends),
            value: ActionItems.ADD_FRIEND,
          ),
          PopupMenuItem(
            child: _buildPopupMunuItem(0xe61b, Strings.MenuQRScan),
            value: ActionItems.QR_SCAN,
          ),
          PopupMenuItem(
            child: _buildPopupMunuItem(0xe62a, Strings.MenuPayments),
            value: ActionItems.PAYMENT,
          ),
          PopupMenuItem(
            child: _buildPopupMunuItem(0xe63d, Strings.MenuHelp),
            value: ActionItems.HELP,
          ),
        ],
      ).then<ActionItems>((ActionItems selected) {
        switch(selected){
          default:
            print('当前选中的是：$selected');
        }
      });
    }

    _mainActions = [
      IconButton(
          icon: Icon(IconData(
            0xe65e,
            fontFamily: Constants.IconFontFamily,
          ),
            size: Constants.ActionIconSize,
            color: const Color(AppColors.ActionIconColor),
          ),
          onPressed: () {
            print('点击了搜索按钮');
          }
      ),
      IconButton(
          icon: Icon(IconData(
            0xe60e,
            fontFamily: Constants.IconFontFamily,
          ),
            size: Constants.ActionIconSize + 4.0,
            color: const Color(AppColors.ActionIconColor),
          ),
          onPressed: () {
            _showMenu(context);
          }
      ),
      Container(width: 10.0),
//      Theme(
//        data: ThemeData(
//          cardColor: Color(AppColors.ActionMenuBgColor),
//        ),
//        child: PopupMenuButton(itemBuilder: (BuildContext context) {
//          return <PopupMenuItem<ActionItems>>[
////            PopupMenuItem(
////              child: _buildPopupMunuItem(0xe69e, Strings.MenuGroupChat),
////              value: ActionItems.GROUP_CHAT,
////            ),
////            PopupMenuItem(
////              child: _buildPopupMunuItem(0xe638, Strings.MenuAddFriends),
////              value: ActionItems.ADD_FRIEND,
////            ),
////            PopupMenuItem(
////              child: _buildPopupMunuItem(0xe61b, Strings.MenuQRScan),
////              value: ActionItems.QR_SCAN,
////            ),
////            PopupMenuItem(
////              child: _buildPopupMunuItem(0xe62a, Strings.MenuPayments),
////              value: ActionItems.PAYMENT,
////            ),
////            PopupMenuItem(
////              child: _buildPopupMunuItem(0xe63d, Strings.MenuHelp),
////              value: ActionItems.HELP,
////            ),
////          ];
//        },
//          icon: Icon(IconData(
//            0xe60e,
//            fontFamily: Constants.IconFontFamily,
//          ),
//            size: Constants.ActionIconSize + 4.0,
//            color: const Color(AppColors.ActionIconColor),
//          ),
//          onSelected: (ActionItems selected) {
//            print('点击的是$selected');
//          },
//        ),
//      ),
//      Container(width: 16.0),
    ];



    _functionActions = [
      IconButton(
        icon: Icon(IconData(
          0xe60a,
          fontFamily: Constants.IconFontFamily,
        ),
        size: Constants.ActionIconSize + 4.0,
        color: const Color(AppColors.ActionIconColor)),
        onPressed: (){print('打开相机拍短视频');}),
      Container(width: 16.0),
    ];


    _navigationViews = [
      NavigationIconViw(
      title: Strings.TitleContact,
        icon: IconData(
          0xe608,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe603,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconViw(
        title: Strings.TitleContact,
        icon: IconData(
          0xe601,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe656,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconViw(
        title: Strings.TitleDiscovery,
        icon: IconData(
          0xe600,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe671,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconViw(
        title: Strings.TitleMe,
        icon: IconData(
          0xe6c0,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe626,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
    ];
  }

  _buildPopupMunuItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Icon(IconData(
          iconName,
          fontFamily: Constants.IconFontFamily,
        ),
          size: 22.0,
          color: const Color(AppColors.ActionMenuBgColor),
        ),
        Container(width: 12.0,),
        Text(title, style: TextStyle(
            color: const Color(AppColors.ActionMenuBgColor))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
    final BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      fixedColor: const Color(AppColors.TabIconActive),
      items: _navigationViews.map((NavigationIconViw view) {
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: AppStyles.TitleStyle,),
        elevation: 0.0, //去掉阴影
        brightness: Brightness.light,
        backgroundColor: widget.headerColor,
        actions: _currentIndex == 3 ? _functionActions : _mainActions,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }

}