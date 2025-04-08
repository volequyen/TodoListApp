class DataItem{
  final String id;
  final String name;
  DataItem({
    required this.id, 
    required this.name});

  itemMap(){
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['name'] = name;
    return mapping; 
  }
}