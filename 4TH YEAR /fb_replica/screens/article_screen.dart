import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../models/article_model.dart';
import '../services/article_service.dart';
import '../widgets/custom_text.dart';
import '../providers/theme_provider.dart';
import 'article_detail_screen.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  late Future<List<Article>> _futureArticles;
  List<Article> _allArticles = [];
  List<Article> _filteredArticles = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _futureArticles = _getAllArticles();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<List<Article>> _getAllArticles() async {
    try {
      print('Fetching articles from API...');
      final response = await ArticleService().getArticles();
      print('API Response received: ${response.length} articles');

      // Map raw list to typed models once
      _allArticles = response.map((e) => Article.fromJson(e)).toList();
      print('Mapped ${_allArticles.length} articles to Article objects');

      // Add a sample article for testing
      _allArticles.insert(
        0,
        Article(
          userId: 999,
          id: 999,
          title: 'Sample Article - Getting my first UI UX Design Internship',
          body:
              'It was the first day of the internship. One half of the day until lunch went up to completing all the formalities. After all the official documentation and introduction with respective teams, I was introduced to my respective team. I saw Mr. Robert who was working at the company for the past 5 years. He was very welcoming and helped me understand the project structure. The team was working on a mobile application redesign project. My first task was to analyze the current user interface and identify areas for improvement. I spent the next few hours reviewing the existing design files and user feedback. The experience was both exciting and challenging as I learned about the real-world application of UI/UX principles. The team was very supportive and provided valuable insights into the design process. I realized that working on actual projects is quite different from academic assignments. The pressure to deliver results while maintaining quality was a new experience for me. However, I was determined to make the most of this opportunity and contribute meaningfully to the project.',
        ),
      );

      _filteredArticles = _allArticles;
      print('Total articles after adding sample: ${_allArticles.length}');
      return _allArticles;
    } catch (e) {
      print('Error fetching articles: $e');
      // Return sample data if API fails
      _allArticles = [
        Article(
          userId: 999,
          id: 999,
          title: 'Sample Article - Getting my first UI UX Design Internship',
          body:
              'It was the first day of the internship. One half of the day until lunch went up to completing all the formalities. After all the official documentation and introduction with respective teams, I was introduced to my respective team. I saw Mr. Robert who was working at the company for the past 5 years. He was very welcoming and helped me understand the project structure. The team was working on a mobile application redesign project. My first task was to analyze the current user interface and identify areas for improvement. I spent the next few hours reviewing the existing design files and user feedback. The experience was both exciting and challenging as I learned about the real-world application of UI/UX principles. The team was very supportive and provided valuable insights into the design process. I realized that working on actual projects is quite different from academic assignments. The pressure to deliver results while maintaining quality was a new experience for me. However, I was determined to make the most of this opportunity and contribute meaningfully to the project.',
        ),
        Article(
          userId: 998,
          id: 998,
          title: 'Another Sample Article - Flutter Development Tips',
          body:
              'Flutter is an amazing framework for building cross-platform applications. In this article, we will explore some best practices for Flutter development. First, always use proper state management solutions like Provider or Riverpod. Second, make sure to follow the Material Design guidelines for a consistent user experience. Third, optimize your app performance by using const constructors where possible and avoiding unnecessary rebuilds. Fourth, implement proper error handling and loading states. Fifth, write clean and maintainable code with proper documentation. These practices will help you build high-quality Flutter applications that users love.',
        ),
      ];
      _filteredArticles = _allArticles;
      return _allArticles;
    }
  }

  void _filterArticles(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredArticles = _allArticles;
      } else {
        _filteredArticles = _allArticles
            .where(
              (article) =>
                  article.title.toLowerCase().contains(query.toLowerCase()) ||
                  article.body.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeModel = context.watch<ThemeProvider>();
    final isDark = themeModel.isDark;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: TextField(
              controller: _searchController,
              onChanged: _filterArticles,
              decoration: InputDecoration(
                hintText: 'Search articles...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _filterArticles('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: isDark ? Colors.grey[800] : Colors.grey[100],
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Article>>(
              future: _futureArticles,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: CustomText(
                        text: 'No articles to display.',
                        fontSize: 14.sp,
                      ),
                    ),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator.adaptive(strokeWidth: 3.sp),
                        SizedBox(height: 10.h),
                        CustomText(
                          text: 'Loading articles...',
                          fontSize: 14.sp,
                        ),
                      ],
                    ),
                  );
                }

                final articles = _filteredArticles.isEmpty
                    ? snapshot.data ?? []
                    : _filteredArticles;
                if (articles.isEmpty) {
                  return Center(
                    child: CustomText(
                      text: _searchController.text.isEmpty
                          ? 'No articles to display.'
                          : 'No articles found for "${_searchController.text}"',
                      fontSize: 14.sp,
                    ),
                  );
                }

                return ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  itemCount: articles.length,
                  separatorBuilder: (_, __) => SizedBox(height: 8.h),
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12.r),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ArticleDetailScreen(article: article),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 14.h,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Article icon instead of placeholder
                              Container(
                                width: 100.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? Colors.grey[700]
                                      : Colors.grey[100],
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: isDark
                                        ? Colors.grey[600]!
                                        : Colors.grey[300]!,
                                    width: 1,
                                  ),
                                ),
                                child: Icon(
                                  Icons.article,
                                  size: 40.sp,
                                  color: isDark
                                      ? Colors.blue[300]
                                      : Colors.blue[600],
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Title
                                    CustomText(
                                      text: article.title,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      // prevent overflow
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 6.h),
                                    // Body preview
                                    CustomText(
                                      text: article.body,
                                      fontSize: 13.sp,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
