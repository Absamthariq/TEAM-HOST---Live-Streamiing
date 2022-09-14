import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streaming_app/Constants/constants.dart';
import 'package:streaming_app/Controller/news_controller.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    return Scaffold(
      backgroundColor: primaryThemeColor,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: primaryThemeColor,
          automaticallyImplyLeading: false,
          floating: true,
          pinned: true,
          snap: false,
          centerTitle: true,
          title: const Text(
            'News',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          actions: [],
          bottom: AppBar(
            backgroundColor: primaryThemeColor,
            automaticallyImplyLeading: false,
            title: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Search for News',
                    focusColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.mic),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () {
                if (controller.loading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.totalArticles.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                     final data = controller.totalArticles[index];
                      return Column(
                        children: [
                          Container(
                            height: 330,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(56, 158, 158, 158),
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      width: 350,
                                      height: 200,
                                      decoration: BoxDecoration(
                                          image:  DecorationImage(
                                              image: NetworkImage(
                                                  data.urlToImage.toString()),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  ),
                                   Padding(
                                    padding: EdgeInsets.only(left: 20, top: 10),
                                    child: Text(
                                      data.title.toString(),overflow: TextOverflow.ellipsis,maxLines: 2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 20, top: 8),
                                    child: Row(
                                      children:  [
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'Assets/Images/download.png'),
                                          radius: 15,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'IGN',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    });
              },
            ),
          ),
        )
      ]),
    );
  }
}
