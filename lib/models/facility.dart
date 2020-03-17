class Facility {
  final String count;
  final String facility;
  final String status;

  Facility({this.count, this.facility, this.status});

  static Facility fromData(Map<String, dynamic> map) {
    if (map == null) return null;

    return Facility(
      facility: map['facility'],
      count: map['count'].toString(),
      status: map['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'count': count,
      'facility': facility,
    };
  }
}
