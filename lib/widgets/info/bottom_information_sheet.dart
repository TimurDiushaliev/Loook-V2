import 'package:flutter/material.dart';

class BottomInformationSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.6,
        builder: (context, scrollContoller) {
          return Container(
            child: ListView.builder(
              itemCount: 1,
              controller: scrollContoller,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Divider(
                      height: 25,
                      thickness: 3,
                      color: Colors.grey[600],
                      indent: 150,
                      endIndent: 150,
                    ),
                    Text(
                      'Часы за 200 KGS',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Text(
                      'Измеряя время солнечными часами,  основываются на том, что Солнце отбрасывает тень от предметов, и его путь по небу одинаков в одинаковые дни разных лет. Используя расчерченный круг для измерения времени, в астрономии  — эталон хранителя (циферблат) и поправки на широту местности, можно оценить, который сейчас час. Старейшими обнаруженными солнечными часами является разметка солнечных часов обнаруженных в Долине Царей  — большой группе усыпальниц Египта.[1]',
                      style: TextStyle(
                          fontWeight: FontWeight.w300, letterSpacing: 3),
                    ),
                  ],
                );
              },
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
          );
        });
  }
}
