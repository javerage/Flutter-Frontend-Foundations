import 'package:flutter/material.dart';
import 'stat_item.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Expanded(
          child: StatItem(
            label: 'Publicaciones',
            value: '536',
            icon: Icons.edit_square,
          ),
        ),
        Expanded(
          child: StatItem(
            label: 'Seguidores',
            value: '5790',
            icon: Icons.people_alt,
          ),
        ),
        Expanded(
          child: StatItem(
            label: 'Seguidos',
            value: '10',
            icon: Icons.person_add,
          ),
        ),
      ],
    );
  }
}
