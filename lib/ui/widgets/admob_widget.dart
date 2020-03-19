import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String testDevice = 'DA43A0C0-3B96-411D-8148-5359AA4806FA';

class AdmobWidget extends StatefulWidget {
  const AdmobWidget({Key key}) : super(key: key);

  @override
  _AdmobWidgetState createState() => _AdmobWidgetState();
}

class _AdmobWidgetState extends State<AdmobWidget> {
  static final MobileAdTargetingInfo targetInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['health', 'corona'],
    nonPersonalizedAds: true,
  );

  InterstitialAd _interstitialAd;

  BannerAd createBannerAdd() {
    return new BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,
      targetingInfo: targetInfo,
      listener: (MobileAdEvent event) {
        print('Banner event: $event');
      },
    );
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: getInterstitialAdUnitId(),
      targetingInfo: targetInfo,
      listener: (MobileAdEvent event) {
        print('Interstitial event: $event');
      },
    );
  }

  String getAppId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-8977853393084950~9062146110';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-8977853393084950~2688309459';
    }
    return null;
  }

  String getInterstitialAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-8977853393084950/7174349374';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-8977853393084950/6216490925';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();

    loadAd();
  }

  void loadAd() async {
    final prefs = await SharedPreferences.getInstance();

    int dateTimeLastAdShown = prefs.getInt('dateTimeLastAdShown');

    if (dateTimeLastAdShown != null) {
      DateTime before =
          DateTime.fromMillisecondsSinceEpoch(dateTimeLastAdShown);
      DateTime now = DateTime.now();
      Duration timeDifference = now.difference(before);

      int mins = timeDifference.inMinutes;

      if (mins > 10) {
        int timestamp = DateTime.now().millisecondsSinceEpoch;
        prefs.setInt('dateTimeLastAdShown', timestamp);

        await FirebaseAdMob.instance.initialize(appId: getAppId());
        _interstitialAd = createInterstitialAd()
          ..load()
          ..show();
      }
    } else {
      int timestamp = DateTime.now().millisecondsSinceEpoch;
      prefs.setInt('dateTimeLastAdShown', timestamp);

      await FirebaseAdMob.instance.initialize(appId: getAppId());
      _interstitialAd = createInterstitialAd()
        ..load()
        ..show();
    }
  }

  @override
  void dispose() {
    // _bannerAd?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
