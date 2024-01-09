import 'package:google_mobile_ads/google_mobile_ads.dart';

BannerAd? bannerAd;
InterstitialAd? interstitialAd;

void bannerAds() {
  bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-6377922343121979/3178953831",
      listener: const BannerAdListener(),
      request: const AdRequest());

  bannerAd!.load();
}

void interAds() {
  InterstitialAd.load(
      adUnitId: "ca-app-pub-6377922343121979/9624054632",
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            interstitialAd = ad;
          },
          onAdFailedToLoad: (error) {}));
}
