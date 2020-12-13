import 'package:countries_info/animations/flare_assets.dart';
import 'package:countries_info/viewmodels/landing_page_view_model.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import '../base_view.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LandingPageViewModel>(
      builder: (context, model, child) => Scaffold(
        body: Container(
          child: FlareActor(
            FlareAssets.palotaIntro,
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: FlareAssets.palotaIntroAnimationName,
            callback: (String _) {
              // wait 1 second before navigating
              Future.delayed(Duration(seconds: 1)).then(
                    (value) => model.navigateToCountries(),
              );
            },
          ),
        ),
      ),
    );
  }

}
