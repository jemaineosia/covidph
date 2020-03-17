class Case {
  final String caseNo;
  final String age;
  final String facility;
  final String labConfirmationDate;
  final String nationality;
  final String onsetSymptomsDate;
  final String resident;
  final String sex;
  final String status;
  final String travelHistory;
  final String admissionDate;

  Case({
    this.caseNo,
    this.age,
    this.facility,
    this.labConfirmationDate,
    this.nationality,
    this.onsetSymptomsDate,
    this.resident,
    this.sex,
    this.status,
    this.travelHistory,
    this.admissionDate,
  });

  static Case fromData(Map<String, dynamic> map) {
    if (map == null) return null;

    return Case(
      caseNo: map['caseNo'],
      age: map['age'].toString(),
      facility: map['facility'] ?? '',
      labConfirmationDate: map['labConfirmationDate'] ?? '',
      nationality: map['nationality'] ?? '',
      onsetSymptomsDate: map['onsetSymptomsDate'] ?? '',
      resident: map['resident'] ?? '',
      sex: map['sex'] ?? '',
      status: map['status'] ?? '',
      travelHistory: map['travelHistory'] ?? '',
      admissionDate: map['admissionDate'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'caseNo': caseNo,
      'age': age,
      'facility': facility,
      'labConfirmationDate': labConfirmationDate,
      'nationality': nationality,
      'onsetSymptomsDate': onsetSymptomsDate,
      'resident': resident,
      'sex': sex,
      'status': status,
      'travelHistory': travelHistory,
      'admissionDate': admissionDate,
    };
  }
}
