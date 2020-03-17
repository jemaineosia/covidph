import 'package:basic_utils/basic_utils.dart';
import 'package:covidph/ui/shared/sizing_config.dart';
import 'package:covidph/viewmodels/case_covid_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider_architecture/provider_architecture.dart';

class CasesCovidView extends StatelessWidget {
  const CasesCovidView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CaseCovidViewModel>.withConsumer(
      viewModel: CaseCovidViewModel(),
      onModelReady: (model) => model.getCases(),
      builder: (context, model, child) {
        return model.busy
            ? Center(
                child: SpinKitRipple(
                  color: Colors.redAccent,
                  size: 50.0,
                ),
              )
            : Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: SizeConfig.safeBlockVertical * 5,
                    width: SizeConfig.screenWidth,
                    color: Colors.greenAccent,
                    child: Text(
                      'CONFIRMED CASES',
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockVertical * 2,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.black12,
                          height: 0,
                        ),
                        itemCount: model.cases.length,
                        itemBuilder: (context, index) {
                          var vm = model.cases[index];

                          //* sex
                          var gender = '';
                          var newTitle = '';
                          var newSubtitle = '';
                          if (vm.sex == 'F') gender = 'Female';
                          if (vm.sex == 'M') gender = 'Male';

                          if (StringUtils.isNotNullOrEmpty(vm.nationality))
                            newTitle = vm.nationality + ' ';

                          newTitle = newTitle + gender + ' ';
                          if (StringUtils.isNotNullOrEmpty(vm.age))
                            newTitle = newTitle + vm.age + ' yrs old.';

                          if (StringUtils.isNotNullOrEmpty(vm.facility))
                            newSubtitle = vm.facility;

                          return ListTile(
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                if (vm.sex != null && vm.sex == 'F')
                                  Icon(
                                    MdiIcons.faceProfileWoman,
                                    color: Colors.pinkAccent,
                                  ),
                                if (vm.sex != null && vm.sex == 'M')
                                  Icon(
                                    MdiIcons.faceProfile,
                                    color: Colors.blue,
                                  ),
                                Text(vm.caseNo),
                              ],
                            ),
                            title: Text(newTitle),
                            subtitle: Text(newSubtitle),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
