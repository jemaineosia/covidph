import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:covidph/ui/shared/sizing_config.dart';
import 'package:covidph/ui/shared/ui_helpers.dart';
import 'package:covidph/ui/views/cases_view.dart';
import 'package:covidph/ui/views/home_view.dart';
import 'package:covidph/ui/views/hotline_view.dart';
import 'package:covidph/viewmodels/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ViewModelProvider<DashboardViewModel>.withConsumer(
      viewModel: DashboardViewModel(),
      builder: (context, model, child) => DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: _buildDrawer(),
          appBar: _buildAppBar(),
          body: _buildTabBarView(),
          bottomNavigationBar: _buildBottomNavigationBar(),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: new BubbleTabIndicator(
        indicatorHeight: 35.0,
        indicatorColor: Colors.pinkAccent.withOpacity(0.20),
        tabBarIndicatorSize: TabBarIndicatorSize.tab,
      ),
      tabs: [
        Tab(
          child: Row(
            children: <Widget>[
              Icon(MdiIcons.home),
              horizontalSpaceTiny,
              Text('Home')
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        Tab(
          child: Row(
            children: <Widget>[
              Icon(MdiIcons.hospitalBox),
              horizontalSpaceTiny,
              Text('Cases')
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        Tab(
          child: Row(
            children: <Widget>[
              Icon(MdiIcons.phoneInTalk),
              horizontalSpaceTiny,
              Text('Hotline')
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ],
      labelColor: Colors.red[900],
      unselectedLabelColor: Colors.black.withOpacity(0.80),
      indicatorPadding: EdgeInsets.all(5.0),
    );
  }

  _launchURL({String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildTabBarView() {
    return TabBarView(
      children: [
        HomeView(),
        CasesView(),
        HotlineView(),
      ],
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      actions: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'COVID PH',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.safeBlockVertical * 3),
            ),
            horizontalSpaceSmall,
            Image.asset(
              'assets/images/flag.png',
              height: SizeConfig.safeBlockVertical * 9,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                verticalSpaceMedium,
                Expanded(
                  child: Image.asset(
                    'assets/images/reported_cases_icon.png',
                    height: SizeConfig.safeBlockVertical * 25,
                  ),
                ),
                verticalSpaceSmall,
                Expanded(
                  child: Text(
                    'Covid PH',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.safeBlockVertical * 3,
                    ),
                  ),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
        ListTile(
          title: Text(
            'Important Links',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizeConfig.safeBlockVertical * 2,
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            MdiIcons.hospitalBoxOutline,
            color: Colors.black,
          ),
          title: Text(
            'DOH Website',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          onTap: () {
            _launchURL(url: 'https://www.doh.gov.ph');
          },
        ),
        ListTile(
          leading: Icon(
            MdiIcons.earth,
            color: Colors.black,
          ),
          title: Text(
            'World Health Organization',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          onTap: () {
            _launchURL(url: 'https://www.who.int');
          },
        ),
        ListTile(
          leading: Icon(
            MdiIcons.crosshairsGps,
            color: Colors.black,
          ),
          title: Text(
            'Philippines NCOV Tracker',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          onTap: () {
            _launchURL(url: 'https://ncovtracker.doh.gov.ph');
          },
        ),
        ListTile(
          leading: Icon(
            MdiIcons.shieldLinkVariantOutline,
            color: Colors.black,
          ),
          title: Text(
            'FightCovid.app',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          onTap: () {
            _launchURL(url: 'https://fightcovid.app');
          },
        ),
        ListTile(
          leading: Icon(
            MdiIcons.radar,
            color: Colors.black,
          ),
          title: Text(
            'Global Cases Map',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          onTap: () {
            _launchURL(
                url:
                    'https://gisanddata.maps.arcgis.com/apps/opsdashboard/index.html#/bda7594740fd40299423467b48e9ecf6');
          },
        ),
      ]),
    );
  }
}
