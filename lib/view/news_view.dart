import 'package:bloc_new_app/bloc/news_bloc.dart';
import 'package:bloc_new_app/components/loading_widget.dart';
import 'package:bloc_new_app/service/news_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(newsService),
      child: const NewsView(),
    );
  }
}

class NewsView extends StatelessWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News view'),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if(state is NewsLoading ){
            return const LoadingWidget()
          }else if (state is NewsSuccess){
            return NewsSuccessWidget();
          }else if(state is NewsError){
            return   ErrorWidget(state.text);
          }else{
            return  ErrorWidget('Belgisiz state');
          }
        
        },
      ),
    );
  }
}


class NewsSuccessWidget extends StatelessWidget{
  const NewsSuccessWidget({super.key});

  @override

  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title:const Text('NewsSuccessWidget'),),);
  }

}



