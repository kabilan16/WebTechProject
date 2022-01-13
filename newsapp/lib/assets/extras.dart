
import 'package:newsapp_project/models/categorymodel.dart';

List<CategoryModel> getCategories()
{
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = new CategoryModel();
  categoryModel.categoryName="Business";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1612550761236-e813928f7271?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YnVzc2luZXNzfGVufDB8fDB8fA%3D%3D&w=1000&q=80";
  category.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.categoryName="Sports";
  categoryModel.imageUrl="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbDc5X3OjHsqcXLdXuFHSqj8_ZyeLmAVGBDg&usqp=CAU";
  category.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.categoryName="Technology";
  categoryModel.imageUrl="https://content.thriveglobal.com/wp-content/uploads/2018/01/techandsuccess.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.categoryName="Entertainment";
  categoryModel.imageUrl="https://www.ipsos.com/sites/default/files/ct/news_and_polls/2021-05/friends-watching-tv-eating-popcorn.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.categoryName="General";
  categoryModel.imageUrl="https://www.newsdrives.com/wp-content/uploads/2020/09/crowded-street-yellow.2e16d0ba.fill-1524x683-1.jpg";
  category.add(categoryModel);
  return category;
}
