import 'package:covidph/ui/shared/sizing_config.dart';
import 'package:covidph/viewmodels/news_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:simple_moment/simple_moment.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<NewsViewModel>.withConsumer(
      viewModel: NewsViewModel(),
      onModelReady: (model) => model.getNews(),
      builder: (context, model, child) {
        var moment = Moment.now();

        return model.busy
            ? Center(
                child: SpinKitRipple(
                  color: Colors.redAccent,
                  size: 50.0,
                ),
              )
            : Container(
                padding: const EdgeInsets.all(10),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.black12,
                    height: 0,
                  ),
                  itemCount: model.news.length,
                  itemBuilder: (context, index) {
                    var vm = model.news[index];

                    return ListTile(
                      title: Text(
                        vm.title,
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockVertical * 2),
                      ),
                      onTap: () {
                        _launchURL(newsUrl: vm.url);
                      },
                      subtitle: Text(
                          DateFormat.yMMMd().format(vm.publishedDate.toDate())),
                    );
                  },
                ),
              );
      },
    );
  }

  _launchURL({String newsUrl}) async {
    if (await canLaunch(newsUrl)) {
      await launch(newsUrl);
    } else {
      throw 'Could not launch $newsUrl';
    }
  }
}
