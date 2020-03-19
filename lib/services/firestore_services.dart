import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidph/models/case.dart';
import 'package:covidph/models/facility.dart';
import 'package:covidph/models/news.dart';
import 'package:covidph/models/stat.dart';
import 'package:flutter/foundation.dart';

class FirestoreService {
  final CollectionReference _casesCollectionService =
      Firestore.instance.collection("cases");

  final CollectionReference _statsCollectionService =
      Firestore.instance.collection("stats");

  final CollectionReference _facilitiesCollectionService =
      Firestore.instance.collection("facilities");

  final CollectionReference _newsCollectionService =
      Firestore.instance.collection("news");

  final StreamController<List<Stat>> _statsController =
      StreamController<List<Stat>>.broadcast();

  Stream getStats() {
    _statsCollectionService.snapshots().listen((statsSnapshot) {
      if (statsSnapshot.documents.isNotEmpty) {
        var stats = statsSnapshot.documents
            .map((snapshot) => Stat.fromData(snapshot.data))
            .where((mappedItem) => mappedItem.lastUpdated != null)
            .toList();

        _statsController.add(stats);
      }
    });

    return _statsController.stream;
  }

  Future getAppStats() async {
    try {
      var statsDocumentSnapshot = await _statsCollectionService.getDocuments();

      print(statsDocumentSnapshot.documents.length);

      if (statsDocumentSnapshot.documents.isNotEmpty) {
        return statsDocumentSnapshot.documents
            .map((snapshot) => Stat.fromData(snapshot.data))
            .where((mappedItem) => mappedItem.confirmedCases != null)
            .toList();
      }
    } catch (e) {
      print(e.message);
    }
  }

  Future getFacilities({@required String status}) async {
    try {
      var facilitiesDocumentSnapshot = await _facilitiesCollectionService
          .where('status', isEqualTo: status)
          .orderBy('facility')
          .getDocuments();

      print(facilitiesDocumentSnapshot.documents.length);

      if (facilitiesDocumentSnapshot.documents.isNotEmpty) {
        return facilitiesDocumentSnapshot.documents
            .map((snapshot) => Facility.fromData(snapshot.data))
            .where((mappedItem) => mappedItem.facility != null)
            .toList();
      }
    } catch (e) {
      print(e.message);
    }
  }

  Future getNews() async {
    try {
      var newsDocumentSnapshot = await _newsCollectionService
          .orderBy('publishedDate', descending: true)
          .limit(10)
          .getDocuments();

      print(newsDocumentSnapshot.documents.length);

      if (newsDocumentSnapshot.documents.isNotEmpty) {
        return newsDocumentSnapshot.documents
            .map((snapshot) => News.fromData(snapshot.data))
            .where((mappedItem) => mappedItem.title != null)
            .toList();
      }
    } catch (e) {
      print(e.message);
    }
  }

  Future getCases() async {
    try {
      var casesDocumentSnapshot = await _casesCollectionService
          .orderBy('id', descending: true)
          .getDocuments();

      print(casesDocumentSnapshot.documents.length);

      if (casesDocumentSnapshot.documents.isNotEmpty) {
        return casesDocumentSnapshot.documents
            .map((snapshot) => Case.fromData(snapshot.data))
            .where((mappedItem) => mappedItem.caseNo != null)
            .toList();
      }
    } catch (e) {
      print(e.message);
    }
  }
}
