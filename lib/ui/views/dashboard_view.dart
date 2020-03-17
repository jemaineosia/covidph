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
          // drawer: _buildDrawer(),
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
                Image.asset(
                  'assets/images/reported_cases_icon.png',
                  height: SizeConfig.safeBlockVertical * 15,
                ),
                verticalSpaceSmall,
                Text(
                  'CoViD PH',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.safeBlockVertical * 3,
                  ),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
        // ListTile(
        //   leading: Icon(
        //     Icons.notifications,
        //     color: Colors.black,
        //   ),
        //   title: Text(
        //     'Notifications',
        //     style: TextStyle(
        //       fontWeight: FontWeight.w400,
        //     ),
        //   ),
        //   onTap: () {},
        // ),
        ListTile(
          leading: Icon(
            MdiIcons.share,
            color: Colors.black,
          ),
          title: Text(
            'Share App',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.star,
            color: Colors.black,
          ),
          title: Text(
            'Rate Us!',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            MdiIcons.checkDecagram,
            color: Colors.black,
          ),
          title: Text(
            'Privacy Policy',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          onTap: () {},
        )
      ]),
    );
  }
}
