import 'package:covidph/ui/shared/sizing_config.dart';
import 'package:flutter/material.dart';

class CaseStatusCardSmall extends StatelessWidget {
  final String title;
  final String subtitle;
  const CaseStatusCardSmall({
    Key key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.red[900],
              fontSize: SizeConfig.safeBlockVertical * 2),
        ),
        Text(
          subtitle,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: SizeConfig.safeBlockVertical * 3),
        ),
      ],
    );
  }
}
