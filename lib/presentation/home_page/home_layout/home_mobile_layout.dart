import 'package:elevate_task/presentation/home_page/ViewModel/home_view_model_cubit.dart';
import 'package:elevate_task/presentation/home_page/home_layout/widget/ProductWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/di/di.dart';

class HomeMobileLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
          create: (context) => getIt<HomeViewModel>()..getProduct(),
         child: Scaffold(
          body: Column(
            children: [
              BlocBuilder<HomeViewModel,HomeViewModelState>(
                builder: (context, state) {
                  if(state is HomeErrorState){
                    return Center(child: Text(state.ErrorMsg),);
                  }
                  else if(state is HomeSuccessState){
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
            ],
          ),

             ),
       );
  }
}
