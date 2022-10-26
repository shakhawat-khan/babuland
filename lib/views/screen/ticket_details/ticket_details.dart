import 'package:babuland/controllers/ticket_details_controller.dart';
import 'package:babuland/models/ticket_details_model.dart';
import 'package:babuland/util/style.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketDetails extends StatelessWidget {
  final order_id;
  final date;

  TicketDetails({required this.order_id, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Tickets',
          style: kinterAppbarTitle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              child: FutureBuilder<TicketDetailsModel>(
            future: getTicketDetailsData(order_id),
            builder: (context, snapshot) {
              final data = snapshot.data;
              if (snapshot.hasData) {
                return buildTicketDetails(data!, context);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return Center(child: const CircularProgressIndicator());
            },
          )),
        ),
      ),
    );
  }

  Widget buildTicketDetails(
      TicketDetailsModel ticketDetailsModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Color(0xFFf7eca6)),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: 5,
                    color: Theme.of(context).primaryColor,
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: 5,
                      color: Colors.blue,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      height: 5,
                      width: MediaQuery.of(context).size.width / 1.6,
                      color: Colors.green,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 5,
                      width: MediaQuery.of(context).size.width / 2.7,
                      color: Colors.red,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      height: 5,
                      width: MediaQuery.of(context).size.width / 2.7,
                      color: Colors.purple,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 5,
                      width: MediaQuery.of(context).size.width / 1.6,
                      color: Colors.pink,
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 20,
                    child: Image.asset(
                      'assets/tickets/babuland_logo.png',
                    ),
                  ),
                  Positioned(
                    left: 40,
                    top: 60,
                    child: Text(
                      'Uttara',
                      style: kpopinsTicketBranch,
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 85,
                    child: Container(
                      height: 2,
                      width: 70,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Positioned(
                    left: 45,
                    top: 90,
                    child: Text(
                      'Wari',
                      style: kpopinsTicketBranch,
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 115,
                    child: Container(
                      height: 2,
                      width: 70,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Positioned(
                    left: 40,
                    top: 120,
                    child: Text(
                      'Badda',
                      style: kpopinsTicketBranch,
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 145,
                    child: Container(
                      height: 2,
                      width: 70,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Positioned(
                    left: 43,
                    top: 150,
                    child: Text(
                      'Mirpur',
                      style: kpopinsTicketBranch,
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 175,
                    child: Container(
                      height: 2,
                      width: 70,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Positioned(
                    right: 70,
                    top: 20,
                    child: Text(
                      'Child Ticket',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Positioned(
                    right: 76,
                    top: 50,
                    child: Text(
                      'SL NO: ' + ticketDetailsModel.items![0].pk.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                  ),
                  Positioned(
                    right: 85,
                    top: 95,
                    child: Text(
                      'Quantity: 2',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Positioned(
                      right: 85,
                      top: 125,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 100,
                        child: Text(
                          'Price: 0৳',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 17),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      )),
                  Positioned(
                    left: 90,
                    top: 10,
                    bottom: 10,
                    child: Container(
                      decoration: DottedDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        strokeWidth: 3.5,
                        linePosition: LinePosition.right,
                      ),
                      height: MediaQuery.of(context).size.height,
                      width: 50,
                    ),
                  )
                ],
              ),
              Container(
                //decoration: BoxDecoration(color: Colors.blue),
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).size.height / 3.9 -
                    100,
                width: MediaQuery.of(context).size.width,
              )
            ],
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                      top: 20,
                      left: MediaQuery.of(context).size.width / 4,
                      child: Text(
                        'Scan QR code to avail ticket',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                  Positioned(
                    top: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order ID',
                            style: kpopinsTicketBranch,
                          ),
                          Text(
                            ticketDetailsModel.items![0].pk.toString(),
                            style: kpopinsTicketID,
                          ),
                          Text(
                            'Ticket Purchase Date',
                            style: kpopinsTicketBranch,
                          ),
                          Text(
                            date,
                            style: kpopinsTicketID,
                          ),
                          Text(
                            'Ticket Expire Date',
                            style: kpopinsTicketBranch,
                          ),
                          Text(
                            'None',
                            style: kpopinsTicketID,
                          ),
                          Text(
                            'Ticket Price',
                            style: kpopinsTicketBranch,
                          ),
                          Text(
                            '0৳',
                            style: kpopinsTicketID,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 30,
                    top: 50,
                    child: QrImage(
                      data: ticketDetailsModel.items![0].pk.toString(),
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
