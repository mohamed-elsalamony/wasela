import 'package:flutter/material.dart';
import 'package:team_projects/core/resources/navigators.dart';
import 'package:team_projects/core/widgets/reservation_card.dart';
import 'package:team_projects/ui/shared/chat/chat_screen.dart';

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
        return InkWell(
          onTap: () {
            // TODO: firebase
            /// move the request form new list to Accepted list
            ///when naviagte to chat, must be with different data

            Navigators.naviagteTo(context, ChatScreen());
          },
          child: ReservationCard(
            status: Status.Accepted,
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
