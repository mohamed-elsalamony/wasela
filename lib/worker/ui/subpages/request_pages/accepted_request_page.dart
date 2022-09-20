import 'package:flutter/material.dart';
import 'package:team_projects/core/widgets/reservation_card.dart';


class AcceptedOrderPage extends StatelessWidget {
  const AcceptedOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {

        // TODO: firebase
        /// here, display the data of precedent reservation
        return ReservationCard(
          status: Status.Accepted,
          progress: 'Car Waching',
          date: '20 Oct, 2022',
          address: 'Mansoura, 12 street',
          price: 90,
        );
      },
    );
  }
}