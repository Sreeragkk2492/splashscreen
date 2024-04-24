import 'package:flutter/material.dart';
import 'package:splashscreen/newsapp/newsmodel.dart';


 final List<News> news = [
    News(
        title:
            'The Morning After: Robot dog maker Boston Dynamics has a new owner',
        details: 'Engadget',
        imageurl: 'assets/images/blue.jpg'),
          News(
        title:
            'Gillmor Gang: Who Knew',
        details: 'TechCrunch',
        imageurl: 'assets/images/blue.jpg'),
          News(
        title:
            'Transmit Security raises \$543M Series A to kill off the password',
        details: 'TechCrunch',
        imageurl: 'assets/images/blue.jpg'),
          News(
        title:
            'Antitrust:Business Updates: Google Draws E.UAntitrust Inquiry',
        details: 'New York Times',
        imageurl: 'assets/images/blue.jpg'),
          News(
        title:
            'Prime members can save over £200 on the Apple iPad Pro',
        details: 'Mashable',
        imageurl: 'assets/images/blue.jpg'),
            News(
        title:
            'This Apple Watch Series 6 is on sale at Walmart for only \$279 (!) this Prime Day',
        details: 'Mashable',
        imageurl: 'assets/images/blue.jpg'),
        
            News(
        title:
            'The Apple Watch Series 6 is on sale for £50 off this Prime Day',
        details: 'Mashable',
        imageurl: 'assets/images/blue.jpg'),
        
  ];

class Newsprovider extends ChangeNotifier{
  final List<News> _news=news;
  

  
  

  




} 