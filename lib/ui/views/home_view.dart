import 'package:basic_utils/basic_utils.dart';
import 'package:covidph/ui/shared/sizing_config.dart';
import 'package:covidph/ui/shared/ui_helpers.dart';
import 'package:covidph/ui/widgets/news_widget.dart';
import 'package:covidph/ui/widgets/case_status_card.dart';
import 'package:covidph/ui/widgets/case_status_card_small.dart';
import 'package:covidph/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider_architecture/provider_architecture.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
      viewModel: HomeViewModel(),
      onModelReady: (model) => model.getStat(),
      builder: (context, model, child) {
        var lastUpdatedText = DateFormat("MMMM d, y H:m a")
            .format(model.stat[0].lastUpdated.toDate());

        return Scaffold(
          backgroundColor: Color(ColorUtils.hexToInt('f1f1f1')),
          body: model.busy
              ? CircularProgressIndicator()
              : Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.center,
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.safeBlockVertical * 3,
                          color: Colors.red,
                          child: Text(
                            'COVID-19 Cases as of $lastUpdatedText',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.safeBlockVertical * 2),
                          )),
                      verticalSpaceSmall,
                      _buildMainCases(model: model),
                      _buildSubCases(model: model),
                      _buildLatestCasesList(),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildLatestCasesList() {
    return Expanded(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        margin: const EdgeInsets.all(10),
        child: NewsWidget(),
      ),
    );
  }

  Widget _buildSubCases({HomeViewModel model}) {
    final formatter = NumberFormat("#,###");
    var vm = model.stat[0];
    return Card(
      color: Colors.pinkAccent.withOpacity(0.20),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      margin: const EdgeInsets.all(10),
      child: Container(
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CaseStatusCardSmall(
              title: 'MONITORING',
              subtitle: formatter.format(vm.pum),
            ),
            CaseStatusCardSmall(
              title: 'INVESTIGATION',
              subtitle: formatter.format(vm.pui),
            ),
            CaseStatusCardSmall(
              title: 'RECOVERED',
              subtitle: formatter.format(vm.recovered),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainCases({HomeViewModel model}) {
    final formatter = NumberFormat("#,###");
    var vm = model.stat[0];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CaseStatusCard(
          title: 'CONFIRMED CASES',
          values: formatter.format(vm.confirmedCases),
          subtitle: 'Overall Reported Cases',
          textColor: Colors.green,
          imagePath: 'assets/images/reported_cases_icon.png',
        ),
        CaseStatusCard(
          title: 'REPORTED DEATHS',
          values: formatter.format(vm.deaths),
          subtitle: 'Overall Reported Deaths',
          textColor: Colors.red,
          imagePath: 'assets/images/reported_deaths_icon.png',
        ),
      ],
    );
  }
}
