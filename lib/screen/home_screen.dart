import 'package:flutter/material.dart';
import 'package:flutter_application/data/dummy_data.dart';
import 'package:flutter_application/models/flower.dart';
import 'package:flutter_application/screen/detail_screen.dart';
import 'package:flutter_application/widgets/flower_card.dart';
import 'package:flutter_application/widgets/home_content_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _query = '';
  String _selectedCategory = 'Semua';

  // method getter
  List<String> get _categories {
    final unique = <String>{'Semua', ...dummyFlowers.map((f) => f.category)};
    return unique.toList();
  }

  List<Flower> get _filteredFlowers {
    return dummyFlowers.where((flower) {
      final matchesQuery = flower.name.toLowerCase().contains(
        _query.toLowerCase(),
      );
      final matcheCategory =
          _selectedCategory == 'semua' || flower.category == _selectedCategory;
      return matchesQuery && matcheCategory;
    }).toList();
  }

  void _openDetail(Flower flower) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => DetailScreen(flower: flower)));
  }

  @override
  Widget build(BuildContext context) {
    final flowers = _filteredFlowers;

    //CustomScrollView membutuhkan adaptor berupa slivers (karena CSV tidak mau menerima widgets secara langsung)
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HomeContentHeader(
              selectedCategory: _selectedCategory,
              categories: _categories,
              onQueryChanged: (value) => setState(() => _query = value),
              onCaterogySelected: (value) =>
                  setState(() => _selectedCategory = value),
            ),
          ),

          if (flowers.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: Text('Bunga Tidak Ditemukan')),
            )
          else
            SliverPadding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 100),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.68,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => FlowerCard(
                    flower: flowers[index],
                    onTap: () => _openDetail(flowers[index]),
                  ),
                  childCount: flowers.length,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
