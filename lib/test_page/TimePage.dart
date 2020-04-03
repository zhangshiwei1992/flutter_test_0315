import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class TimePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TimeState();
  }
}

class TimeState extends State<TimePage> {
  DateTime _nowDate = DateTime.now();

//  _myShowDatePicker() {
//    showDatePicker(
//      context: context,
//      initialDate: _nowDate,
//      firstDate: DateTime(1900),
//      lastDate: DateTime(2100),
//    ).then((result) {
//      setState(() {
//        this._nowDate = result;
//      });
//    });
//  }
  // 异步 等待 获取选中的值
  _myShowDatePicker() async {
    var _dateResult = await showDatePicker(
      context: context,
      initialDate: _nowDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    setState(() {
      this._nowDate = _dateResult;
    });
  }

  var _nowTime = TimeOfDay(hour: 0, minute: 41);

  _myShowTimePicker() async {
    var _timeResult = await showTimePicker(
      context: context,
      initialTime: _nowTime,
    );

    setState(() {
      this._nowTime = _timeResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('20190724TimeTest001'),
      ),
      body: Column(
        children: <Widget>[
          _dateTimeDemo(),
          SizedBox(
            height: 80,
          ),
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '日期: ${formatDate(_nowDate, [yyyy, '年', mm, '月', dd, '日'])}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
            onTap: _myShowDatePicker,
          ),
          SizedBox(height: 20),
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '时间: ${_nowTime.format(context)}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
            onTap: _myShowTimePicker,
          ),
        ],
      ),
    );
  }
}

class _dateTimeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime _now = DateTime.now();
    int _timeInt = _now.millisecondsSinceEpoch;
    var _timeString = DateTime.fromMillisecondsSinceEpoch(_timeInt);
    var _timeString2 = formatDate(_now, [yyyy, '-', mm, '-', dd]);

    return Column(
      children: <Widget>[
        Text(
          '日期_now :${_now}',
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '时间戳_timeString :${_timeInt}',
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '时间_timeString :${_timeString}',
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '时间_timeString2 :${_timeString2}',
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
