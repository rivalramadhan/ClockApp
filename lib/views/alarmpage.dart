import 'package:clock_app/constants/theme_data.dart';
import 'package:clock_app/data.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class AlarmPage extends StatefulWidget {
  AlarmPage({Key key}) : super(key: key);

  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Alarm',
            style:
                TextStyle(color: CustomColors.primaryTextColor, fontSize: 24),
          ),
          Expanded(
            child: ListView(
                children: alarms.map<Widget>((alarm) {
              return Container(
                margin: const EdgeInsets.only(bottom: 32),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: alarm.gradientColors,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: alarm.gradientColors.last.withOpacity(0.4),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(4, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            Icon(
                              Icons.label,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Office',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Switch(
                            onChanged: (bool value) {},
                            value: true,
                            activeColor: Colors.white)
                      ],
                    ),
                    Text(
                      'Mon-fri',
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '07.00 AM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).followedBy([
              DottedBorder(
                strokeWidth: 2,
                color: CustomColors.clockOutline,
                borderType: BorderType.RRect,
                radius: Radius.circular(24),
                dashPattern: [5, 4],
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CustomColors.clockBG,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/add_alarm.png',
                          scale: 1.5,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Add Alarm',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]).toList()),
          ),
        ],
      ),
    );
  }
}
