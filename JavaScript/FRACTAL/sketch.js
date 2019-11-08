function setup() {
  createCanvas(2000, 1000);
  noLoop();
}

function draw() {
  background(0);
  let iterationMax = 50
  let pas = 0.001;
  
  // let nbElemLimite = 4/pas;

  for (let i = 0; i < width; i++) {
    for (let j = 0; j < height; j++) {
      let iteration = 0;
      let z = createVector(0, 0);

      while((z.x*z.x + z.y*z.y < 4) && (z.x*z.x + z.y*z.y > -4) && (iteration < iterationMax)){
        let tempX = z.x;
        z.x = z.x*z.x - z.y*z.y + i*pas-1;
        z.y = 2*tempX*z.y + j*pas-1;
        iteration ++;
      }

      if(iteration == iterationMax){ 
        stroke(220);
        point(i,j);
      } else {
        stroke(0);
        point(i,j);
      }
    }
  }
  



}