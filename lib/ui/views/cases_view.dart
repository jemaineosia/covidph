import 'package:covidph/ui/views/cases_confirmed_view.dart';
import 'package:covidph/ui/views/cases_covid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CasesView extends StatefulWidget {
  const CasesView({Key key}) : super(key: key);

  @override
  _CasesViewState createState() => _CasesViewState();
}

class _CasesViewState extends State<CasesView> {
  int _curredIndex = 0;

  List<Widget> _pages = [
    CasesCovidView(),
    CasesConfirmedView(),
    // CasesPUIView(),
  ];

  void selectedPage(int index) {
    setState(() {
      _curredIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool scrollVisible = true;
    return Scaffold(
      body: _pages[_curredIndex],
      floatingActionButton: BoomMenu(
        backgroundColor: Colors.redAccent,
        fabAlignment: Alignment.topRight,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        //child: Icon(Icons.add),
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        scrollVisible: scrollVisible,
        overlayColor: Colors.black,
        overlayOpacity: 0.7,
        children: [
          MenuItem(
            child: Icon(MdiIcons.alertDecagram, color: Colors.black),
            title: "Case Overview",
            titleColor: Colors.white,
            subtitle: "(Confirmed, PUIs, PUMs, Recovered, Deaths)",
            subTitleColor: Colors.white,
            backgroundColor: Colors.redAccent,
            onTap: () => selectedPage(0),
          ),
          MenuItem(
            child: Icon(MdiIcons.hospitalMarker, color: Colors.black),
            title: "Confirmed Cases",
            titleColor: Colors.white,
            subtitle: "by Health Facilities",
            subTitleColor: Colors.white,
            backgroundColor: Colors.green,
            onTap: () => selectedPage(1),
          ),
          // MenuItem(
          //   child: Icon(MdiIcons.accountSupervisorCircle, color: Colors.black),
          //   title: "Person Under Investigation",
          //   titleColor: Colors.white,
          //   subtitle: "by Health Facilities",
          //   subTitleColor: Colors.white,
          //   backgroundColor: Colors.blue,
          //   onTap: () => selectedPage(2),
          // ),
        ],
      ),
    );
  }
}
