import 'package:covidph/ui/shared/sizing_config.dart';
import 'package:covidph/viewmodels/case_confirmed_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider_architecture/provider_architecture.dart';

class CasesConfirmedView extends StatelessWidget {
  const CasesConfirmedView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CasesConfirmedViewModel>.withConsumer(
      viewModel: CasesConfirmedViewModel(),
      onModelReady: (model) => model.getFacilities(),
      builder: (context, model, child) => Scaffold(
        body: model.busy
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
                      'Confirmed Cases by Health Facility',
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
                        itemCount: model.facilities.length,
                        itemBuilder: (context, index) {
                          var vm = model.facilities[index];
                          return ListTile(
                            title: Text(vm.facility),
                            subtitle: Text('Case count: ${vm.count}'),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
