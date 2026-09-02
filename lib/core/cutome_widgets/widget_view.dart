

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliver_tools/sliver_tools.dart';





/// AppBar personnalisée avec bouton retour et icônes d'actions
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppBar({
//     super.key,
//     this.onBackPressed,
//     this.onSearchPressed,
//     this.onNotificationPressed,
//     this.onHelpPressed,
//     this.onProfilePressed,
//     this.showNotificationBadge = false,
//   });
//   final VoidCallback? onBackPressed;
//   final VoidCallback? onSearchPressed;
//   final VoidCallback? onNotificationPressed;
//   final VoidCallback? onHelpPressed;
//   final VoidCallback? onProfilePressed;
//   final bool showNotificationBadge;

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: 0,
//       leading: CustomLeading(
//         onBackPressed: onBackPressed,
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }

/// Widget personnalisé pour afficher une vue avec un arrière-plan du home
class HomeScaffoldOverView extends StatefulWidget {
  const HomeScaffoldOverView({
    super.key,
    required this.sliverList,
    this.showBackground = true,
  });

  final List<Widget> sliverList;
  final bool showBackground;

  @override
  State<HomeScaffoldOverView> createState() => _HomeScaffoldOverViewState();
}

class _HomeScaffoldOverViewState extends State<HomeScaffoldOverView> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverStack(
          children: [
            // if (widget.showBackground)
              SliverToBoxAdapter(
                child: Container(
                  height: 1.sh,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.black,
                        Colors.grey.shade600,
                        Colors.grey.shade400.withValues(alpha: 0.5),
                        Colors.grey.shade200.withValues(alpha: 0.3),
                        Colors.white,
                        Colors.white,
                      ],
                      stops: const [
                        0.0, // noir pur
                        0.35, // noir jusqu'à 35%
                        0.42, // transition douce vers gris
                        0.47, // milieu du gris
                        0.52, // fin du gris
                        0.58, // blanc commence
                        1.0, // blanc pur
                      ],
                    ),
                  ),
                ),
              ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              sliver: SliverMainAxisGroup(
                slivers: [
                  ...widget.sliverList.map(
                    (e) => e,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Widget personnalisé pour afficher un indicateur de rafraîchissement
class CustomRefreshIndicator extends StatelessWidget {
  const CustomRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
    this.color = Colors.blue,
    this.icon = Icons.refresh,
  });
  final Future<void> Function() onRefresh;
  final Widget child;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: color,
      backgroundColor: Colors.white,
      displacement: 40,
      strokeWidth: 3,
      onRefresh: onRefresh,
      child: child,
    );
  }
}




/// Widget personnalisé pour afficher un texte avec une icône dans un conteneur
//ignore: must_be_immutable
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

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Icon(icon, color: iconColor ?? Colors.amber),
            SizedBox(width: 4.w),
          ],
          Text(
            text,
            style: style ?? GoogleFonts.inter(
              color: textColor?? Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
