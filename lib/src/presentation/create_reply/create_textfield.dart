import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:then_he_replied/src/data/reply_item.dart';
import 'package:then_he_replied/src/presentation/create_reply/create_title_textfield.dart';
import 'package:then_he_replied/src/presentation/main_view.dart';
import 'package:then_he_replied/src/presentation/reply_list_screen/list_provider.dart';

class ReplyTextField extends ConsumerStatefulWidget {
  const ReplyTextField({super.key});

  @override
  ConsumerState<ReplyTextField> createState() => _ReplyTextFieldState();
}

class _ReplyTextFieldState extends ConsumerState<ReplyTextField> {
  final controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          maxLines: 18,
          minLines: 4,
          controller: controller,
          decoration: const InputDecoration(
              label: Text("Then He Replied."),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(25), right: Radius.circular(35)),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RotationTransition(
                turns: const AlwaysStoppedAnimation(-30 / 360),
                child: IconButton(
                  icon: const Icon(
                    size: 34,
                    Icons.send,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    final notifier = ref.read(listProvider.notifier);
                    final uc = UniqueKey().hashCode;
                    notifier.addItem(
                      ReplyItem(
                        author: 'Currrent user',
                        text: controller.text,
                        date: DateTime.now(),
                        title: ref.read(titleProvider),
                        id: uc,
                        context: 'He was terrible',
                      ),
                    );
                    ref.read(indexBottomNavbarProvider.notifier).state = 0;
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
