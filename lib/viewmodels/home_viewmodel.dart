import 'package:covidph/locator.dart';
import 'package:covidph/models/stat.dart';
import 'package:covidph/services/firestore_services.dart';
import 'package:covidph/viewmodels/base_model.dart';

class HomeViewModel extends BaseModel {
  FirestoreService _firestoreService = locator<FirestoreService>();

  List<Stat> _stats;
  List<Stat> get stat => _stats;

  void getStat() async {
    setBusy(true);

    // _firestoreService.getStats().listen((statData) {
    //   List<Stat> updatedStat = statData;

    //   if (updatedStat != null && updatedStat.length > 0) {
    //     _stats = updatedStat;
    //     notifyListeners();
    //   }

    _stats = await _firestoreService.getAppStats();

    setBusy(false);
  }
}
