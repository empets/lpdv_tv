import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lpdv_tv/core/app_color/app_color.dart';
import 'package:lpdv_tv/feature/home/presentation/page/home_screen.dart';
import 'package:lpdv_tv/gen/assets.gen.dart';

class ViewMoreScreen extends StatefulWidget {
  const ViewMoreScreen({super.key});

  @override
  State<ViewMoreScreen> createState() => _ViewMoreScreenState();
}

class _ViewMoreScreenState extends State<ViewMoreScreen> {


  List<Map<String, dynamic>> _getRecentSearches() => [
   {'title': 'Émissions', 'subTitle': 'Tous nos programmes', 'icon': Assets.images.iconPlus.iconPlayeVideo.path},
   {'title': 'Concerts & Événements', 'subTitle': 'Agenda et billetterie', 'icon': Assets.images.iconPlus.iconCalendar},
   {'title': 'Librairie', 'subTitle': 'Livres, CD, DVD', 'icon': Assets.images.iconPlus.iconLibrayrie},
   {'title': 'Intervenants', 'subTitle': 'Nos pasteurs et enseignants', 'icon': Assets.images.iconPlus.iconIntervenant},
   {'title': 'Églises', 'subTitle': 'Trouver une église', 'icon': Assets.images.iconPlus.iconChurch},
   {'title': 'Faire un don', 'subTitle': 'Soutenir la mission', 'icon': Assets.images.iconPlus.iconGift},
   {'title': 'Demande de prière', 'subTitle': 'Nous confier vos besoins', 'icon': Assets.images.iconPlus.iconDemandePriere},
   {'title': 'Devenir partenaire', 'subTitle': 'S\'engager avec nous', 'icon': Assets.images.iconPlus.iconPartenaire},
  ];






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryBlue,
      body: SafeArea(
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomeAppHeader(),

              SizedBox(height: 20.h),

              ...List.generate(_getRecentSearches().length, (index) {
                final item = _getRecentSearches()[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 9.w, vertical: 5.h),
                  padding: EdgeInsets.all(14.w),
                  decoration: BoxDecoration(
                    color: Color(0xFF131216),
                    borderRadius: BorderRadius.circular(17.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(15.w),
                            decoration: BoxDecoration(
                              color: MyColors.secondaryblue,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: index != 0 ? SvgPicture.asset(
                            item['icon'],
                            ) : Image.asset(
                                 Assets.images.iconPlus.iconPlayeVideo.path,
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                               item['title'],
                                style: GoogleFonts.inter(
                                  color: MyColors.primaryWhite,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                item['subTitle'],
                                style: GoogleFonts.inter(
                                  color: MyColors.primaryGray,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  
                      Icon(Icons.arrow_forward_ios_rounded,size: 18.w,  color: MyColors.primaryGray,fontWeight: FontWeight.w600,)
                    ],
                  ),
                );
              }),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 9.w, vertical: 5.h),
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: Color(0xFF131216),
                  borderRadius: BorderRadius.circular(17.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15.w),
                          decoration: BoxDecoration(
                            color: MyColors.secondaryblue,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: SvgPicture.asset(
                            Assets.images.iconPlus.iconCalendar,
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "L'Évangile au cœur de chaqu",
                              style: GoogleFonts.inter(
                                color: MyColors.primaryWhite,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Prédications · Enseignements",
                              style: GoogleFonts.inter(
                                color: MyColors.primaryGray,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                
                    Icon(Icons.arrow_forward_ios_rounded,size: 18.w,  color: MyColors.primaryGray,fontWeight: FontWeight.w600,)
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
