import 'package:covidph/locator.dart';
import 'package:covidph/models/facility.dart';
import 'package:covidph/services/firestore_services.dart';
import 'package:covidph/viewmodels/base_model.dart';

class CasePUIViewModel extends BaseModel {
  FirestoreService _firestoreService = locator<FirestoreService>();

  List<Facility> _facilities;
  List<Facility> get facilities => _facilities;

  void getFacilities() async {
    setBusy(true);

    _facilities = await _firestoreService.getFacilities(status: 'pui');

    setBusy(false);
  }
}
