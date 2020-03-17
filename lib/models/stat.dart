import 'package:cloud_firestore/cloud_firestore.dart';

class Stat {
  final int confirmedCases;
  final int pui;
  final int pum;
  final int recovered;
  final int deaths;
  final Timestamp lastUpdated;

  Stat(
      {this.confirmedCases,
      this.pui,
      this.pum,
      this.recovered,
      this.deaths,
      this.lastUpdated});

  Stat.fromData(Map<String, dynamic> data)
      : confirmedCases = data['confirmedCases'],
        pui = data['pui'],
        pum = data['pum'],
        recovered = data['recovered'],
        deaths = data['deaths'],
        lastUpdated = data['lastUpdated'];

  Map<String, dynamic> toJson() {
    return {
      'confirmedCases': confirmedCases,
      'pui': pui,
      'pum': pum,
      'recovered': recovered,
      'deaths': deaths,
      'lastUpdated': lastUpdated,
    };
  }
}
