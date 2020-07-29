import 'package:dotted_border/dotted_border.dart';
import 'package:esite/base/widget/y_button.dart';
import 'plate_keyboard.dart';
import 'plate_styles.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

/// 车牌输入页，带键盘和输入框，支持新能源
class CarKeyboard extends StatefulWidget {
  /// 车牌号
  final String placeHolder;

  /// 主题
  final PlateStyles styles;

  /// 输入框宽度
  final double inputFieldWidth;

  /// 输入框高度
  final double inputFieldHeight;

  /// 输入变化监听器
  ///
  /// * [array] - 车牌号字符数组
  /// * [value] - 车牌号字符串
  final void Function(List<String> array, String value) onChanged;

  CarKeyboard({this.placeHolder = '', 
              this.styles = PlateStyles.light, 
              this.inputFieldWidth = 35, 
              this.inputFieldHeight = 35,
              this.onChanged});

  @override
  State<StatefulWidget> createState() => CarKeyboardState();
}

class CarKeyboardState extends State<CarKeyboard> with SingleTickerProviderStateMixin {
  /// 车牌号码数组
  final List<String> _plateNumbers = ["", "", "", "", "", "", "", ""];

  /// 当前光标位置
  int _cursorIndex = 0;

  /// 键盘进入和退出动画控制器
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    String plateNumber = widget.placeHolder;
    if (plateNumber.isNotEmpty) {
      List<String> numbers = plateNumber.split('');
      _plateNumbers.replaceRange(0, numbers.length, numbers);
      _cursorIndex = numbers.length;
    }
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    // _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onPlateNumberChanged(int index, String value) {
    _plateNumbers[index] = value;
    if (value.isNotEmpty) {
      _cursorIndex = index < 7 ? index + 1 : 7;
    } else if (value.isEmpty) {
      _cursorIndex = index > 0 ? index - 1 : 0;
    }
    if (widget.onChanged != null) {
      widget.onChanged(_plateNumbers, _plateNumbers.join());
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Colors.grey[350],
      body: Stack(  
        children: <Widget>[
          Positioned( 
            top: ScreenUtil.getInstance().screenHeight/5,
            left: 20,
            right: 20,
            child: Container( 
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(  
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Column(  
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(  
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("请输入车牌号码", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Color(0xFF666666)),),
                      YButton(image: Icon(Icons.close), padding: EdgeInsets.all(0), bgColor: Colors.white, onPressed: () {
                        Navigator.of(context).pop();
                      },)
                    ],
                  ),
                  SizedBox(height: 20,),
                  buildCarInputField(),
                  SizedBox(height: 20,),
                  YButton(text: '确认添加', bgColor: Colors.orange, height: 40, corner: FButtonCorner.all(20), onPressed: () {
                    Navigator.of(context).pop(_plateNumbers.join());
                  },),
                  SizedBox(height: 10,),
                  Row(  
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("温馨提示：请输入正确的车牌号，为您送货上车！", style: TextStyle(color: Colors.orange, fontSize: 13),)
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned( 
            left: 0,
            right: 0,
            bottom: 0,
            child: PlateKeyboard(
              plateNumbers: _plateNumbers,
              currentIndex: _cursorIndex,
              styles: widget.styles,
              newEnergy: _cursorIndex == 7,
              onChange: _onPlateNumberChanged,
              animationController: _controller,
            ),
          )
        ],
      ),
    );
  }

  /// 车牌输入框
  Widget buildCarInputField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildInputFields(),
    );
  }

  List<Widget> _buildInputFields() {
    List<Widget> children = [];
    for (int i = 0; i < _plateNumbers.length; i++) {
      children.add(_buildSingleField(_plateNumbers[i], i));
      if (1 == i) {
        children.add(_buildSeparator());
      }
    }
    return children;
  }

  Widget _buildSingleField(String data, int index) {
    bool focused = _cursorIndex == index;
    bool newEnergy = index == 7;
    Border border = focused
        ? widget.styles.plateInputFocusedBorder
        : widget.styles.plateInputBorder;
    var text = Text(
      data.isEmpty && newEnergy ? '新能源' : data,
      style: newEnergy && data.isEmpty
          ? widget.styles.newEnergyPlaceHolderTextStyle
          : widget.styles.plateInputFieldTextStyle,
    );
    var container = Container(
      width: widget.inputFieldWidth,
      height: widget.inputFieldHeight,
      alignment: Alignment.center,
      decoration: newEnergy
          ? null
          : BoxDecoration(
              color: widget.styles.plateInputFieldColor,
              border: border,
              borderRadius:
                  BorderRadius.all(widget.styles.plateInputBorderRadius),
            ),
      child: text,
    );
    var newEnergyField = DottedBorder(
      child: container,
      color: Colors.grey[500],
      borderType: BorderType.RRect,
      radius: widget.styles.plateInputBorderRadius,
      padding: const EdgeInsets.all(0),
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.3),
      child: GestureDetector(
        child: newEnergy ? newEnergyField : container,
        onTap: () {
          _cursorIndex = index;
          setState(() {});
        },
      ),
    );
  }

  Widget _buildSeparator() {
    return Container(
      width: 4,
      height: 4,
      decoration: ShapeDecoration(
        shape: CircleBorder(),
        color: widget.styles.plateSeparatorColor,
      ),
      margin: EdgeInsets.symmetric(horizontal: 4),
    );
  }
}