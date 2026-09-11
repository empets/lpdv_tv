import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lpdv_tv/core/app_color/app_color.dart';
import 'package:lpdv_tv/feature/home/presentation/page/video_player_screen.dart';
import 'package:lpdv_tv/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: MyColors.primaryBlue,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(height: 24.h),
              CustomeAppHeader(),
              SizedBox(height: 7.h),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 1.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      Assets.images.iconHome.image1.path,
                      fit: BoxFit.cover,
                      height: 0.28.sh,
                      width: double.infinity,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              // Colors.black,
                              // Colors.black,
                              // Colors.grey.shade600,
                              Color(0xFF050814).withValues(alpha: 0.2),
                              Color(0xFF050814).withValues(alpha: 0.3),
                              Color(0xFF050814),
                              Color(0xFF050814),
                            ],
                            stops: const [
                              // 0.0, // noir pur
                              // 0.35, // noir jusqu'à 35%
                              // 0.42, // transition douce vers gris
                              0.47, // milieu du gris
                              0.52, // fin du gris
                              0.58, // blanc commence
                              1.0, // blanc pur
                            ],
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 1.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomeCardWithTextAndIcon(
                                    text: 'À la une',
                                    textColor: MyColors.primaryBlack,
                                    backgroundColor: MyColors.primaryOrange,
                                    withIcon: false,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                 

                              Container(
                                margin: EdgeInsets.symmetric(vertical: 8.h),
                                child: Text(
                                  "L'Évangile au cœur de chaque foyer",
                                  style: GoogleFonts.inter(
                                    color: MyColors.primaryWhite,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Text(
                                "Prédications · Enseignements · Louange",
                                style: GoogleFonts.inter(
                                  color: MyColors.primaryOrange,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      child: CustomeCardWithTextAndIcon(
                        text: 'Regarder',
                        style: GoogleFonts.inter(
                          color: MyColors.primaryBlack,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        backgroundColor: MyColors.primaryOrange,
                        withIcon: true,
                        icon: Icons.play_arrow_outlined,
                        iconColor: MyColors.primaryBlack,
                        borderRadius: BorderRadius.circular(16.r),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  VideoPlayerScreen(),
                            ),
                          );
                        },
                      ).animate(delay: 350.ms).fadeIn(duration: 600.ms).slideY(
                    begin: 0.2,
                    end: 0,
                  ),
                    ),
                    SizedBox(width: 25.w),

                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      child: CustomeCardWithTextAndIcon(
                        text: 'Découvrir',
                        style: GoogleFonts.inter(
                          color: MyColors.primaryOrange,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        borderColor: Border.all(color: MyColors.primaryOrange),
                        backgroundColor: Colors.transparent,
                        withIcon: false,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),

              Container(
                    margin: EdgeInsets.symmetric(horizontal: 7.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: MyColors.primaryRed.withValues(alpha: 0.3),
                      border: Border.all(
                        color: MyColors.primaryRed.withValues(alpha: 0.5),
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: MyColors.primaryRed,
                              size: 10.w,
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'En direct',
                                  style: GoogleFonts.inter(
                                    color: const Color.fromARGB(
                                      255,
                                      229,
                                      11,
                                      33,
                                    ),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'Culte du Dimanche Matin',
                                  style: GoogleFonts.inter(
                                    color: MyColors.primaryWhite,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'LPDV Live — 3 241 spectateurs',
                                  style: GoogleFonts.inter(
                                    color: MyColors.primaryGray,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        CutomePlayButton().animate(delay: 350.ms).fadeIn(duration: 600.ms).slideY(
                    begin: 0.2,
                    end: 0,
                  ),
                      ],
                    ),
                  ),
                 
              SizedBox(height: 6.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  children: [
                    CustomeEventTitleCard(title: 'En ce moment'),

                    Container(
                      height: 0.2.sh,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CutomeEventCard(
                          isPlayerSection: false,
                          isEventNowSection: true,
                          isEmitionSection: false,
                          isFutureEvent: false,
                          title: 'La Puissance de la Prière',
                          description: 'Pasteur Jean Luc · Hier',
                          eventNowDuration: '43 min',
                          eventNowType: 'Prédication',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 6.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  children: [
                    CustomeEventTitleCard(title: 'Nos Émissions'),
                    Container(
                      height: 0.2.sh,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CutomeEventCard(
                          isPlayerSection: false,
                          isEventNowSection: false,
                          isEmitionSection: true,
                          isFutureEvent: false,
                          title: 'Test de parole de vie',
                          description: '129 épisodes',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  children: [
                    CustomeEventTitleCard(title: 'Concerts & Événements'),

                    Container(
                      height: 0.2.sh,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CutomeEventCard(
                          isPlayerSection: false,
                          isEventNowSection: false,
                          isEmitionSection: false,
                          isFutureEvent: true,
                          title: 'Concert de Louange 2025',
                          description: '30 Sept 2026',
                          subdescription: 'Palais de la culture',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 30),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.primaryGray),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      Assets.images.iconHome.iconPersonneFrees.path,
                      height: 24.h,
                    ),
                    SizedBox(width: 10.w),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Demande de prière',
                            style: GoogleFonts.inter(
                              color: MyColors.primaryWhite,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'Vous souhaitez partager un sujet de prière ? \nNotre équipe prie pour vous.',
                            style: GoogleFonts.inter(
                              color: MyColors.primaryGray,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 18.h),
                          CustomeCardWithTextAndIcon(
                            text: 'Envoyer une demande',
                            style: GoogleFonts.inter(
                              color: MyColors.primaryOrange,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            borderColor: Border.all(
                              color: MyColors.primaryOrange,
                            ),
                            backgroundColor: Colors.transparent,
                            withIcon: false,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 6.h,
                            ),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomeAppHeader extends StatelessWidget {
  const CustomeAppHeader({
    super.key,
     this.isHomeScreen = true
  });

  final bool isHomeScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "LPDV ",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextSpan(
                  text: "TV",
                  style: GoogleFonts.inter(
                    color: MyColors.primaryOrange,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          if (isHomeScreen)
          Row(
            children: [
              SvgPicture.asset(Assets.images.iconHome.iconSearch.path),
              SizedBox(width: 16.w),
              SvgPicture.asset(
                Assets.images.iconHome.iconNotification.path,
              ),
              SizedBox(width: 7.w),
              // Container(
              //       padding: EdgeInsets.all(5.w),
              //       decoration: BoxDecoration(
              //         color: MyColors.primaryOrange,
              //         shape: BoxShape.circle,
              //       ),
              //       child: SvgPicture.asset(
              //         assets.images.iconHome.iconHeart,
              //       ),
              //     )
              //     .animate(delay: 350.ms)
              //     .fadeIn(duration: 600.ms)
              //     .slideY(begin: 0.2, end: 0),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomeEventTitleCard extends StatelessWidget {
  const CustomeEventTitleCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              color: MyColors.primaryWhite,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              Text(
                'Tout voir',
                style: GoogleFonts.inter(
                  color: MyColors.primaryOrange,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: MyColors.primaryOrange,
                size: 17.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CutomeEventCard extends StatelessWidget {
  CutomeEventCard({
    super.key,
    this.cardborderColor,
    required this.isEventNowSection,
    this.eventNowDuration,
    this.eventNowType,
    this.title,
    this.description,
    this.subdescription,
    required this.isEmitionSection,
    required this.isFutureEvent,
    required this.isPlayerSection,
  });
  final Color? cardborderColor;
  final bool isEventNowSection;
  late String? eventNowDuration;
  late String? eventNowType;
  late String? title;
  late String? description;
  late String? subdescription;
  final bool isEmitionSection;
  final bool isFutureEvent;
  final bool isPlayerSection;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h, right: 10.w),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: cardborderColor ?? Colors.transparent),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Stack(
                children: [
                  Image.asset(
                    Assets.images.iconHome.image2.path,
                    fit: BoxFit.cover,
                    height: 0.17.sh,
                    width: 0.6.sw,
                  ),
                  Container(
                    height: 0.17.sh,
                    width: 0.6.sw,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color(0xFF050814).withValues(alpha: 0.9),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: 1.sh,
              width: 0.6.sw,
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.h),
              decoration: BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4.h),

                  if (isEventNowSection) ...[
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomeCardWithTextAndIcon(
                        text: eventNowDuration ?? '',
                        style: GoogleFonts.inter(
                          color: MyColors.primaryWhite,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        borderColor: Border.all(color: Colors.black26),
                        backgroundColor: Colors.white24,
                        withIcon: true,
                        icon: Icons.access_time_rounded,
                        iconColor: MyColors.primaryWhite,
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.w,
                          vertical: 4.h,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                        iconSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomeCardWithTextAndIcon(
                          text: eventNowType ?? '',
                          style: GoogleFonts.inter(
                            color: MyColors.primaryOrange,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          borderColor: Border.all(
                            color: MyColors.primaryOrange,
                          ),
                          backgroundColor: Colors.transparent,
                          withIcon: false,
                          padding: EdgeInsets.symmetric(
                            horizontal: 7.w,
                            vertical: 6.h,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        CutomePlayButton().animate(delay: 350.ms).fadeIn(duration: 600.ms).slideY(
                    begin: 0.2,
                    end: 0,
                  ),
                      ],
                    ),
                    SizedBox(height: 6.h),

                    Container(
                      width: 0.6.sw,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(12.r),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF050814).withValues(alpha: 0.2),
                            Color(0xFF050814).withValues(alpha: 0.3),
                            Color(0xFF050814),
                            Color(0xFF050814),
                          ],
                          stops: const [
                            0.47, // milieu du gris
                            0.52, // fin du gris
                            0.58, // blanc commence
                            1.0, // blanc pur
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title ?? '',
                            style: GoogleFonts.inter(
                              color: MyColors.primaryWhite,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            description ?? '',
                            style: GoogleFonts.inter(
                              color: Color(0xFF8A8A8A),
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],

                  if (isEmitionSection) ...[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 0.1.sh),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 3.h),
                          child: Text(
                            title ?? '',
                            style: GoogleFonts.inter(
                              color: MyColors.primaryWhite,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Text(
                          description ?? '',
                          style: GoogleFonts.inter(
                            color: MyColors.primaryOrange,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],

                  if (isFutureEvent) ...[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 0.1.sh),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 3.h),
                          child: Text(
                            title ?? '',
                            style: GoogleFonts.inter(
                              color: MyColors.primaryWhite,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: MyColors.primaryWhite,
                              size: 12.sp,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              description ?? '',
                              style: GoogleFonts.inter(
                                color: MyColors.primaryOrange,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: MyColors.primaryWhite,
                              size: 12.sp,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              subdescription ?? '',
                              style: GoogleFonts.inter(
                                color: MyColors.primaryWhite,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],

                   if (isPlayerSection) ...[
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomeCardWithTextAndIcon(
                        text: eventNowDuration ?? '',
                        style: GoogleFonts.inter(
                          color: MyColors.primaryWhite,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        borderColor: Border.all(color: Colors.black26),
                        backgroundColor: Colors.white24,
                        withIcon: true,
                        icon: Icons.access_time_rounded,
                        iconColor: MyColors.primaryWhite,
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.w,
                          vertical: 4.h,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                        iconSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: .1.sh),
               
                  

                    Container(
                      width: 0.6.sw,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(12.r),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF050814).withValues(alpha: 0.2),
                            Color(0xFF050814).withValues(alpha: 0.3),
                            Color(0xFF050814),
                            Color(0xFF050814),
                          ],
                          stops: const [
                            0.47, // milieu du gris
                            0.52, // fin du gris
                            0.58, // blanc commence
                            1.0, // blanc pur
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title ?? '',
                            style: GoogleFonts.inter(
                              color: MyColors.primaryWhite,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            description ?? '',
                            style: GoogleFonts.inter(
                              color: Color(0xFF8A8A8A),
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CutomePlayButton extends StatelessWidget {
  const CutomePlayButton({super.key, this.onTap, this.isPlaying = false});

  final VoidCallback? onTap;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: MyColors.primaryOrange,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
          color: MyColors.primaryBlack,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomeCardWithTextAndIcon extends StatelessWidget {
  CustomeCardWithTextAndIcon({
    super.key,
    required this.text,
    this.textColor,
    required this.backgroundColor,
    this.borderColor,
    this.icon,
    this.iconColor,
    this.withIcon = true,
    this.style,
    this.padding,
    this.borderRadius,
    this.iconSize,
    this.onTap,
  });

  final String text;
  late Color? textColor;
  final Color backgroundColor;
  final BoxBorder? borderColor;
  final IconData? icon;
  final Color? iconColor;
  final bool withIcon;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final double? iconSize;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: borderColor ?? Border.all(color: backgroundColor),
          borderRadius: borderRadius ?? BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (withIcon) ...[
              Icon(
                icon,
                color: iconColor ?? Colors.amber,
                size: iconSize ?? 16.sp,
              ),
              SizedBox(width: 4.w),
            ],
            Text(
              text,
              style:
                  style ??
                  GoogleFonts.inter(
                    color: textColor ?? Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
