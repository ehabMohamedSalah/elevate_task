  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/adaptive_layout.dart';
import '../../core/di/di.dart';
import '../../core/resuable_component/drawer.dart';
import '../../core/utils/size_config.dart';
import 'ViewModel/home_view_model_cubit.dart';
 import 'home_layout/widget/ProductWidget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
   @override
  Widget build(BuildContext context) {
     return BlocProvider(
      create: (context) => getIt<HomeViewModel>()..getProduct(),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<HomeViewModel,HomeViewModelState>(
                builder: (context, state) {
                  if(state is HomeErrorState){
                    return Center(child: Text(state.ErrorMsg),);
                  }
                    if(state is HomeSuccessState){
                    return GridView.builder(
                      scrollDirection: Axis.vertical,

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.h,
                          childAspectRatio: 3 / 4,
                          mainAxisSpacing: 16.h

                      ),
                      itemBuilder: (context, index) => ProductWidget(state.entity[index] ),
                      itemCount: state.entity.length,



                    );
                  }
                  return Center(child: CircularProgressIndicator(),);

                },

              ),
            ),
          ],
        ),

      ),
    );

  }
}
