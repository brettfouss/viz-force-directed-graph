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
  
  
  void animate(){
    for(Node n : nodes){
      Tuple force = new Tuple(0.0, 0.0);
      // force due to Coulomb's law
      for(Node m : nodes){
        force.x += K1 * (n.position.x - m.position.x);
        force.y += K1 * (n.position.y - m.position.y);
      }
      for(Edge e : edges){
        if(n.getID() == e.node1.getID()){
          Tuple t = springForce(n, e.node2, e.resting_length, e.curr_length);
          force.x += t.x;
          force.y += t.y;
        } if (n.getID() == e.node2.getID()){
          Tuple t = springForce(n, e.node1, e.resting_length, e.curr_length);
          force.x += t.x;
          force.y += t.y;
        }

      }
      n.setVelocityX(force.x);
      n.setVelocityY(force.y);
      
      n.move();
    }
  }
  
  Tuple springForce(Node n, Node m, float rl, float cl){
    float delta_x = n.position.x - m.position.x;
    float delta_y = n.position.y - m.position.y;
    float delta_length = cl - rl;
    float theta = atan(delta_y / delta_x);
    
    Tuple force = new Tuple(K1 * delta_length * cos(theta), 
                            K1 * delta_length * sin(theta));
    return force;
  }
  
  void render(){
    for (Edge e : edges){
       e.render(); 
    }
    for (Node n : nodes){
       n.render();
    }

  }
  
  
  
  
  
  
}