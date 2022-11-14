import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/utils/common_picker/index.dart';
import 'package:hook_up_rent/widgets/common_form_item.dart';

class CommonSelectFormItem extends StatelessWidget {
  final String label;
  final List<String>? options;
  final int? value;
  final ValueChanged<int?>? onChange;

  const CommonSelectFormItem({
    Key? key,
    required this.label,
    this.options,
    this.value,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
      label: label,
      contentBuilder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            var result = CommonPicker.showPicker(
              context: context,
              options: options,
              value: value,
            );
            result?.then((selectedValue) => {
                  if (value != selectedValue &&
                      selectedValue != null &&
                      onChange != null)
                    onChange!(selectedValue)
                });
          },
          child: SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  options![value!],
                  style: const TextStyle(fontSize: 16),
                ),
                const Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
        );
      },
    );
  }
}
