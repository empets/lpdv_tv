// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/icon_bible
  $AssetsImagesIconBibleGen get iconBible => const $AssetsImagesIconBibleGen();

  /// Directory path: assets/images/icon_home
  $AssetsImagesIconHomeGen get iconHome => const $AssetsImagesIconHomeGen();

  /// Directory path: assets/images/icon_living
  $AssetsImagesIconLivingGen get iconLiving =>
      const $AssetsImagesIconLivingGen();

  /// Directory path: assets/images/icon_plus
  $AssetsImagesIconPlusGen get iconPlus => const $AssetsImagesIconPlusGen();
}

class $AssetsImagesIconBibleGen {
  const $AssetsImagesIconBibleGen();

  /// File path: assets/images/icon_bible/icon_bible.svg
  String get iconBible => 'assets/images/icon_bible/icon_bible.svg';

  /// List of all assets
  List<String> get values => [iconBible];
}

class $AssetsImagesIconHomeGen {
  const $AssetsImagesIconHomeGen();

  /// File path: assets/images/icon_home/icon_heart.svg
  String get iconHeart => 'assets/images/icon_home/icon_heart.svg';

  /// File path: assets/images/icon_home/icon_notification.svg
  String get iconNotification =>
      'assets/images/icon_home/icon_notification.svg';

  /// File path: assets/images/icon_home/icon_personne_free.png
  AssetGenImage get iconPersonneFree =>
      const AssetGenImage('assets/images/icon_home/icon_personne_free.png');

  /// File path: assets/images/icon_home/icon_personne_frees.png
  AssetGenImage get iconPersonneFrees =>
      const AssetGenImage('assets/images/icon_home/icon_personne_frees.png');

  /// File path: assets/images/icon_home/icon_play.svg
  String get iconPlay => 'assets/images/icon_home/icon_play.svg';

  /// File path: assets/images/icon_home/icon_search.svg
  String get iconSearch => 'assets/images/icon_home/icon_search.svg';

  /// File path: assets/images/icon_home/image0.png
  AssetGenImage get image0 =>
      const AssetGenImage('assets/images/icon_home/image0.png');

  /// File path: assets/images/icon_home/image1.png
  AssetGenImage get image1 =>
      const AssetGenImage('assets/images/icon_home/image1.png');

  /// File path: assets/images/icon_home/image2.png
  AssetGenImage get image2 =>
      const AssetGenImage('assets/images/icon_home/image2.png');

  /// File path: assets/images/icon_home/image3.png
  AssetGenImage get image3 =>
      const AssetGenImage('assets/images/icon_home/image3.png');

  /// File path: assets/images/icon_home/image4.png
  AssetGenImage get image4 =>
      const AssetGenImage('assets/images/icon_home/image4.png');

  /// File path: assets/images/icon_home/image5.png
  AssetGenImage get image5 =>
      const AssetGenImage('assets/images/icon_home/image5.png');

  /// File path: assets/images/icon_home/image6.png
  AssetGenImage get image6 =>
      const AssetGenImage('assets/images/icon_home/image6.png');

  /// List of all assets
  List<dynamic> get values => [
    iconHeart,
    iconNotification,
    iconPersonneFree,
    iconPersonneFrees,
    iconPlay,
    iconSearch,
    image0,
    image1,
    image2,
    image3,
    image4,
    image5,
    image6,
  ];
}

class $AssetsImagesIconLivingGen {
  const $AssetsImagesIconLivingGen();

  /// File path: assets/images/icon_living/icon_living.svg
  String get iconLiving => 'assets/images/icon_living/icon_living.svg';

  /// List of all assets
  List<String> get values => [iconLiving];
}

class $AssetsImagesIconPlusGen {
  const $AssetsImagesIconPlusGen();

  /// File path: assets/images/icon_plus/church.png
  AssetGenImage get church =>
      const AssetGenImage('assets/images/icon_plus/church.png');

  /// File path: assets/images/icon_plus/icon_calendar.svg
  String get iconCalendar => 'assets/images/icon_plus/icon_calendar.svg';

  /// File path: assets/images/icon_plus/icon_church.svg
  String get iconChurch => 'assets/images/icon_plus/icon_church.svg';

  /// File path: assets/images/icon_plus/icon_demande_priere.svg
  String get iconDemandePriere =>
      'assets/images/icon_plus/icon_demande_priere.svg';

  /// File path: assets/images/icon_plus/icon_gift.svg
  String get iconGift => 'assets/images/icon_plus/icon_gift.svg';

  /// File path: assets/images/icon_plus/icon_intervenant.svg
  String get iconIntervenant => 'assets/images/icon_plus/icon_intervenant.svg';

  /// File path: assets/images/icon_plus/icon_librayrie.svg
  String get iconLibrayrie => 'assets/images/icon_plus/icon_librayrie.svg';

  /// File path: assets/images/icon_plus/icon_more.svg
  String get iconMore => 'assets/images/icon_plus/icon_more.svg';

  /// File path: assets/images/icon_plus/icon_partenaire.svg
  String get iconPartenaire => 'assets/images/icon_plus/icon_partenaire.svg';

  /// File path: assets/images/icon_plus/icon_play.svg
  String get iconPlay => 'assets/images/icon_plus/icon_play.svg';

  /// File path: assets/images/icon_plus/icon_playe_video.png
  AssetGenImage get iconPlayeVideo =>
      const AssetGenImage('assets/images/icon_plus/icon_playe_video.png');

  /// File path: assets/images/icon_plus/icon_video_player.svg
  String get iconVideoPlayer => 'assets/images/icon_plus/icon_video_player.svg';

  /// List of all assets
  List<dynamic> get values => [
    church,
    iconCalendar,
    iconChurch,
    iconDemandePriere,
    iconGift,
    iconIntervenant,
    iconLibrayrie,
    iconMore,
    iconPartenaire,
    iconPlay,
    iconPlayeVideo,
    iconVideoPlayer,
  ];
}

abstract final class Assets {
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
