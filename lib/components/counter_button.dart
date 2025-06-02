import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../counter.dart';

class CounterButton extends HookConsumerWidget {
  const CounterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final isButtonEnabled = useState(true);

    useEffect(() {
      if (counter % 10 == 0 && counter != 0) {
        isButtonEnabled.value = false;
        Future.delayed(const Duration(seconds: 1), () {
          isButtonEnabled.value = true;
        });
      }
      return null;
    }, [counter]);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: isButtonEnabled.value
              ? () => ref.read(counterProvider.notifier).state++
              : null,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        if (!isButtonEnabled.value)
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'Button disabled for 1 second!',
              style: TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}
