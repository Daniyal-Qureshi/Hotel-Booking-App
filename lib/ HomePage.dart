import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Hotel.dart';
import 'Info.dart';
import 'Login.dart';

class HomePage extends StatelessWidget {
  Info pearl, crown, mehran, excelsior, movenpick;

  @override
  Widget build(BuildContext context) {
    pearl = new Info(
        "PEARL-CONTINENTAL HOTEL",
        "Gulshan e Iqbal Phase 2 Karachi",
        "Overlooking the sprawling city, Pearl-Continental Hotel is a part of the most significant chain of hotels in Pakistan. \n\nThe Hotel is perfect for both business and leisure travellers. Guests can choose from a variety of rooms and suites to enjoy their stay at the five-star hotel.",
        "1.jpg",
        3000);

    crown = new Info(
        "HOTEL CROWN INN",
        "Surjani town near Safari Park Karachi",
        "Offering a sun terrace and views of the city. Free WiFi Is available throughout the property." +
            "\n\nAll rooms have a flat-screen TV. Some units feature a seating area for your convenience. Each room comes with a private bathroom. Extras include bath robes, slippers and free toiletries.",
        "2.jpg",
        5000);
    mehran = new Info(
        "HOTEL MEHRAN",
        "Shahra e Faisal Karachi",
        "Our Kanwal Restaurant offers buffet breakfast, luncheon, Hi-Tea, Dinner and Ala Cart’e includes traditional and International cuisine.\n\n Our open air Bar be Que Restaurant offers a vast variety of delicious Pakistani and International cuisine.",
        "3.jpg",
        4000);

    excelsior = new Info(
        "HOTEL EXCELSIOR",
        "Sarwar Shaheed Road  Karachi ",
        "Among the facilities of this property are a restaurant, a 24-hour front desk and room service, along with free WiFi. The hotel has family rooms \n\n" +
            "The rooms are fitted with air conditioning, a flat-screen TV with cable channels, a fridge, a kettle, a shower, free toiletries and a desk.",
        "4.jpg",
        4000);

    movenpick = new Info(
        "MOVENPICK HOTEL",
        " Jinnah International Airport Karachi",
        "Mövenpick Hotel Karachi is a five-star destination for business, dining and recreation.\n\nBusiness travellers can make use of our extensive conference and event facilities for up to 1,000 people. Kemari Harbour and Karachi's nearby beaches are leisure highlights and there is easy access to local shopping and sightseeing destinations.",
        "5.jpg",
        6000);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //pearl
            Padding(padding: EdgeInsets.all(5)),

            new InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Hotel(info: pearl)));
                },
                child: Container(
                  padding: EdgeInsets.all(2),
                  height: 120,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/1.jpg"),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                pearl.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(children: [
                                Icon(
                                  Icons.location_on,
                                  size: 15,
                                ),
                                Text(
                                  pearl.location,
                                  style: TextStyle(fontSize: 10),
                                )
                              ])
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                )),

            //crown

            new InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Hotel(info: crown)));
                },
                child: Container(
                  padding: EdgeInsets.all(2),
                  height: 120,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/2.jpg"),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    crown.name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                              Row(children: [
                                Icon(
                                  Icons.location_on,
                                  size: 15,
                                ),
                                Flexible(
                                    child: Text(
                                  crown.location,
                                  style: TextStyle(fontSize: 10),
                                ))
                              ])
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                )),
//mehran
            new InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Hotel(info: mehran)));
                },
                child: Container(
                  padding: EdgeInsets.all(2),
                  height: 120,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/3.jpg"),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    mehran.name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                              Row(children: [
                                Icon(
                                  Icons.location_on,
                                  size: 15,
                                ),
                                Flexible(
                                    child: Text(
                                  mehran.location,
                                  style: TextStyle(fontSize: 10),
                                ))
                              ])
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                )),
            //execlsior
            new InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Hotel(info: excelsior)));
                },
                child: Container(
                  padding: EdgeInsets.all(2),
                  height: 120,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/4.jpg"),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    excelsior.name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                              Row(children: [
                                Icon(
                                  Icons.location_on,
                                  size: 15,
                                ),
                                Flexible(
                                    child: Text(
                                  excelsior.location,
                                  style: TextStyle(fontSize: 10),
                                ))
                              ])
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                )),

            new InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Hotel(info: movenpick)));
                },
                child: Container(
                  padding: EdgeInsets.all(2),
                  height: 120,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/5.jpg",
                        ),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    movenpick.name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                              Row(children: [
                                Icon(
                                  Icons.location_on,
                                  size: 15,
                                ),
                                Flexible(
                                    child: Text(
                                  movenpick.location,
                                  style: TextStyle(fontSize: 10),
                                ))
                              ])
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
