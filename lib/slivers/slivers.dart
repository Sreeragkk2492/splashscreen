import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/slivers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Sliverex(),
  ));
}

class Sliverex extends StatelessWidget {
  const Sliverex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [

          SliverAppBar(
            floating: true,
            pinned: false,
            title: Text('sliverappbar'),
            bottom: AppBar(
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      hintText: 'search',
                      suffixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal, 
                itemBuilder: (context,int)=>Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      Expanded(child: Image.asset('assets/images/blue.jpg')),
                      Text("hii")
                    ],
                  ),
                )),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: 10,
                  (context, index) => Card(
                        child: ListTile(
                          title: Text('product'),
                          leading: Image.asset(
                            'assets/images/wall.jpg',
                          ),
                          trailing: Icon(Icons.shopify),
                        ),
                      ))),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: 10,
                (context, index) => Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/wall.jpg'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('GTA 6',style: GoogleFonts.alexandria(color: Colors.black),),
                    SizedBox(
                      height: 1,
                    ),
                    Text('\$1000')
                  ],
                ),
              )),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),

        
        ],
      )),
    );
  }
}
