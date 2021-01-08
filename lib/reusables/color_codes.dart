import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const grey_color = const Color(0xff909090);
const dark_pupple = const Color(0xff7B4397);
const dro_purple = const Color(0xff9F5DE2);
const dro_turquoise = const Color(0xff0CB8B6);
const desc_color = const Color(0xff3b4c50);

const dialogColor = const Color(0xff0EB6B6);

const cartpageStyle = const TextStyle(color: Colors.white);

const boldn20Style = const TextStyle(fontWeight: FontWeight.bold, fontSize: 20);

final String constituents = 'asset/icons/constituents.svg';
final String dispensed = 'asset/icons/dispensed.svg';
final String packSize = 'asset/icons/packSize.svg';
final String productId = 'asset/icons/productId.svg';
final String shopBag = 'asset/icons/shopBag.svg';
final String shopBagPlus = 'asset/icons/shopBagPlus.svg';
final String arrow = 'asset/icons/arrow.svg';
final String filter = 'asset/icons/filter.svg';

final Widget constituentsIcon =
    SvgPicture.asset(constituents, color: dro_purple, height: 20, width: 20);
final Widget dispensedIcon =
    SvgPicture.asset(dispensed, color: dro_purple, height: 20, width: 20);
final Widget packSizeIcon =
    SvgPicture.asset(packSize, color: dro_purple, height: 25, width: 25);
final Widget productIdIcon =
    SvgPicture.asset(productId, color: dro_purple, height: 20, width: 20);
final Widget shopBagIcon =
    SvgPicture.asset(shopBag, color: Colors.white, height: 20, width: 20);
final Widget shopBagPlusIcon =
    SvgPicture.asset(shopBagPlus, color: Colors.white, height: 20, width: 20);
final Widget arrowIcon =
    SvgPicture.asset(arrow, color: Colors.black87, height: 20, width: 20);
final Widget filterIcon =
    SvgPicture.asset(filter, color: Colors.black87, height: 20, width: 20);
