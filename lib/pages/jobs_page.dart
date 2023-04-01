import 'package:flutter/material.dart';
import '../models/job.dart';
import '../widgets/jobs/search.dart';

class JobPage extends StatefulWidget {
  const JobPage({Key? key}) : super(key: key);

  @override
  _JobPageState createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return /* Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey.withOpacity(0.1),
                ),
              ),
            ],
          )*/
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeAppBar(),
            const SearchCard(),
            TagList(),
            JobList(),
          ],
        ),
      );
  }
}

class BookmarkIcon extends StatefulWidget {
  final bool isMarked;
  final Function(bool) onPressed;

  BookmarkIcon({required this.isMarked, required this.onPressed});

  @override
  _BookmarkIconState createState() => _BookmarkIconState();
}

class _BookmarkIconState extends State<BookmarkIcon> {
  bool _isMarked = false;

  @override
  void initState() {
    _isMarked = widget.isMarked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isMarked ? Icons.bookmark : Icons.bookmark_outline_outlined,
        color: _isMarked ? Theme.of(context).primaryColor : Colors.black,
      ),
      onPressed: () {
        setState(() {
          _isMarked = !_isMarked;
        });
        widget.onPressed(_isMarked);
      },
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 20),
              Text(
                'Welcome,',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(height: 3),
              Text(
                'Annie Bryant',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30, right: 10),
                transform: Matrix4.rotationZ(100),
                child: Stack(
                  children: [
                    const Icon(
                      Icons.notifications_none_outlined,
                      size: 30,
                      color: Colors.grey,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 20),
              ClipOval(
                child: Image.asset(
                  'assets/images/avatar.png',
                  width: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class JobDetails extends StatelessWidget {
  final Job job;
  const JobDetails(this.job, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      height: 550,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey.withOpacity(0.3),
              height: 5,
              width: 60,
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: Image.asset(job.logoUrl),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          job.company,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          job.isMark
                              ? Icons.bookmark
                              : Icons.bookmark_outline_rounded,
                          color: job.isMark
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                        ),
                        const Icon(Icons.more_horiz_outlined),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  job.title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconText(Icons.location_on_outlined, job.location),
                    IconText(Icons.access_time_outlined, job.time),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  'Requirement',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                ...job.req
                    .map((e) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 5,
                        width: 5,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 10),
                      ConstrainedBox(
                        constraints:
                        const BoxConstraints(maxWidth: 330),
                        child: Text(
                          e,
                          style: const TextStyle(
                            wordSpacing: 2.5,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
                    .toList(),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 25),
                  height: 45,
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {},
                    child: const Text("Apply Now"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class JobItem extends StatelessWidget {
  final Job job;
  final bool showTime;
  const JobItem(this.job, {super.key, this.showTime = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(height: 45),
                  Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: Image.asset(job.logoUrl),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    job.company,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              BookmarkIcon(
                  isMarked: false,
                  onPressed: (isMarked) {
                    isMarked ? Colors.red : Colors.grey;
                  })
            ],
          ),
          const SizedBox(height: 15),
          Text(
            job.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconText(Icons.location_on_outlined, job.location),
              if (showTime) IconText(Icons.access_time_outlined, job.time),
            ],
          )
        ],
      ),
    );
  }
}

class JobList extends StatelessWidget {
  final jobList = Job.generateJobs();

  JobList({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 35),
      height: 190,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (context) => JobDetails(jobList[index]));
          },
          child: JobItem(jobList[index]),
        ),
        separatorBuilder: (_, index) => const SizedBox(
          width: 15,
        ),
        itemCount: jobList.length,
      ),
    );
  }
}

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 50,
      ),
      height: 300,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
              image: AssetImage('assets/images/search_bg.png'),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Fast Search",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "You can search quickly for\nthe job you want",
            style: TextStyle(
              height: 1.8,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SearchPage()));
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/search.png',
                    width: 20,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Search',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TagList extends StatefulWidget {
  const TagList({super.key});

  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  final tagsList = <String>['All', '⚡ Popular', '⭐ Featured'];
  var selected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        height: 40,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                selected = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  color: selected == index
                      ? Theme.of(context).primaryColor.withOpacity(0.2)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: selected == index
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColor.withOpacity(0.2))),
              child: Text(tagsList[index]),
            ),
          ),
          separatorBuilder: (_, index) => const SizedBox(width: 15),
          itemCount: tagsList.length,
        ));
  }
}

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconText(this.icon, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xff039BE5),
          size: 24,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        )
      ],
    );
  }
}
