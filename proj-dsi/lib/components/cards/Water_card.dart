// ignore: file_names
import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:flutter/material.dart';

class WaterCard extends StatefulWidget {
  const WaterCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WaterCardState createState() => _WaterCardState();
}

class _WaterCardState extends State<WaterCard> {
  int waterConsumption = 0;
  int selectedAmount = 0;
  int totalSteps = 7;
  int currentStep = 0;

  void _addWater() {
    setState(() {
      if (currentStep < totalSteps) {
        waterConsumption += selectedAmount;
        currentStep++;
      }
    });
  }

  void _removeWater() {
    setState(() {
      if (waterConsumption - selectedAmount >= 0) {
        waterConsumption -= selectedAmount;
        if (currentStep > 0) {
          currentStep--;
        }
      } else {
        waterConsumption = 0;
        currentStep = 0;
      }
    });
  }

  void _selectAmount(int amount) {
    setState(() {
      selectedAmount = amount;
    });
  }

  Widget _buildStepCircle(int step) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 24.0,
          height: 24.0,
          decoration: BoxDecoration(
            color: step < currentStep
                ? const Color.fromARGB(255, 205, 19, 19)
                : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: const Color.fromARGB(255, 205, 19, 19)),
          ),
        ),
      ],
    );
  }

  Widget _buildStepIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        return Row(
          children: [
            _buildStepCircle(index),
            if (index < totalSteps - 1)
              Container(
                width: 20,
                height: 5,
                color: index < currentStep - 1
                    ? const Color.fromARGB(255, 205, 19, 19)
                    : Colors.grey.shade300,
              ),
          ],
        );
      }),
    );
  }

  Color _getButtonColor(int amount) {
    return selectedAmount == amount
        ? const Color.fromARGB(255, 205, 19, 19)
        : Colors.white;
  }

  Color _getButtonTextColor(int amount) {
    return selectedAmount == amount
        ? Colors.white
        : const Color.fromARGB(255, 205, 19, 19);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Row(
                    children: [backButton()],
                  ),
                  Row(
                    children: [
                      Container(
                        height: (237 / 932) * size.height,
                        width: (237 / 430) * size.width,
                        margin: EdgeInsets.only(
                          top: (62 / 932) * size.height,
                          left: size.width * (100 / 430),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Consumo de Água',
                              style: Theme.of(context).textTheme.titleMedium,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 30),
                            Text(
                              '$waterConsumption ml',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildStepIndicator(),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _removeWater,
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(20),
                            backgroundColor:
                                const Color.fromARGB(255, 205, 19, 19),
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('-'),
                        ),
                        const SizedBox(width: 20),
                        Image.asset(
                          'assets/images/displayremedio.png',
                          height: 200,
                          width: 200,
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: _addWater,
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(20),
                            backgroundColor:
                                const Color.fromARGB(255, 205, 19, 19),
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('+'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                height: 150.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: ElevatedButton(
                            onPressed: () => _selectAmount(200),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _getButtonColor(200),
                              foregroundColor: _getButtonTextColor(200),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 18.0),
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                            child: const Text('200 ml'),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          child: ElevatedButton(
                            onPressed: () => _selectAmount(300),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _getButtonColor(300),
                              foregroundColor: _getButtonTextColor(300),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 18.0),
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                            child: const Text('300 ml'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: ElevatedButton(
                            onPressed: () => _selectAmount(350),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _getButtonColor(350),
                              foregroundColor: _getButtonTextColor(350),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 18.0),
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                            child: const Text('350 ml'),
                          ),
                        ),
                        const SizedBox(width: 40),
                        Flexible(
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Valor\nPersonalizado'),
                                    content: TextField(
                                      onChanged: (value) {
                                        selectedAmount = int.parse(value);
                                      },
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          _selectAmount(selectedAmount);
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _getButtonColor(-1),
                              foregroundColor: _getButtonTextColor(-1),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 17.0),
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                            child: const Text('Valor\nPersonalizado'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 30.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text('HISTÓRICO'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Water Consumption')),
      body: const WaterCard(),
    ),
  ));
}
