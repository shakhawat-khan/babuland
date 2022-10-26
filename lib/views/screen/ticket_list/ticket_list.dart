import 'package:babuland/controllers/tickets_controller.dart';
import 'package:babuland/util/style.dart';
import 'package:babuland/views/screen/ticket_details/ticket_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/tickets_model.dart';

class TicketList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Exit App'),
              content: Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  //return false when click on "NO"
                  child: Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => SystemNavigator.pop(),
                  //return true when click on "Yes"
                  child: Text('Yes'),
                ),
              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Tickets',
                  style: kinterAppbarTitle,
                )
                //TicketData()
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
                child: FutureBuilder<TicketModel>(
              future: getTicketData(),
              builder: (context, snapshot) {
                final data = snapshot.data;
                if (snapshot.hasData) {
                  return buildTicket(data!, context);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return Center(child: const CircularProgressIndicator());
              },
            )),
          )),
    );
  }

  Widget buildTicket(TicketModel ticketModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: ticketModel.items?.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: 2,
                        color: Colors.orange,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 2,
                        color: Colors.green,
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 2,
                          color: Colors.red,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          width: 2,
                          height: MediaQuery.of(context).size.height / 4,
                          color: Colors.blue,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 9),
                                height: 70,
                                child: CircleAvatar(
                                    radius: 28,
                                    child: Image.asset(
                                        'assets/tickets/babuland_logo.png')),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 19,
                                  ),
                                  Text(
                                    'This is your Entry Ticket',
                                    style: kpopinsCardTitle,
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'Order ID : ' +
                                        ticketModel.items![index].pk.toString(),
                                    style: kpopinsOrderTitle,
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'Ticket Price : 700tk',
                                    style: kpopinsPriceTitle,
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Container(
                                    height: 35,
                                    width: 117,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TicketDetails(
                                                      order_id: ticketModel
                                                          .items![index].pk
                                                          .toString(),
                                                      date: ticketModel
                                                          .items![index]
                                                          .sellDate
                                                          .toString(),
                                                    )),
                                          );
                                        },
                                        child: Text(
                                          'Active',
                                          style: kpopinsButtonTitle,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                ],
                              ),
                              Container(
                                  padding: EdgeInsets.only(top: 9),
                                  height: 70,
                                  child: Image.asset('assets/tickets/qr.png')),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Purchase Date ' +
                                      ticketModel.items![index].sellDate
                                          .toString(),
                                  style: kpopinsPriceTitle,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_outlined,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 22,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
