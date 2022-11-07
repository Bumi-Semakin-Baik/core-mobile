import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CommonShimmerWidget {
  Widget buildProductItemShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: Colors.white60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.width * 0.38,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.38,
                    height: 10,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 8.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
        itemCount: 3,
      ),
    );
  }

  Widget buildNewsItemShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: Colors.white60,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width * 0.38,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.38,
                    height: 10,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 8.0,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 8.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
        itemCount: 3,
      ),
    );
  }

  Widget buildTextDescShimmer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.black12,
            highlightColor: Colors.white60,
            child: Container(
              width: double.infinity,
              height: 10,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Shimmer.fromColors(
            baseColor: Colors.black12,
            highlightColor: Colors.white60,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 10,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextDetailShimmer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.black12,
            highlightColor: Colors.white60,
            child: Container(
              width: double.infinity,
              height: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Shimmer.fromColors(
            baseColor: Colors.black12,
            highlightColor: Colors.white60,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 10,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          Shimmer.fromColors(
            baseColor: Colors.black12,
            highlightColor: Colors.white60,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 10,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Shimmer.fromColors(
            baseColor: Colors.black12,
            highlightColor: Colors.white60,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 10,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Shimmer.fromColors(
            baseColor: Colors.black12,
            highlightColor: Colors.white60,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 10,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
