class Edge {
  Node node1, node2;
  float curr_length, resting_length;
  
  Edge(Node _node1, Node _node2, float _resting_length){
    node1 = _node1;
    node2 = _node2;
    resting_length = _resting_length;
    setCurrLength();
  }
  
  void setCurrLength(){
    curr_length = dist(node1.position.x, node1.position.y, node2.position.x, node2.position.y);
  }
  
  float getCurrLength(){
    return curr_length;
  }
  
  void render(){
    fill(0);
    line(node1.position.x, node1.position.y, node2.position.x, node2.position.y);
  }
  
}