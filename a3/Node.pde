class Node {
  int id;
  float mass;
  Tuple position;
  float x_velocity;
  float y_velocity;  

  // Tuple force;
  // Edge[] edges;
  
  Node (int _id, float _mass, Tuple _position) {
    id = _id;
    mass = _mass;
    
    /* Client has option of creating node with
     * random position
     */
    if (_position == null) {
      
      float randomX = (float)(Math.random() * width);
      float randomY = (float)(Math.random() * height);
      
      position = new Tuple (randomX, randomY);
      
    } else {
      position = _position; 
    }
    
  }
  
  int getID() {
    return id;
  }
  
  float getMass(){
    return mass; 
  }

  // gives the magnitude of the total velocity
  float getVelocity() {
    return sqrt(sq(x_velocity) + sq(y_velocity));
  }
  
  void render(){
    
  }
}