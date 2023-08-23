import 'package:flutter/material.dart';
import 'models/user.dart';

class UserDetail extends StatelessWidget{
  final User user;

  const UserDetail({Key? key,required this.user}) : super(key:key);

  Widget userPersonal(){
    return Card(
      color: Color.fromARGB(255, 225, 173, 251),
      //  child: Column(
      //     children: <Widget>[
        child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(user.name,
                  style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 40,
                  fontWeight: FontWeight.bold)
                  ),
                  ),
            
            Center(
             child: Icon(Icons.account_box_rounded,
            size: 100,
            color: Colors.white,)
            ) ,

            Text("username: "+user.username+" email: "+user.email,
            style: const TextStyle(color: Colors.white,
            fontSize: 17),
            )
          ],
        ),
      ),
           
      // child: Padding(
      //   padding: const EdgeInsets.all(10.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: <Widget>[
      //       Text(user.name,
      //             style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 20,fontWeight: FontWeight.bold)),
              
      //     ],
      //   ),
      // ),
    );

  }
   Widget userPhone(){
    return Card(
      color: Color.fromARGB(255, 200, 91, 255),
      //  child: Column(
      //     children: <Widget>[
        child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Phone: "+user.phone,
            style: const TextStyle(color: Colors.white,
            fontSize: 17),
            )
          ],
        ),
      ),
    );

  }

   Widget userWeb(){
    return Card(
      color: Color.fromARGB(255, 200, 91, 255),
      //  child: Column(
      //     children: <Widget>[
        child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Website: "+user.website,
            style: const TextStyle(color: Colors.white,
            fontSize: 17),
            )
          ],
        ),
      ),
    );

  }

 Widget userAddress(){
    return Card(
      color: const Color.fromARGB(255, 255, 166, 134),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: const Icon(
                Icons.add_location,
                color: Colors.black,
                size: 50,
              ),
              title: Text("City: "+user.address.city,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 16)),
              subtitle: Text(
                "street: "+user.address.street+"\nsuite: "+user.address.suite+"\nzipcode: "+user.address.zipcode+"\ngeo(lat: "+user.address.geo.lat+" ing: "+user.address.geo.lng+")",
                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 14)),
              
              
              
              )
          ],
        ),
      ),
    );
  }

  Widget userCompany(){
    return Card(
      color: Color.fromARGB(255, 53, 137, 109),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: const Icon(
                Icons.work_outlined,
                color: Colors.black,
                size: 50,
              ),
              title: Text("Company: "+user.company.name,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 16)),
              subtitle: Text(
                "catchPhrase: "+user.company.catchPhrase+"\nbs: "+user.company.bs,
                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 14)),
              
              
              
              )
          ],
        ),
      ),
    );
  }
  

  @override
  Widget build(BuildContext context){
     return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            userPersonal(),
            userPhone(),
            userWeb(),
            userAddress(),
            userCompany()
          ],
        ),
      ),
     );
  }
}