class Graph {
  float energy, threshold;
  ArrayList<Node> nodes;
  ArrayList<Edge> edges;
  
  Graph(ArrayList<Node> _nodes, ArrayList<Edge> _edges,
            float _energy, float _threshold) {
  
    nodes = _nodes;
    edges = _edges;
    energy = _energy;
    threshold = _threshold;
  
  }
  
  void setEnergy(float _energy){
    energy = _energy;
  }
  
  void totalEnergy(){
    for(Node n : nodes){
      energy += (0.5 * n.getMass() * sq(n.getVelocity()));
    }
  }
  
  
  
  
  
  
}