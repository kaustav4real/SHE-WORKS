import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({Key? key}) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {
    const List imageList = <Map<String, String>>[
      {
        "imgURL":
        "https://www.pmindia.gov.in/wp-content/uploads/2023/03/H20230329129242.jpg",
        "content":
        "Women empowerment is crucial to India's growth. Days of seeing women as 'home makers' have gone, we have to see women as nation builders!- PM Modi"
      },
      {
        "imgURL":
        "https://people.com/thmb/1sIssM_8xIidZ6JKelTwNFvmXxE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(749x0:751x2)/michelle-yeoh-best-actress-oscars-031223-2-c236bddf36c041da8916db391c05d581.jpg",
        "content": "This is for all women who never gave up"
      },
      {
        "imgURL":
        "https://pbs.twimg.com/media/FPg8IHhWUAE0Zyz?format=jpg&name=large",
        "content":
        "From NHS doctor to top Python instructor on Udemy, meet Angela Yu"
      },
      {
        "imgURL":
        "https://www.pmindia.gov.in/wp-content/uploads/2023/03/H20230329129242.jpg",
        "content":
        "Women empowerment is crucial to India's growth. -PM Modi"
      },
      {
        "imgURL":
        "https://people.com/thmb/1sIssM_8xIidZ6JKelTwNFvmXxE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(749x0:751x2)/michelle-yeoh-best-actress-oscars-031223-2-c236bddf36c041da8916db391c05d581.jpg",
        "content": "This is for all women who never gave up",
      },
      {
        "imgURL":
        "https://pbs.twimg.com/media/FPg8IHhWUAE0Zyz?format=jpg&name=large",
        "content":
        "From NHS doctor to top Python instructor on Udemy, meet Angela Yu",
      }
    ];
    return CarouselSlider(
      options: CarouselOptions(height: 200),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 200,
                          child: ColorFiltered(
                            colorFilter: ColorFilter.matrix(<double>[
                              0.5, 0, 0, 0, 0, // Red
                              0, 0.5, 0, 0, 0, // Green
                              0, 0, 0.5, 0, 0, // Blue
                              0, 0, 0, 1, 0.1, // Alpha
                            ]),
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  imageList[i]["imgURL"] as String),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 10,
                          child: SizedBox(
                            width: 290,
                            child: Text(
                              imageList[i]["content"],
                              softWrap: true,
                              maxLines: 10,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}