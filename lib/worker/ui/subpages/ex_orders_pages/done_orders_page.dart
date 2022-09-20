import 'package:flutter/material.dart';
import 'package:team_projects/core/widgets/reservation_card.dart';


class DoneOrderPage extends StatelessWidget {
  const DoneOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {

        // TODO: firebase
        /// here, display the data of precedent reservation
        return ReservationCard(
          status: Status.Done,
          progress: 'Car Waching',
          date: '20 Oct, 2022',
          address: 'Mansoura, 12 street',
          price: 90,
        );
      },
    );
  }
}