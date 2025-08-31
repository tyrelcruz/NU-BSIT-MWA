import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/custom_text.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModel = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: CustomText(
          text: 'Settings',
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          fontFamily: null,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.w),
        children: [
          // Settings Header
          SizedBox(height: 10.h),

          // Appearance Section
          _buildSectionHeader('Appearance'),

          // Dark Mode Setting
          _buildSettingTile(
            icon: Icons.dark_mode,
            title: 'Dark Mode',
            subtitle: 'Switch between light and dark theme',
            trailing: Switch(
              value: themeModel.isDark,
              onChanged: (_) => themeModel.toggleTheme(),
              activeColor: Colors.blue[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h, top: 8.h),
      child: CustomText(
        text: title,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        fontFamily: null,
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.only(bottom: 8.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(icon, color: Colors.blue[700], size: 20.sp),
        ),
        title: CustomText(
          text: title,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: null,
        ),
        subtitle: CustomText(
          text: subtitle,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          fontFamily: null,
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
