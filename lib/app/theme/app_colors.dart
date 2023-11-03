import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color appWhite = Color(0xFFFFFFFF);
  static const Color appBlack = Color(0xFF000000);

  static const Color brandPrimaryPure = Color(0xFF12F276);
  static const Color brandSecondaryPure = Color(0xFF1F6854);
  static const Color brandSecondaryPureDisable = Color(0x601F6854);
  static const Color brandTertiaryDark = Color(0xFF2D2F40);
  static const Color brandTertiaryPure = Color(0xFF36384D);
  static const Color brandTertiaryLight = Color(0xFF3E4159);
  static const Color brandQuartenaryPure = Color(0xFF2C6151);
  static const Color backSuccess = Color(0xFF2B2E3E);
  static const shadowColor = Colors.black87;

  static const Color feedbackWarningPure = Color(0xFFFFC800);
  static const Color feedbackWarningDark = Color(0xFFFF4040);
  static const Color feedbackWarningLight = Color(0xFFFFD9D9);

  static const Color highlight = Color(0xFF55B962);
  static const Color linkBlue = Color(0xFF3994FF);

  static const Color neutralPrimaryLight = Color(0xFFB3B3B3);
  static const Color neutralPrimaryPure = Color(0xFFA6A6A6);
  static const Color neutralPrimaryDark = Color(0xFF999999);
  static const Color neutralPrimaryGray = Color(0xFF6A6A6A);
  static const Color neutralSecondaryPure = Color(0xFF333333);
  static const Color neutralTertiaryLight = Color(0xFFF2F2F2);
  static const Color neutralTertiaryPure = Color(0xFFCCCCCC);
  static const Color neutralTertiaryDark = Color(0xFFE6E6E6);

  //Timesheet
  static const Color timesheetGreen = Color(0xFF03AB59);
  static const Color timesheetBlue = Color(0xFF3994FF);
  static const Color appointmentStatusRed = Color(0xFFfd8888);
  static const Color appointmentStatusYellow = Color(0xFFF7AB11);
  static const Color appointmentStatusGreen = Color(0xFF10B253);
  static const Color hasAppointment = Color(0x9412F277);
  static const Color hasAppointmentWithWarning = Color(0xfffbd147);
  static const Color hasNotAppointment = Color.fromARGB(150, 242, 6, 6);

  // New Colors
  static const Color aquamarineMarca = Color(0xff31d2cc);
  static const Color azulBlu = Color(0xff3333cc);
  static const Color backgroundColor = Color(0xfff9f9fa);
  static const Color branco = Color(0xffffffff);
  static const Color checkCorrect = Color(0xff31d5a0);
  static const Color cinzaGrey = Color(0xFF747474);
  static const Color cinzaBlack = Color(0xFF2B2E3E);
  static const Color cinzaChips = Color(0xFFECECED);
  static const Color cinzaClaro = Color(0xffafafaf);
  static const Color cinzaEscuro = Color(0xff606161);
  static const Color placeholderTextField = Color(0xff4791ff);
  static const Color redErro = Color(0xffff0000);
  static const Color amareloBlu = Color(0xffffd503);
  static const Color cinzaInfoCards = Color(0xff151519);
  static const Color aquamarine = Color(0xff00d3cd);
  static const Color aquaMarineSix = Color(0xff31d2cc);
  static const Color aquaMarineThree = Color(0xff52c5cd);
  static const Color aquaMarineTwo = Color(0xff31d5a0);
  static const Color arrowGray = Color(0x8C616161);
  static const Color azure = Color(0xFF3994FF);
  static const Color black = Color(0xff323232);
  static const Color blackTwo = Color(0xff000000);
  static const Color blueberry = Color(0xff3333cc);
  static const Color blueGrey = Color(0xffa3a5aa);
  static const Color blueyGrey = Color(0xffa3a5aa);
  static const Color brightSkyBlue = Color(0xff00c3ff); // BluMedal diamond
  static const Color brownGrey = Color(0xff8b8b8b);
  static const Color brownGreyFour = Color(0xff919191);
  static const Color brownGreySeven = Color(0xffafafaf);
  static const Color brownGreySix = Color(0xffacacac);
  static const Color brownGreyThree = Color(0xffa1a1a1);
  static const Color brownGreyTwo = Color(0xffafafaf);
  static const Color brownishGrey = Color(0xff5c5c5c);
  static const Color brownishGreyFive = Color(0xff5f5f5f);
  static const Color brownishGreyFour = Color(0xff616161);
  static const Color brownishGreySeven = Color(0xff5d5d5d);
  static const Color brownishGreySix = Color(0xff6e6e6e);
  static const Color brownishGreyThree = Color(0xff656363);
  static const Color brownishGreyTwo = Color(0xff757575);
  static const Color brownishOrange = Color(0xffc7671a);
  static const Color brownishOrangeTwo = Color(0xffE7A220);
  static const Color cloudyBlue = Color(0xffa9add3);
  static const Color dark = Color(0xff253a3b);
  static const Color darkBlue = Color(0xff3D4692);
  static const Color darkBrown = Color(0xff141400);
  static const Color dirtBrown = Color(0xff895533);
  static const Color disabledGray = Color(0xffaeaeae);
  static const Color dodgerBlue = Color(0xff4791ff);
  static const Color dustyBlue = Color(0xff4fb4bb);
  static const Color goldenYellow = Color(0xffefc921);
  static const Color grapePurple = Color(0xff421558);
  static const Color greyishBrown = Color(0xff3c3c3c);
  static const Color greyLigth = Color(0xffc4c4c4);
  static const Color gunmetal = Color(0xff606161);
  static const Color ice = Color(0xffe5e6e6);
  static const Color iceBlue = Color(0xfff7f8f8);
  static const Color iceBlueTwo = Color(0xfff1f2f2);
  static const Color lightblue = Color(0xff8dd0e3);
  static const Color lightGreyBlue = Color(0xffafc8c5); // BluMedal silver
  static const Color lightGreyBlueTwo =
      Color(0xffbabcbd); // Notifiation Icon Background
  static const Color lightPeriwinkle = Color(0xffd7d8ea);
  static const Color lightSkyBlue = Color(0xffc7f2ff);
  static const Color lightUrple = Color(0xffa471f2);
  static const Color macaroniAndCheese = Color(0xfff8c128); // BluMedal gold
  static const Color marigold = Color(0xffffc900);
  static const Color milkChocolate = Color(0xff735618);
  static const Color purpleyGreyTwo = Color(0xff848384);
  static const Color paleGreyTwo = Color(0xfff2f2f6);
  static const Color veryLightPinkEight = Color(0xffd7d7d7);
  static const Color oceanBlue = Color(0xff0076a3);
  static const Color orangeYellow = Color(0xffffa101);
  static const Color paleGrey = Color(0xfff9f9fa);
  static const Color paleLilac = Color(0xffececed);
  static const Color paleLilacTwo = Color(0xffd8dcff);
  static const Color pinkishGrey = Color(0xffb8b7b7);
  static const Color pinkRed = Color(0xffff0f4c);
  static const Color pinkRedTwo = Color(0xffee034e);
  static const Color primaryBlue = Color(0xff0000ff);
  static const Color pumpkinOrange = Color(0xffff7900); // BluMedal cooper
  static const Color purpleishBlue = Color(0xff4747ff); // BluMedal platinum
  static const Color purpleyGrey = Color(0xff827f80);
  static const Color redPink = Color(0xfff22b6a);
  static const Color slateGrey = Color(0xff606061);
  static const Color sunflowerYellow = Color(0xffffd503);
  static const Color tomato = Color(0xffdd4b39);
  static const Color transparent = Color(0x00000000);
  static const Color twilightBlue = Color(0xff0e3061);
  static const Color vermillion = Color(0xffff1f00);
  static const Color veryLightBrown = Color(0xffdbb97b);
  static const Color veryLightPink = Color(0xffdbdbdb);
  static const Color veryLightPinkFive = Color(0xffc4c4c4);
  static const Color veryLightPinkFour = Color(0xffebebeb);
  static const Color veryLightPinkSeven = Color(0xffececec); // BluMedal disable
  static const Color veryLightPinkSix = Color(0xffe5e5e5);
  static const Color veryLightPinkThree = Color(0xffcdcdcd);
  static const Color waterBlue = Color(0xff1e7fda);
  static const Color white = Color(0xffffffff);

  static const MaterialColor brandPrimarySwatchDark = MaterialColor(
    0xFF12F276,
    <int, Color>{
      50: appWhite,
      100: Color(0xFF12F276),
      200: Color(0xFF12F276),
      300: Color(0xFF12F276),
      400: Color(0xFF12F276),
      500: Color(0xFF12F276),
      600: Color(0xFF12F276),
      700: Color(0xFF12F276),
      800: Color(0xFF12F276),
      900: Color(0xFF12F276),
    },
  );

  static const MaterialColor brandPrimarySwatchLight = MaterialColor(
    0xFF1F6854,
    <int, Color>{
      50: Color(0xFF1F6854),
      100: Color(0xFF1F6854),
      200: Color(0xFF1F6854),
      300: Color(0xFF1F6854),
      400: Color(0xFF1F6854),
      500: Color(0xFF1F6854),
      600: Color(0xFF1F6854),
      700: Color(0xFF1F6854),
      800: Color(0xFF1F6854),
      900: Color(0xFF1F6854),
    },
  );

  static const MaterialColor buttonTextColor = MaterialColor(
    0xFF4A5BF6,
    <int, Color>{
      50: Color(0xFF4A5BF6),
      100: Color(0xFF4A5BF6),
      200: Color(0xFF4A5BF6),
      300: Color(0xFF4A5BF6),
      400: Color(0xFF4A5BF6),
      500: Color(0xFF4A5BF6),
      600: Color(0xFF4A5BF6),
      700: Color(0xFF4A5BF6),
      800: Color(0xFF4A5BF6),
      900: Color(0xFF4A5BF6),
    },
  );
}
