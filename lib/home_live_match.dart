import 'package:flutter/material.dart';
import 'package:ubc_app/card_stepper.dart';
import 'live_match_appbar.dart';
import 'card_stepper.dart';

void main() {
  runApp(new MaterialApp(
    title: "home_live_match",
    home: new LiveMatch(),
  ));
}

class LiveMatch extends StatefulWidget {
  @override
  _LiveMatchState createState() => _LiveMatchState();
}

class _LiveMatchState extends State<LiveMatch> {
//  List<Step> steps = [
//    Step(
//      title: const Text('First Quarter'),
//      isActive: true,
//      state: StepState.complete,
//      content: Column(
//        children: <Widget>[
//          TextFormField(
//            decoration: InputDecoration(labelText: 'Email Address'),
//          ),
//          TextFormField(
//            decoration: InputDecoration(labelText: 'Password'),
//          ),
//        ],
//      )
//    )
//  ];
//
  int currentStep = 0;

//  bool complete = false;
//
//  next(){
//    currentStep + 1 != steps.length
//        ? goTo(currentStep + 1)
//        : setState(()=>complete = true);
//  }
//
//  cancel(){
//    if(currentStep > 0){
//      goTo(currentStep - 1);
//    }
//  }
//
//  goTo(int step){
//    setState(() => currentStep = step);
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Live Match'),
            backgroundColor: Colors.indigo[900],
            pinned: true,
            expandedHeight: 210.0,
            flexibleSpace: FlexibleSpaceBar(
              background: LiveMatchAppBar(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Stepper(
                steps: mySteps(),
                currentStep: this.currentStep,
                onStepTapped: (step) {
                  setState(() {
                    this.currentStep = step;
                  });
                },
                onStepContinue: () {
                  setState(() {
                    if (this.currentStep < this.mySteps().length - 1) {
                      this.currentStep = this.currentStep + 1;
                    } else {
                      print('Completed, check fields.');
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (this.currentStep > 0) {
                      this.currentStep = this.currentStep - 1;
                    } else {
                      this.currentStep = 0;
                    }
                  });
                },
                controlsBuilder: (BuildContext context,
                        {VoidCallback onStepContinue,
                        VoidCallback onStepCancel}) =>
                    Container(),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  List<Step> mySteps() {
    List<Step> _steps = [
      Step(
        title: Text('1st Quarter'),
        content: CardStepper(),
        isActive: currentStep >= 0,
      ),
      Step(
        title: Text('2nd Quarter'),
        content: CardStepper(),
        isActive: currentStep >= 1,
      ),
      Step(
        title: Text('3rd Quarter'),
        content: CardStepper(),
        isActive: currentStep >= 2,
      ),
      Step(
        title: Text('4th Quarter'),
        content: CardStepper(),
        isActive: currentStep >= 3,
      ),
    ];
    return _steps;
  }
}
