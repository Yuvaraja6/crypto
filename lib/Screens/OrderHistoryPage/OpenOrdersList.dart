import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:flutter/material.dart';

class OpenOrdersList extends StatefulWidget {
  const OpenOrdersList({Key? key}) : super(key: key);

  @override
  State<OpenOrdersList> createState() => _OpenOrdersListState();
}

class _OpenOrdersListState extends State<OpenOrdersList> {
  List openOrders = [
    {
      "status": "In-Active",
      "date": "08/06/2021",
      "price": 0.0002131,
      "total": 0.123312,
      "sentAddress": "0x21390jqjw012j1200wje1io232oen1o2i",
      "fees": 0.1,
      "amount": 0.2132,
      "transactionID": "231kawOKawe123PK32"
    },
    {
      "status": "Active",
      "date": "08/06/2021",
      "price": 0.0002131,
      "total": 0.123312,
      "sentAddress": "0x21390jqjw012j1200wje1io232oen1o2i",
      "fees": 0.1,
      "amount": 0.2132,
      "transactionID": "231kawOKawe123PK32"
    },
    {
      "status": "Partially filled",
      "date": "08/06/2021",
      "price": 0.0002131,
      "total": 0.123312,
      "sentAddress": "0x21390jqjw012j1200wje1io232oen1o2i",
      "fees": 0.1,
      "amount": 0.2132,
      "transactionID": "231kawOKawe123PK32"
    },
    {
      "status": "Active",
      "date": "08/06/2021",
      "price": 0.0002131,
      "total": 0.123312,
      "sentAddress": "0x21390jqjw012j1200wje1io232oen1o2i",
      "fees": 0.1,
      "amount": 0.2132,
      "transactionID": "231kawOKawe123PK32"
    },
    {
      "status": "In-Active",
      "date": "08/06/2021",
      "price": 0.0002131,
      "total": 0.123312,
      "sentAddress": "0x21390jqjw012j1200wje1io232oen1o2i",
      "fees": 0.1,
      "amount": 0.2132,
      "transactionID": "231kawOKawe123PK32"
    },
    {
      "status": "Partially filled",
      "date": "08/06/2021",
      "price": 0.0002131,
      "total": 0.123312,
      "sentAddress": "0x21390jqjw012j1200wje1io232oen1o2i",
      "fees": 0.1,
      "amount": 0.2132,
      "transactionID": "231kawOKawe123PK32"
    },
    {
      "status": "In-Active",
      "date": "08/06/2021",
      "price": 0.0002131,
      "total": 0.123312,
      "sentAddress": "0x21390jqjw012j1200wje1io232oen1o2i",
      "fees": 0.1,
      "amount": 0.2132,
      "transactionID": "231kawOKawe123PK32"
    },
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: openOrders.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText('Status: '),
                                CustomText(
                                  openOrders[index]['status'],
                                  color:
                                      openOrders[index]['status'] == "In-Active"
                                          ? Colors.red
                                          : Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            CustomText(
                              openOrders[index]['date'],
                              color: CommonColors().grey,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomText(
                                  openOrders[index]['price'].toString(),
                                  fontWeight: FontWeight.w500,
                                ),
                                CustomText(
                                  openOrders[index]['total'].toString(),
                                  color: CommonColors().grey,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (selectedIndex == index) {
                                  setState(() {
                                    selectedIndex = null;
                                  });
                                } else {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: CommonColors().grey.withOpacity(0.3),
                                    shape: BoxShape.circle),
                                child: selectedIndex == index
                                    ? Icon(
                                        Icons.keyboard_arrow_up,
                                        color: CommonColors().black,
                                      )
                                    : Icon(
                                        Icons.keyboard_arrow_down,
                                        color: CommonColors().black,
                                      ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    index == selectedIndex
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(),
                              CustomText(
                                'Sent Address:',
                                color: CommonColors().grey,
                              ),
                              CustomText(
                                openOrders[index]['sentAddress'],
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                'Fees:',
                                color: CommonColors().grey,
                              ),
                              CustomText(
                                openOrders[index]['fees'].toString(),
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                'Transaction ID:',
                                color: CommonColors().grey,
                              ),
                              CustomText(
                                openOrders[index]['transactionID'],
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
