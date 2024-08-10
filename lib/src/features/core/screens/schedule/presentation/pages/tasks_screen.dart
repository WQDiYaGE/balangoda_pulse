import 'package:balangoda_pulse/src/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../components/build_text_field.dart';
import '../../routes/pages.dart';
import '../../utils/color_palette.dart';
import '../../utils/font_sizes.dart';
import '../../utils/util.dart';
import '../bloc/tasks_bloc.dart';
import '../widget/task_item_view.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context.read<TasksBloc>().add(FetchTaskEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    var size = MediaQuery.of(context).size;


    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: ScaffoldMessenger(
            child: Scaffold(
              backgroundColor: kWhiteColor,
              appBar: CustomAppBar(
                title: const Text('Hi Jerome'),
                actions: [
                  PopupMenuButton<int>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 1,
                    onSelected: (value) {
                      switch (value) {
                        case 0:
                          context.read<TasksBloc>().add(SortTaskEvent(sortOption: 0));
                          break;
                        case 1:
                          context.read<TasksBloc>().add(SortTaskEvent(sortOption: 1));
                          break;
                        case 2:
                          context.read<TasksBloc>().add(SortTaskEvent(sortOption: 2));
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem<int>(
                          value: 0,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/calender.svg',
                                width: 15,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('Sort by date')
                            ],
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 1,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/task_checked.svg',
                                width: 15,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('Completed tasks')
                            ],
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 2,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/task.svg',
                                width: 15,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('Pending tasks')
                            ],
                          ),
                        ),
                      ];
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: SvgPicture.asset('assets/svgs/filter.svg'),
                    ),
                  ),
                ],
              ),
              body: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: BlocConsumer<TasksBloc, TasksState>(
                    listener: (context, state) {
                      if (state is LoadTaskFailure) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(getSnackBar(state.error, kRed));
                      }

                      if (state is AddTaskFailure || state is UpdateTaskFailure) {
                        context.read<TasksBloc>().add(FetchTaskEvent());
                      }
                    },
                    builder: (context, state) {
                      if (state is TasksLoading) {
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }

                      if (state is LoadTaskFailure) {
                        return Center(
                          child: Text(
                            state.error,
                            style: const TextStyle(
                              color: kBlackColor,
                              fontSize: textMedium,
                            ),
                          ),
                        );
                      }

                      if (state is FetchTasksSuccess) {
                        return state.tasks.isNotEmpty || state.isSearching
                            ? Column(
                          children: [
                            BuildTextField(
                              hint: "Search recent task",
                              controller: searchController,
                              inputType: TextInputType.text,
                              prefixIcon: const Icon(
                                Icons.search,
                                color: kGrey2,
                              ),
                              fillColor: kWhiteColor,
                              onChange: (value) {
                                context
                                    .read<TasksBloc>()
                                    .add(SearchTaskEvent(keywords: value));
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: state.tasks.length,
                                itemBuilder: (context, index) {
                                  return TaskItemView(
                                    taskModel: state.tasks[index],
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return const Divider(
                                    color: kGrey3,
                                  );
                                },
                              ),
                            )
                          ],
                        )
                            : Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/tasks.svg',
                                height: size.height * .20,
                                width: size.width,
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              const Text(
                                'Schedule your tasks',
                                style: TextStyle(
                                  color: kBlackColor,
                                  fontSize: textBold,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Manage your task schedule easily\nand efficiently',
                                style: TextStyle(
                                  color: kBlackColor.withOpacity(.5),
                                  fontSize: textSmall,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ),
              floatingActionButton: Stack(
                children: [
                  Positioned(
                    bottom: 164.0,
                    right: 16.0,
                    child: FloatingActionButton(
                        onPressed: () {
                          Get.toNamed(Pages.createNewTask);
                        },
                        backgroundColor: isDarkMode ? CustomColors.accentColor : CustomColors.primaryColor,
                        child: const Icon(Iconsax.add)
                    ),
                  )
                ]
              ),
            )));
  }
}
