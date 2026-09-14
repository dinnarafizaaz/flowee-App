import 'package:flutter/material.dart';
import 'package:flutter_application/data/dummy_data.dart';
import 'package:flutter_application/theme/app_theme.dart';
import 'package:flutter_application/widgets/banner_carousel.dart';
import 'package:flutter_application/widgets/category_chip_list.dart';
import 'package:flutter_application/widgets/home_header.dart';
import 'package:flutter_application/widgets/profile_sheet.dart';
import 'package:flutter_application/widgets/search_field.dart';

class HomeContentHeader extends StatelessWidget {
  const HomeContentHeader({
    super.key,
    required this.selectedCategory,
    required this.category,
    required this.onQueryChanged,
    required this.onCaterogySelected,
  });

  final String selectedCategory;
  final List<String> category;
  final ValueChanged<String> onQueryChanged;
  final ValueChanged<String> onCaterogySelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(20, 12, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(onProfileTap: () => showProfileSheet(context)),
          SizedBox(height: 18),
          BannerCarousel(banners: dummyBanners),
          SizedBox(height: 20),
          SearchField(onChanged: onQueryChanged),
          SizedBox(height: 18), 
          CategoryChipList(
            categories: category, 
            selectedCategory: selectedCategory, 
            onSelected: onCaterogySelected
          ),
          SizedBox(height: 22),
          Text(
            'rekomendasi untukmu',
            style: AppTheme.display(fontSize: 18),
          ),
          SizedBox(height: 14),
        ],
      ),
    );
  }
}
