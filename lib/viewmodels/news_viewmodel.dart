import 'package:covidph/locator.dart';
import 'package:covidph/models/news.dart';
import 'package:covidph/services/firestore_services.dart';
import 'package:covidph/viewmodels/base_model.dart';

class NewsViewModel extends BaseModel {
  FirestoreService _firestoreService = locator<FirestoreService>();

  List<News> _news;
  List<News> get news => _news;

  void getNews() async {
    setBusy(true);

    _news = await _firestoreService.getNews();

    setBusy(false);
  }
}
