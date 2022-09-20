import 'package:flutter/material.dart';
import 'package:team_projects/core/resources/navigators.dart';
import 'package:team_projects/core/widgets/reservation_card.dart';
import 'package:team_projects/worker/ui/subpages/request_pages/accepting_request_page.dart';


class NewOrderPage extends StatelessWidget {
  const NewOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        // TODO: firebase
        /// here, display the data of precedent reservation
        return InkWell(
          onTap: () => Navigators.naviagteTo(context, AcceptingRequestPage()),
          child: ReservationCard(
            status: Status.New,
            progress: 'Car Waching',
            date: '20 Oct, 2022',
            address: 'Mansoura, 12 street',
            price: 90,
          ),
        );
      },
    );
  }
}
