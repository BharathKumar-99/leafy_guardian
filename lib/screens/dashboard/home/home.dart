import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy_guardian/provider/home_provider.dart';
import 'package:leafy_guardian/screens/dashboard/home/widgets/did_you_know.dart';
import 'package:leafy_guardian/screens/dashboard/home/widgets/garden_ui.dart';
import 'package:leafy_guardian/utils/routes/index.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeProvider _provider;
  @override
  void initState() {
    _provider = Provider.of<HomeProvider>(context, listen: false);
    setState(() {
      _provider.init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(builder: (context, data, widget) {
        return Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${data.timeOfday}!',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(35),
                          child: CircleAvatar(
                            radius: 33,
                            child: data.userModel?.pic == null
                                ? const CircleAvatar(
                                    radius: 30,
                                    child: CircleAvatar(),
                                  )
                                : CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        NetworkImage(data.userModel?.pic ?? ''),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Did You Know ...',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.22,
                      child: const DidYouKnow()),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Garden',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      GestureDetector(
                        onTap: () => context.push(routeName.allPlants),
                        child: Text(
                          'See All',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            data.garden.length > 3 ? 3 : data.garden.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var gardenModel = data.garden[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: gardenUi(
                                gardenModel.image ?? "",
                                gardenModel.name ?? "",
                                gardenModel.temp ?? 0.0,
                                gardenModel.soil ?? "",
                                gardenModel.humidity ?? 0,
                                gardenModel.id.toString()),
                          );
                        }),
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Add Plants')),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
