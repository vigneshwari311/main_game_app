import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:main_game_app/ad_helper.dart';
import 'package:main_game_app/widgets/game_web_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  late BannerAd? _bannerAd;
  late RewardedAd? _rewardedAd;

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );

    _bannerAd!.load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50, width: double.infinity),
          CircleAvatar(radius: 20, backgroundColor: Colors.lightGreen),
          Text("John"),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
          onPressed: (){
            RewardedAd.load(
              adUnitId: AdHelper.rewardAdUnit, 
              request: AdRequest(), 
              rewardedAdLoadCallback: RewardedAdLoadCallback(
                onAdLoaded: (ad){
                  _rewardedAd = ad;
                  _rewardedAd?.show(
                    onUserEarnedReward: ((ad,reward){
                      print(reward.amount);
                      setState(() {
                         userScore += 5;
                      });
                     
                      
                    }
                    ));

                    _rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(

                      onAdFailedToShowFullScreenContent: (ad,error){
                        ad.dispose();
                      },
                      onAdDismissedFullScreenContent: (ad) {
                        ad.dispose();
                      },
                    );
                },
                 onAdFailedToLoad: (error){
                  print(error.message);
                 }
            )
          );
        }, 
          child: Text("Claim extra 5 coins"),
          style: ElevatedButton.styleFrom(
            backgroundColor:  Color.fromRGBO(100, 255, 218, 1)
          ),)
        ],
      ),

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_bannerAd != null)
            Container(
              width: _bannerAd!.size.width.toDouble(),
              height: _bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            ),
        ],
      ),
    );
  }
}
