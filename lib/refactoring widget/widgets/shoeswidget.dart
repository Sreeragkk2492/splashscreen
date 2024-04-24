import 'package:flutter/material.dart';

class Shoeswidget extends StatefulWidget {
  final ImageProvider leadinimage;
  final String title;
   
  final String subtitle;
  Color? bgcolor;
  
 

  Shoeswidget(
      {super.key,
      required this.leadinimage,
    required this.title,
      required this.subtitle,
      this.bgcolor});

  @override
  State<Shoeswidget> createState() => _ShoeswidgetState();
}

class _ShoeswidgetState extends State<Shoeswidget> {
  int count = 0;
  
   

  @override
  Widget build(BuildContext context) {
   
    return Container(
      //height: 200,
      child: Card(
        color: widget.bgcolor,
        child: ListTile(
            leading: CircleAvatar(
              backgroundImage: widget.leadinimage,
            ),
           title: Text(widget.title),
            subtitle: Text(widget.subtitle),
            trailing: SizedBox(
              height: 200,
              child: Column(
                //  mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          count++;
                        });
                      },
                      child: Icon(
                        Icons.add,
                        size: 15,
                      )),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    count.toString(),
                    style: TextStyle(fontSize: 15, color: Colors.red),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (count == 0) {
                        } else {
                          count--;
                        }
                      });
                    },
                    child: Icon(
                      Icons.minimize,
                      size: 15,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
