import 'package:flutter/material.dart';
import 'custom_cursor_widget.dart';

class SingleCellWidget extends StatefulWidget {
  final String text;
  final bool isFocusedUnderline;
  final bool isShowCursor;

  SingleCellWidget({
    this.text = "",
    this.isFocusedUnderline = false,
    this.isShowCursor = false,
  });

  @override
  State<StatefulWidget> createState() => _SingleCellWidgetState();
}

class _SingleCellWidgetState extends State<SingleCellWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
               color: widget.isFocusedUnderline? Colors.black87:widget.text == '-'?Colors.red:Colors.green,
                width: widget.isShowCursor ? 1 : 2
              )
               ),
            child: Center(
              child: Text(
                widget.text.toString(),
                style: TextStyle(fontSize: 18),
              ),
            )),
        widget.isShowCursor ? CustomCursorWidget() : Container()
      ],
    );
  }
}
