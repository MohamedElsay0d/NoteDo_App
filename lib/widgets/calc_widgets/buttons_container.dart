import 'package:flutter/material.dart';
import 'package:notedo_app/json/datalist.dart';
import 'package:notedo_app/widgets/calc_widgets/equal_button.dart';

class ButtonsContainer extends StatelessWidget {
  const ButtonsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.sizeOf(context).height;
    return Container(
      height: screenHight * 0.59,
      // height: screenHight * 0.598,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: screenHight * 0.030, vertical: screenHight * 0.030),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              4,
              (index) => buttonsList[index],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              4,
              (index) => buttonsList[index + 4],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              4,
              (index) => buttonsList[index + 8],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        3,
                        (index) => buttonsList[index + 12],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        3,
                        (index) => buttonsList[index + 15],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 18),
              const EqualButton()
            ],
          )
        ],
      ),
    );
  }
}
