import 'package:flutter/material.dart';
import 'package:flutter_application/data/dummy_data.dart';
import 'package:flutter_application/screen/detail_screen.dart';
import 'package:flutter_application/state/favorites_controller.dart';
import 'package:flutter_application/theme/app_theme.dart';
import 'package:flutter_application/widgets/flower_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                    child: Text('Favorite', style: AppTheme.display(fontSize: 24)),
                ),
                Expanded(
                    child: ValueListenableBuilder<Set<String>>(
                        valueListenable: FavoritesController.instance,
                        builder: (context,favoriteIds, _) {
                            final favoriteFlowers = dummyFlowers
                                .where((flower) => favoriteIds.contains(flower.id))
                                .toList();

                            if (favoriteFlowers.isEmpty) {
                              return const Placeholder(); // class empty fav state
                            }

                            return GridView.builder(
                                padding: EdgeInsets.fromLTRB(20, 4, 20, 100),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 16,
                                    crossAxisSpacing: 16,
                                    childAspectRatio: 0.68
                                ),
                                itemCount: favoriteFlowers.length,
                                itemBuilder: (context, index) {
                                    final flower = favoriteFlowers[index];
                                    return FlowerCard(
                                        flower: flower, 
                                        onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(builder: (_) => DetailScreen(flower: flower))
                                            );
                                        },
                                    );
                                },
                            );
                        },
                    ),
                )
            ],
        ),
    );
  }
}