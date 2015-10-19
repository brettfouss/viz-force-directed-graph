/* PATH TO DATA FILE */
String path = "data1.csv";

/* CONSTANTS */
float ENERGY_THRESHOLD = 0.005;

Graph myGraph;

void setup() {
  size(600, 600);
  surface.setResizable(true);
 
  parse();
}

void parse() {
  
  ArrayList<Node> nodes = new ArrayList<Node>();
  ArrayList<Edge> edges = new ArrayList<Edge>();
  
  String[] lines = loadStrings(path);
  
  int numNodes = Integer.parseInt(lines[0]);
  int numEdges = Integer.parseInt(lines[numNodes + 1]);
  
  /* Initialize all nodes */
  for (int i = 0; i < numNodes; i++) {
    
    /* Rows of data are shifted up one */
    int index = i + 1;
    String[] row = split(lines[index], ",");
    
    int nodeId = Integer.parseInt(row[0]);
    float nodeMass = Float.parseFloat(row[1]);
    
    /* Create node with random initial position */
    Node newNode = new Node(nodeId, nodeMass, null);
    
    nodes.add(newNode);
  }
  
  /* Initialize all edges */
  for (int i = numNodes + 2; i < lines.length; i++) {
    
    String[] row = split(lines[i], ",");
    int nodeId1 = Integer.parseInt(row[0]);
    int nodeId2 = Integer.parseInt(row[1]);
    float restingLength = Float.parseFloat(row[2]);
    
    Node node1 = getNodeById(nodes, nodeId1);
    Node node2 = getNodeById(nodes, nodeId2);
    
    Edge newEdge = new Edge(node1, node2, restingLength);
    
    edges.add(newEdge);
  }
  
  float totalEnergy = 0.0; /* TODO: WHAT HERE??? */
  
  testParser(nodes, edges);
  
  myGraph = new Graph(nodes, edges, totalEnergy, ENERGY_THRESHOLD);
  
}
  
Node getNodeById(ArrayList<Node> nodes, int id) {
  
  for (Node n : nodes) {
    if (n.getID() == id) {
      return n;
    }
  }

  return null;
  
}

void testParser(ArrayList<Node> nodes, ArrayList<Edge> edges) {

  println("");
  println(" === PRINTING ALL NODES === "); 
  
  for (Node n : nodes) {
    println("Node ", n.getID(), " ... ", n.getMass());
  }
  
  println("");
  println(" === PRINTING ALL EDGES === "); 
  
  for (Edge e : edges) {
    println("Edge between Nodes ", e.node1.getID(), 
            " and ", e.node2.getID(), " ... Resting length: ", 
            e.resting_length);
  }

}
 