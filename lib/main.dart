import 'package:flutter/material.dart';

void main() {
  runApp(const HomeworkApp());
}

class HomeworkApp extends StatelessWidget {
  const HomeworkApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //1. define a variable that changes
  //2. use the variable in the build method to create UI
  //3. modify the variable in setState

  final _textController = TextEditingController();
  String displayAmount = "";
  String errorTextValue = "";
  double exchangeRate = 4.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 300,
              child: Image.asset("assets/images/bani.jpg")),
          Container(
            padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 10.0),
            child: TextField(
              controller: _textController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true
              ),
              keyboardAppearance: Brightness.light,
              decoration: InputDecoration(
                hintText: "enter the amount in EUR",
                errorText: errorTextValue.isEmpty? null: errorTextValue
              ),
            ),
          ),
          MaterialButton(
              onPressed: (){
                setState(() {
                  String inputAmount = _textController.text;
                  double? amount;
                  if(inputAmount=="."){
                   amount = 0.0;
                  }else{
                    amount = double.tryParse(inputAmount);
                  }
                  if(amount == null){
                    errorTextValue = "please enter a number";
                    displayAmount = '';
                  }else{
                    amount = amount * exchangeRate;
                    errorTextValue = '';
                    displayAmount = amount.toString();
                  }
                });

              },
              color: Colors.grey,
              child: Text("Convert!")),

          Text(
              displayAmount,
            style: const TextStyle(
              fontSize: 30
            ),
          )
        ],
      ),
    );
  }
}

