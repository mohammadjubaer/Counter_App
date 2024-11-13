import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CounterUI extends StatelessWidget {
  const CounterUI({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt i = 10000.obs;
    double multiflyer =0;
    if(i.value < 100){
      multiflyer=.1;
    }else{
      multiflyer=.01;
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          i.value++;
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Obx( () => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: 100 + i.value * multiflyer, // Adjust the multiplier as needed
            width: 100 + i.value * multiflyer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.teal,
            ),
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
                child: Text(
                  '$i',
                  key: ValueKey<int>(i.value),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


