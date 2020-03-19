import 'package:covidph/ui/shared/sizing_config.dart';
import 'package:covidph/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HotlineView extends StatelessWidget {
  const HotlineView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                MdiIcons.phonePlus,
                size: SizeConfig.safeBlockVertical * 10,
                color: Colors.green,
              ),
              verticalSpaceMedium,
              Text(
                'COVID-19 HOTLINES',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockVertical * 5,
                  fontWeight: FontWeight.w800,
                  color: Colors.green,
                ),
              ),
              verticalSpaceMedium,
              GestureDetector(
                onTap: () {
                  _makePhoneCall('tel:+63289426843');
                },
                child: Text(
                  '02-894-COVID',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockVertical * 4,
                    fontWeight: FontWeight.w800,
                    color: Colors.red,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _makePhoneCall('tel:+63289426843');
                },
                child: Text(
                  '(02-894-26843)',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockVertical * 3,
                    fontWeight: FontWeight.w800,
                    color: Colors.green,
                  ),
                ),
              ),
              verticalSpaceMedium,
              GestureDetector(
                onTap: () {
                  _makePhoneCall('tel:1555');
                },
                child: Text(
                  '1555',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockVertical * 4,
                    fontWeight: FontWeight.w800,
                    color: Colors.red,
                  ),
                ),
              ),
              verticalSpaceMedium,
              Text(
                'DOH Call Center',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockVertical * 4,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _makePhoneCall('tel:+639188888364');
                },
                child: Text(
                  '+63918-8888364',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockVertical * 3,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                  ),
                ),
              ),
              Text(
                'callcenter@doh.gov.ph | doh.callcenter@gmail.com',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockVertical * 2,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'The free 24/7 services will be available through 02-894-COVID. Smart and PLDT subscribers will also be able to use the 1555 hotline for free.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockVertical * 2,
                      color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
