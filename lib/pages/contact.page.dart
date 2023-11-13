import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/list_helper.dart';
import 'package:test/contact-model.dart';
import 'package:test/pages/ajout-modif-conact.dart';
import 'package:test/service/contact-service.dart';

class contactPage extends StatefulWidget {

  @override
  State<contactPage> createState() => _contactPageState();
}

class _contactPageState extends State<contactPage> {
    ContactService contactService = ContactService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page contact')),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FormHelper.submitButton(
                "Ajouter",
                (){
                  Navigator.push(context, MaterialPageRoute(builder: ((context) =>AjoutModifContactPage(
     
                  )
                  ))).then((value){
                    setState(() {
                      
                    });
                  });

                },
                borderRadius: 10,
                btnColor: Colors.blue,
                borderColor: Colors.blue
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _fetchData(),
          ],
        ),
      )
    );
  }
  _fetchData(){
   
    return FutureBuilder<List<Contact>>
    
    (future: contactService.listeContacts(),
     builder: (BuildContext context , AsyncSnapshot<List<Contact>>contacts)
     {
    
      if (contacts.hasData) return _buildDataTable(contacts.data!);
      return Center(
        child: CircularProgressIndicator(),
      );
     },);
  }
  _buildDataTable(List<Contact> listContact){
    return Padding(padding: const EdgeInsets.all(8.0),
    child: ListUtils.buildDataTable(
      context,
      ["Nom","Telephone","Action"],
      ["nom","tel",""],
      false,
      0,
      listContact,
      (Contact c){
        //Modifier
      },
      (Contact C){

      },
      headingRowColor : Colors.orangeAccent,
      isScrollable:true,
      columnTextFontSize:20,
      columnTextBold:false,
      columnSpacing:50,
      onSort:(columnIndex,columnName,asc){},
    )
    );
  }
}
