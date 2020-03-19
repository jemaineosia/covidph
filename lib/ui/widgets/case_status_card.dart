import 'package:basic_utils/basic_utils.dart';
import 'package:covidph/ui/shared/sizing_config.dart';
import 'package:covidph/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class CaseStatusCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String values;
  final Color textColor;
  final String imagePath;
  const CaseStatusCard(
      {Key key,
      @required this.subtitle,
      @required this.values,
      @required this.textColor,
      this.imagePath,
      @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Text(
                title,
                softWrap: false,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeVertical * 2,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              verticalSpaceSmall,
              if (StringUtils.isNotNullOrEmpty(imagePath))
                Column(
                  children: <Widget>[
                    Image.asset(
                      imagePath,
                      height: SizeConfig.safeBlockVertical * 10,
                    ),
                    verticalSpaceSmall,
                  ],
                ),
              Text(
                values,
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockVertical * 5,
                  fontWeight: FontWeight.w800,
                  color: textColor,
                ),
              ),
              verticalSpaceTiny,
              Text(
                subtitle,
                softWrap: false,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: SizeConfig.safeBlockVertical * 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
