class Node {
  int id;
  float mass;
  Tuple position;
  Tuple velocity;
  
  boolean highlighted;

  // Tuple force;
  // Edge[] edges;
  
  Node (int _id, float _mass, Tuple _position) {
    id = _id;
    mass = _mass;
    

    velocity = new Tuple (0.0, 0.0);
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
    return sqrt(sq(velocity.x) + sq(velocity.y));
  }
  
  void setVelocityX(float f){
    float acceleration = f / mass;
    velocity.x = velocity.x + (acceleration * TIME);
  }
  
  void setVelocityY(float f){
    float acceleration = f / mass;
    velocity.y = velocity.y + (acceleration * TIME); 
  }
  
  void move(){
    position.x += velocity.x;
    position.y += velocity.y;
  }
  
  void render(){
    
    if(highlighted) fill(0, 255, 0);
    else fill(135, 206, 250);
    ellipse(position.x, position.y, NODE_RADIUS, NODE_RADIUS);
  }
}