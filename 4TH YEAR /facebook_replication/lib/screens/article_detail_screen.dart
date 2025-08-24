import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../models/article_model.dart';
import '../widgets/custom_text.dart';
import '../providers/theme_provider.dart';

class ArticleDetailScreen extends StatelessWidget {
  final Article article;

  const ArticleDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final themeModel = context.watch<ThemeProvider>();
    final isDark = themeModel.isDark;

    return Scaffold(
      backgroundColor: isDark
          ? Colors.grey[900]
          : Colors.white, // White background for light mode
      body: CustomScrollView(
        slivers: [
          // Custom App Bar
          SliverAppBar(
            expandedHeight: 200.h,
            floating: false,
            pinned: true,
            backgroundColor: isDark
                ? Colors.grey[900]
                : Colors.white, // White app bar for light mode
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: isDark ? Colors.white : Colors.black87,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: isDark
                        ? [Colors.grey[900]!, Colors.grey[900]!]
                        : [Colors.white, Colors.white],
                  ),
                ),
                child: Stack(
                  children: [
                    // Decorative elements
                    Positioned(
                      top: 80.h,
                      right: 30.w,
                      child: Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.purple.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120.h,
                      left: 20.w,
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: Colors.orange.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    // Main illustration area
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 60.h),
                          // Article illustration using intern.png
                          Container(
                            width: 120.w,
                            height: 110.h,
                            decoration: BoxDecoration(
                              color: isDark
                                  ? Colors.grey[800]
                                  : Colors.white.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(60.r),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60.r),
                              child: Image.asset(
                                'lib/assets/images/intern.png',
                                width: 120.w,
                                height: 110.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 0.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Content
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Article Content Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(24.w),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey[800] : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        CustomText(
                          text: article.title,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black87,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 20.h),

                        // Body content
                        CustomText(
                          text: article.body,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: isDark ? Colors.grey[300] : Colors.black87,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 30.h),

                        // Action buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildActionButton(
                              icon: Icons.thumb_up_outlined,
                              label: 'Like',
                              isDark: isDark,
                              onTap: () {
                                // TODO: Implement like functionality
                              },
                            ),
                            _buildActionButton(
                              icon: Icons.comment_outlined,
                              label: 'Comment',
                              isDark: isDark,
                              onTap: () {
                                // TODO: Implement comment functionality
                              },
                            ),
                            _buildActionButton(
                              icon: Icons.share_outlined,
                              label: 'Share',
                              isDark: isDark,
                              onTap: () {
                                // TODO: Implement share functionality
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: isDark ? Colors.grey[600]! : Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20.sp,
              color: isDark ? Colors.white : Colors.black87,
            ),
            SizedBox(width: 8.w),
            CustomText(
              text: label,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}
