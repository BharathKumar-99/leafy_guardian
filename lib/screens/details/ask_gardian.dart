import 'package:flutter/material.dart';
import 'package:leafy_guardian/model/ask_gaurdian.dart';

import '../../api/plants_api.dart';

class AskGuardianScreen extends StatefulWidget {
  final String plantName;
  const AskGuardianScreen({super.key, required this.plantName});

  @override
  State<AskGuardianScreen> createState() => _AskGuardianScreenState();
}

class _AskGuardianScreenState extends State<AskGuardianScreen> {
  TextEditingController textController = TextEditingController();
  AskGaurdianModel? answer;
  bool loading = false;

  getAnswer() async {
    setState(() {
      loading = true;
    });
    await PlantsApi()
        .askGaurdian(textController.text, widget.plantName)
        .then((value) {
      setState(() {
        loading = false;
        answer = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Ask Guardian'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Ask guardian about your ${widget.plantName}",
                  suffixIcon: IconButton(
                    onPressed: () {
                      getAnswer();
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                ),
              ),
              const SizedBox(height: 40),
              loading
                  ? Center(
                      child: Text('Loading...',
                          style: Theme.of(context).textTheme.titleLarge),
                    )
                  : answer == null
                      ? Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    colorFilter:
                                        ColorFilter.linearToSrgbGamma(),
                                    image:
                                        AssetImage('assets/gaurdian_image.png'),
                                    filterQuality: FilterQuality.high),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Ask guardian about your ${widget.plantName}',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        )
                      : answer?.error != null
                          ? Text(
                              answer?.error ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(color: Colors.redAccent),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${answer?.question}',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const SizedBox(height: 20),
                                answer?.issue == null
                                    ? Container()
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Issues that may be causing your issue may be:',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary),
                                          ),
                                          const SizedBox(height: 10),
                                          ListView.builder(
                                              itemCount:
                                                  answer?.issue?.length ?? 0,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        answer?.issue?[index]
                                                                .title ??
                                                            "",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium!
                                                            .copyWith(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .primary),
                                                      ),
                                                      Text(answer?.issue?[index]
                                                              .description ??
                                                          ""),
                                                    ],
                                                  ),
                                                );
                                              }),
                                          const SizedBox(height: 10),
                                        ],
                                      ),
                                answer?.treatment == null
                                    ? Container()
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Issues can be resolved by:',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary),
                                          ),
                                          const SizedBox(height: 10),
                                          ListView.builder(
                                              itemCount:
                                                  answer?.treatment?.length ??
                                                      0,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        answer
                                                                ?.treatment?[
                                                                    index]
                                                                .title ??
                                                            "",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium!
                                                            .copyWith(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .primary),
                                                      ),
                                                      Text(answer
                                                              ?.treatment?[
                                                                  index]
                                                              .description ??
                                                          ""),
                                                    ],
                                                  ),
                                                );
                                              }),
                                          const SizedBox(height: 10),
                                        ],
                                      ),
                                answer?.tips == null
                                    ? Container()
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Some Tips:',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary),
                                          ),
                                          const SizedBox(height: 10),
                                          ListView.builder(
                                              itemCount:
                                                  answer?.tips?.length ?? 0,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        answer?.tips?[index]
                                                                .title ??
                                                            "",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium!
                                                            .copyWith(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .primary),
                                                      ),
                                                      Text(answer?.tips?[index]
                                                              .description ??
                                                          ""),
                                                    ],
                                                  ),
                                                );
                                              }),
                                        ],
                                      ),
                              ],
                            )
            ],
          ),
        ),
      ),
    );
  }
}
