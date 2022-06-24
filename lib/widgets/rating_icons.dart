import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mood_tracker/theme.dart';

class RatingIcons {
  static Icon icon1 = Icon(FontAwesomeIcons.faceSadTear);
  static Icon icon1Solid = Icon(
    FontAwesomeIcons.solidFaceSadTear,
    color: MyColors.ratingColors[0],
  );
  static Icon icon2Solid = Icon(
    FontAwesomeIcons.solidFaceFrownOpen,
    color: MyColors.ratingColors[1],
  );
  static Icon icon2 = Icon(FontAwesomeIcons.faceFrownOpen);
  static Icon icon3Solid = Icon(
    FontAwesomeIcons.solidFaceFrown,
    color: MyColors.ratingColors[2],
  );

  static Icon icon3 = Icon(FontAwesomeIcons.faceFrown);
  static Icon icon4Solid = Icon(
    FontAwesomeIcons.solidFaceSmile,
    color: MyColors.ratingColors[3],
  );
  static Icon icon4 = Icon(FontAwesomeIcons.faceSmile);
  static Icon icon5Solid = Icon(
    FontAwesomeIcons.solidFaceGrin,
    color: MyColors.ratingColors[4],
  );
  static Icon icon5 = Icon(FontAwesomeIcons.faceGrin);
  static Icon icon6Solid = Icon(
    FontAwesomeIcons.solidFaceLaughBeam,
    color: MyColors.ratingColors[5],
  );
  static Icon icon6 = Icon(FontAwesomeIcons.faceLaughBeam);

  static List<Icon> solidIcons = [icon1Solid, icon2Solid, icon3Solid, icon4Solid, icon5Solid, icon6Solid];
}
