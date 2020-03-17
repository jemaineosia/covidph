import 'package:covidph/locator.dart';
import 'package:covidph/models/case.dart';
import 'package:covidph/services/firestore_services.dart';
import 'package:covidph/viewmodels/base_model.dart';

class CaseCovidViewModel extends BaseModel {
  FirestoreService _firestoreService = locator<FirestoreService>();
  List<Case> _cases;
  List<Case> get cases => _cases;

  void getCases() async {
    setBusy(true);

    _cases = await _firestoreService.getCases();
    setBusy(false);
  }

  // void getCases() {
  //   setBusy(true);

  //   _firestoreService.getCases().listen((caseData) {
  //     List<Case> updatedCase = caseData;

  //     if (updatedCase != null && updatedCase.length > 0) {
  //       _cases = updatedCase;
  //       notifyListeners();
  //     }

  //     setBusy(false);
  //   });
  // }
}
